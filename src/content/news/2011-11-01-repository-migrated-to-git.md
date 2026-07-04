---
title: "Repository migrated to git"
date: 2011-11-01
kind: note
source: https://edumips64.blogspot.com/2011/11/repository-migrated-to-git.html
excerpt: "The EduMIPS64 source code repository was converted from SVN to git and pushed to both Google Code and GitHub, with GitHub soon becoming the main repository."
---

The EduMIPS64 source code repository, hosted at svn.edumips.org, has been converted to git.

So far, the repository contents have been migrated to git using the method described in [Pro Git](http://progit.org/book/ch8-2.html), and the resulting git repository has been pushed to [Google Code](http://code.google.com/p/edumips64/) and [Github](https://github.com/lupino3/edumips64).

The next step is to create a git repository on edumips.org and configure Trac and Apache in order to let them serve the git repository. Most probably, the SVN repository will be removed.

**EDIT:** the github repository is now the main one. There will be no repository hosted on edumips.org.
