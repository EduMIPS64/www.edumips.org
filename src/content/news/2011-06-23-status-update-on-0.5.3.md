---
title: "Status update on 0.5.3"
date: 2011-06-23
kind: note
source: https://edumips64.blogspot.com/2011/06/status-update-on-053.html
excerpt: "EduMIPS64 0.5.3 is almost ready thanks to bug reports from Computer Architecture students at the University of Catania; only a Mac OS X regression remains before release."
---

The version 0.5.3 of EduMIPS64 is almost ready. Thanks to the students of the Computer Architecture course at the University of Catania I was able to find and fix some bugs (see the [temporary ChangeLog](http://www.edumips.org/browser/branches/0.5/ChangeLog?rev=597)).

I also cleaned up the configuration of Trac on edumips.org and started using its ticket tracking features. [Here](http://www.edumips.org/roadmap) is reported the project roadmap (with no due dates) and [here](http://www.edumips.org/report/6) are all the tickets (including closed ones), grouped by milestone.

I moved two tickets that need more time to 0.5.4, so for releasing 0.5.3 only two bugs need to be addressed. The problem is that [one](http://www.edumips.org/ticket/8) of them is related to the Mac OS X platform, and I don't have a Mac to work on it. People have been reproducing it on different versions of Mac OS X, and it is obviously a regression because version 0.5.2 shows no issues.

I hope that I'll get my hands on a Mac OS X in the near future and try to debug this issue. If you have one, please contact me.

In the next week, I won't have any time for the project, but I hope to start working on it on July.
