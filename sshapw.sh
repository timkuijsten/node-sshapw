#!/bin/sh

myname=`basename $0`

# create tmp files for the password and salt
tmpfile1=`mktemp "$myname.XXXXXXXXXXXX"` || exit 1
tmpfile2=`mktemp "$myname.XXXXXXXXXXXX"` || exit 1
tmpfile3=`mktemp "$myname.XXXXXXXXXXXX"` || exit 1

# save terminal state
stty_state=$(stty -g)

/bin/echo -n "password (terminate with ^dd): "
stty -echo
cat - > "$tmpfile1"
stty "$stty_state"
echo ""

if [ ! -s "$tmpfile1" ]; then
  echo 'password can not be empty' 1>&2;
  rm "$tmpfile1" "$tmpfile2" "$tmpfile3"
  exit 2;
fi

/bin/echo -n "repeat password (terminate with ^dd): "
stty -echo
cat - > "$tmpfile2"
stty "$stty_state"
echo ""

cmp "$tmpfile1" "$tmpfile2" >/dev/null
if [ "$?" -ne "0" ]; then
  echo 'passwords are not equal' 1>&2;
  rm "$tmpfile1" "$tmpfile2" "$tmpfile3"
  exit 3;
fi

# create a random 12 byte salt
dd bs=$((12)) count=1 if=/dev/urandom 2>/dev/null > "$tmpfile3"
if [ "$?" -ne "0" ]; then
  echo 'could not extract random bytes' 1>&2;
  rm "$tmpfile1" "$tmpfile2" "$tmpfile3"
  exit 4;
fi

# store binary sha hash in file2
cat "$tmpfile1" "$tmpfile3" | openssl dgst -binary -sha1 > "$tmpfile2"

echo "{SSHA}`cat "$tmpfile2" "$tmpfile3" | openssl base64`"

rm "$tmpfile1" "$tmpfile2" "$tmpfile3"
