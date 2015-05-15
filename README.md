# sshapw

Echo a salted sha1 hash that can be used for dovecot and nginx.

## Example

Create a password with a random salt.

    $ sshapw
    password: 
    repeat password: 
    {SSHA}aAgZV8uMFd5+yZJ0AKMZDq7ZbO/c6OrcE4Uy0wlp9UN89/bNIKTGN3Uy1h/r22FyOtLxyg==

## Installation

    $ sudo npm install -g sshapw

## Todo
* create an option to verify a given hash
* write some tests

## License

ISC

Copyright (c) 2015 Tim Kuijsten

Permission to use, copy, modify, and/or distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
