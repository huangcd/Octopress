--- 
categories: []
comments: true
layout: post
published: true
status: publish
tags: []
title: grep帮助
type: post
---
Usage: grep [OPTION]... PATTERN [FILE] ...
Search for PATTERN in each FILE or standard input.
Example: grep -i 'hello world' menu.h main.c

Regexp selection and interpretation:
-E, --extended-regexp PATTERN is an extended regular expression
-F, --fixed-strings PATTERN is a set of newline-separated strings
-G, --basic-regexp PATTERN is a basic regular expression
-P, --perl-regexp PATTERN is a Perl regular expression
-e, --regexp=PATTERN use PATTERN as a regular expression
-f, --file=FILE obtain PATTERN from FILE
-i, --ignore-case ignore case distinctions
-w, --word-regexp force PATTERN to match only whole words
-x, --line-regexp force PATTERN to match only whole lines
-z, --null-data a data line ends in 0 byte, not newline

Miscellaneous:
-s, --no-messages suppress error messages
-v, --invert-match select non-matching lines
-V, --version print version information and exit
--help display this help and exit
--mmap use memory-mapped input if possible
