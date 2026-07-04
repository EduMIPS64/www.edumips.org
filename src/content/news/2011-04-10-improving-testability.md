---
title: "Improving testability"
date: 2011-04-10
kind: note
source: https://edumips64.blogspot.com/2011/04/improving-testability.html
excerpt: "Before adding new features, the EduMIPS64 team decided to first build a test suite, looking at how other CPU simulators like SPIM approached testing for inspiration."
---

There are a lot of features that can be integrated or implemented, but we feel that the first thing to do is to create a test suite, in order to be fairly confident that when we change something we do not break anything! After all, people use EduMIPS64 during their exams, and I don't want that someone gets a bad grade (and consequently tries to kill me) because of bad code.

A CPU simulator can be tested in many ways. The main decision we have to make is whether we should do black-box testing (overall functionality) or white-box testing (Java classes, individual or in small sets). So we looked at other CPU simulators in order to see how they solved this problem.

We've been looking at WinMIPS64, WinDLX and DLXView, but found no answer to our questions.

But when we turned to the [SPIM MIPS32 Simulator](http://spimsimulator.sourceforge.net/), we found a very rich test suite. It is not surprising, as its author, [James Larus](http://pages.cs.wisc.edu/~larus/larus.html), is very smart and wrote a really good presentation on [Why write real software in Academia?](http://pages.cs.wisc.edu/~larus/Talks/why_real/index.htm) (suggested reading for people in academia who happen to write software). The simulator is also featured in [Appendix A](http://pages.cs.wisc.edu/~larus/HP_AppA.pdf) of Hennessy & Patterson's "Computer Architecture: A quantitative approach", a reference book in the field, so it is definitely a good reference and inspiration source.

The Tests directory of SPIM contains 8 assembly test files that, together, amount to ~8500 lines of testing code. It is assembly code, so it is black-box testing.

We can try to reuse some of them, skipping some features (like FPU) and writing some new tests, as we implement a superset of their instruction set, even if the computation model is a bit different (we don't have memory/mapped IO, control registers and other few things).

There is a problem, however: EduMIPS64 is meant to be run as a desktop interactive application, and cannot be run in a CLI and in batch mode.

So we are trying to remove the few dependencies that the core of the simulator has with respect to the User Interface, that are poor design choices, and write a very small CLI frontend for the core, so that the CPU features can be tested without running the UI.

After that, we will try to port some testing code from SPIM to EduMIPS64, adding our own tests.

We will then be ready to integrate and add features to the simulator, knowing that we have a safety net that will catch most of the errors and will allow us to write code without breaking the core features in any (obvious) way.
