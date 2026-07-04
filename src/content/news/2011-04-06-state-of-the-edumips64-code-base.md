---
title: "State of the EduMIPS64 code base"
date: 2011-04-06
kind: note
source: https://edumips64.blogspot.com/2011/04/state-of-edumips64-code-base.html
excerpt: "In 2006, a small group of undergraduate students at the University of Catania, unsatisfied with existing MIPS64 simulators, decided to design and write their own. This post is a snapshot of the EduMIPS64 code base as of April 2011."
---

In 2006, a small group of undergraduate students at the University of Catania was taking a course in Computer Architecture; they were not satisfied by existing MIPS64 simulators, so they decided to design and write their own simulator. They called it EduMIPS64 (web site: [www.edumips.org](http://www.edumips.org/)), and it was initially conceived as an improved Java clone of [WinMIPS64](http://www.computing.dcu.ie/~mike/winmips64.html).

Most of the development happened between April and October 2006. Then, development slowed down a bit because the main functionalities were working and the simulator had been adopted as the official tool for Computer Architecture courses at the University of Catania.

There have been a moderate but constant activity through all 2007 and then, finally, in 2008 development came to an halt. The simulator was more mature, but many things still need improvement. Some important features, like FPU support and branch delay slot, have been developed but not released because the code needed to be polished, documented and tested.

This blog post wants to take a snapshot of the current state of the EduMIPS64 code base, in order to facilitate future development efforts.

**The current stable version**

The last version of EduMIPS64, 0.5.2, was released on 17th April of 2008, and like version 0.5.1 it is mainly a bug-fix release. Version 0.5 was the last major version, i.e. a version that introduced new features (namely, MIPS32 instructions and a few other things).

It can be considered quite stable, as the simulator is routinely used at least at the University of Catania for Computer Architecture exams, and no bugs were reported in the last 3 years.

**The trunk**

The trunk contains an implementation of the FPU, with a complete FP instruction set, visual representation of FP-related sections of the pipeline. Moreover, it contains a (non-working) attempt to add in the help a conversion to HTML of the PDF manual.

**The branches**

- delayslot: contains an implementation of the [Branch delay slot](http://en.wikipedia.org/wiki/Branch_delay_slot);
- editor: contains a (very) basic prototype of a built-in editor;
- new_parser: a re-engineered parser written to replace the default one, that is difficult to mantain. It was developed as a student project for a Compilers course;
- cache: a re-engineered parser written to replace the one written during the development;
- 0.5: branch where development of the 0.5 series should go.

Of these branches, delayslot, new_parser and cache are the ones that most likely will be included in future stable releases.

**A note on testability**

One of the problems of the EduMIPS64 code base is the lack of automated testing. When we developed it, we were mostly concerned with making it work, and as students it was an ambitious project. We worked day and night and fixed issues when they were raised, either by developers or by users, but we did not fully understand some basic concepts like unit testing, separation of intents, modularity etc.

Future development work needs to be addressed to a suite of unit tests that will work as a safety net for regressions as the development goes on.

**Future development**

There are many features that are almost ready but have been never released to the public, like the FPU or the branch delay slot.

It is likely that a new version of EduMIPS64, 0.5.3, will be released shortly. It will include some bug fixes and the ability to enable the branch delay slot, in order to get some user feedbacks on it.

After this, probably a 0.9 version with FPU will be released, and this version will also need to be heavily tested by users before a 1.0 stable version will be released.
