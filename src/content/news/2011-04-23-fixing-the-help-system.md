---
title: "Fixing the help system"
date: 2011-04-23
kind: note
source: https://edumips64.blogspot.com/2011/04/fixing-help-system.html
excerpt: "The EduMIPS64 user documentation, split across a LaTeX-based PDF manual and a separate in-application text help, needed a single source with multiple outputs; the team explored Sphinx and reStructuredText to fix it."
---

Currently, the EduMIPS64 user documentation is in bad shape. There are two different sources of documentation:

- The PDF manual, built from LaTeX files;
- The in-application help, made by (.. drum roll ..) text files.

Both help sources are available in English and Italian. But this diversity means that there are two (actually, four) different places to update; moreover, the in-application help is really not adequate and a bit too simple.

Some time ago, we tried porting the help system to JavaHelp, but we didn't finish the porting and had some trouble in properly converting LaTeX to HTML. Moreover, JavaHelp seems to be dead.

So I [asked a question on Stack Overflow](http://stackoverflow.com/questions/5608231/user-manual-for-java-software-in-application-help-pdf), and I got two answers:

- convert LaTeX to ePub and embed an open source ePub viewer;
- use RTF in a JTextPane.

To summarize, our requirements for the help system are the following:

- single source, multiple outputs (PDF, in-application help);
- in-application viewer;
- _optional_ search in the in-application help;
- _optional_ navigation pane in the in-application help.

I have been playing a bit with the [Sphinx](http://sphinx.pocoo.org/) documentation system, and I got two good PDF and single-html outputs, but then the problem was to display HTML in the application. The JEditorPane widget has some basic support for HTML and CSS, but it is way too basic. I'd had to heavily customize the output of Sphinx and I don't want to spend much time on it. Further, using a basic viewer I'd drop the two optional requirements (search and navigation), or I'd have to code it - boring.

So we are going to try the LaTeX -> epub road, hoping that it works out nicely. In our idea, the new help system should be the only new feature in EduMIPS64 0.5.3.

**EDIT:** We settled with converting the documentation to [reStructured Text](http://docutils.sourceforge.net/rst.html) and using Sphinx to output both the PDF and a multi-page HTML document, using the epub HTML theme; this HTML docs were then processed with [jHelpDev](http://sourceforge.net/projects/jhelpdev/) to build a help set for [JavaHelp](http://javahelp.java.net/), that even if it is not actively developed, seems to work well - maybe it is a bit slow but works. So probably 0.5.3 will have in-app help based on JavaHelp and with the same contents of the PDF manual.
