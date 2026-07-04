---
title: "Finding bugs via bisection"
date: 2011-09-17
kind: note
source: https://edumips64.blogspot.com/2011/09/finding-bugs-via-bisection.html
excerpt: "A nasty bug broke EduMIPS64 under Mac OS X Snow Leopard; with 187 SVN commits to check, the team used bisection to narrow it down to the offending commit in about 10 update/compile/test cycles."
---

In the last version of EduMIPS64, we introduced a [nasty bug](http://www.edumips.org/ticket/8) that caused the simulator to stop working under Mac OS X Snow Leopard. Now we will not delve into the usual sayings about Java being "write once, debug everywhere", but instead we will show you how we actually identified the commit that introduced the bug.

The bug was discovered during the development of version 0.5.3, and the problem is that we don't have access to Mac OS X machines for testing, so usually we develop under Linux and sometimes we test also under Windows. So when one of the users reported the bug for version 0.5.3-rc2 we had no idea of which commit could have introduced the bug.

The stack trace wasn't helpful, just a StackOverflowError with lots of nested AWT/Swing calls, there was no pointer to the EduMIPS64 source code.

So when last week we could use a Snow Leopard machine to find and fix the bug, we had the problem to first identify the incriminated commit. The SVN revision of 0.5.2 is 436, while the last revision was 623. So there are 187 commits to check.. how to do it (possibly avoiding brute force)?

Enter **bisection**.

Bisection is a technique similar to binary search. You have a _good_ version (rev. 436) and a _bad_ version (rev. 623). What you do is to move at revision _(good + bad) / 2_, check if it is working or not, mark it as _good_ or _bad_ and repeat the process until the distance between _good_ and _bad_ is 1. This means that you have identified the change that made your _good_ program a _bad_ program.

You will recognize a familiar pattern here: you are always halving the distance to the objective. This means that you will be able to identify the culprit in log2(_good - bad_). In our case, log2(623-436) = 10 (rounding up the result). This means that in at most 10 update/compile/test cycles we will find our bug, provided that we can easily and without hesitation say if each version is _good_ or _bad_. And in our case a _bad_ version means that the simulator is totally hung up, so it is easy.

So, we started from (623 + 436) / 2 = 530, and this is the path that we followed: 530 (_good_, ↑), 576 (_bad_, ↓), 553 (_bad_, ↓), 541 (_bad_, ↓), 535 (_bad_, ↓), 532 (_good_, ↑), 534 (_bad_, ↓), 533 (_bad_, ↓). So the commit that introduced the bug is [533](http://www.edumips.org/changeset/533/). We "simply" had to figure out what is the bug.

Turns out that commit 533 is a bad commit in itself, because it packs several changes at a time (introduction of a singleton, changes to the buildfile and to the logging system setup). So we spent half an hour with the singleton only to find out that the problem was that the JVM of Snow Leopard didn't appreciate that we tried to get the root logger by calling Logger.getLogger() with an empty string as a parameter (as shown in the [official docs](http://download.oracle.com/javase/1,5.0/docs/guide/logging/overview.html), even if we couldn't find this document for version 6). Using another logger instead of the root logger [solved the problem](http://www.edumips.org/changeset/624/).

By the way, if we used git (and we will migrate to it shortly), we could have used the wonderful command `git bisect`.

So, lessons learned:

- use bisection to find a commit that introduced a bug, if you can easily tell if a commit contains or not the bug;
- try to limit what you change in a commit, so that later it is easy to find what's wrong in that commit;
- use git because it helps you in doing both those things. :)

Enjoy!
