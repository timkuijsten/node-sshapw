#!/usr/bin/env node

/**
 * Copyright (c) 2015 Tim Kuijsten
 *
 * Permission to use, copy, modify, and/or distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */

'use strict';

var program = require('commander');
var read = require('read');
var ssha = require('ssha');

program
  .version(require('./package.json').version)
  .usage('sshapw')
  .description(require('./package.json').description)
  .parse(process.argv);

read({ prompt: 'password:', silent: true }, function(err, password) {
  if (err) { console.error(err.message); process.exit(2); }

  if (!password.length) {
    console.log('password can not be empty');
    process.exit(3);
  }

  read({ prompt: 'repeat password:', silent: true }, function(err, password2) {
    if (err) { console.error(err.message); process.exit(4); }

    if (password !== password2) {
      console.log('passwords are not equal');
      process.exit(5);
    }

    var hash = ssha.create(password);

    console.log(hash);
    process.exit();
  });
});
