---
title: "Towards a JavaScript port of EduMIPS64"
date: 2016-06-21
kind: note
source: https://edumips64.blogspot.com/2016/06/towards-javascript-port-of-edumips64.html
excerpt: "Ten years after choosing Java to make EduMIPS64 cross-platform, the team cross-compiled the simulator core to JavaScript with GWT/JsInterop, publishing a crude proof-of-concept web UI for the project's 10th anniversary."
---

### 10 years ago

The original goal of EduMIPS64 was running from every (student) computer, across different operating systems, by installing as few dependencies as possible. 10 years ago, the way we identified to reach this goal, thanks to the suggestion of our teacher, [Fabrizio Fazzino](http://www.fazzino.it/), was to implement the simulator in Java and make sure it would run as a web applet.

10 years ago, Java was an easy choice if you wanted to develop a desktop application that would run across operating systems **and** on a web browser. JavaScript was already there, but its ecosystem was not very well developed. So we went ahead and implemented it all in Java + Swing.

EduMIPS64, indeed, today can run as a desktop application and also as a Java applet, if you really want.

But, in all honesty, it is **very** cumbersome to run EduMIPS64 (or anything else) as a Java applet. The user interface does not adapt well to a web page, since it's exactly the same one of the desktop application. Let's not even mention running on mobile.

### Today

Today, the easy choice to develop an application that should run across operating system **and** run on a web browser is HTML5 + JavaScript. There is a thriving ecosystem of client-side JS frameworks, and HTML5 itself offers lots of interesting primitives.

If we had to start today, we would probably just write the core in (typed?) JavaScript, and use the _framework-du-jour_ (Angular? Polymer? React?) to build the UI. But we are not starting today, and we actually have thousands of lines of perfectly (hah) working Java code for the simulator: we don't want to rewrite that.

Therefore, to further proceed towards the original vision of EduMIPS64 without wasting all our existing work, in the last months we have been working towards cross-compiling the EduMIPS64 core to JavaScript, to make it possible to develop an HTML5+JavaScript web UI for it.

Finally, today we have finalized a very crude proof-of-concept, that demonstrates running the EduMIPS64 core behind a highly simplistic user interface. It is reachable at the following URL:

[www.edumips.org/edumips64.html](http://www.edumips.org/edumips64.html)

### Technical details

The cross-compilation was executed using [Google Web Toolkit](http://www.gwtproject.org/) (GWT), and more specifically the [JsInterop](https://docs.google.com/file/d/0ByS1wxINeBWjeGYxbkJpamxFZ28/edit) features present in GWT 2.8.0 (SNAPSHOT version).

The EduMIPS64 code was not exactly ready for this. GWT supports a subset of the libraries in the standard JDK, and things like Swing or java.io are not present there. So we had - of course - to completely scrap away the Swing code, but also had to deal with more surprising omissions like java.io.BufferedReader, java.util.regex and other libraries used here and there in the simulator.

This is not a client-server application. The core part of the simulator is cross-compiled to JavaScript, and it all runs on the client. The console logs are littered with all the simulator logs, so the activity is visible there.

### What next?

I consider this a small "present" for myself for the 10 years of EduMIPS64. I had this idea in mind for years, but never found the time or willpower to work on it. The idea that 10 years passed since we started working on the simulator was a trigger to work on this small project.

The current proof of concept is absolutely inadequate to use in classrooms, so a proper web interface now needs to be developed. I would imagine that a first milestone would be implementing a minimum, critical subset of features to make the new web interface acceptable for classroom use.

But the fun will come after that. Using web technologies opens up several new possibilities, including - for example - a good mobile experience, sharing sessions among users (real-time collaboration!), integration with cloud storage providers, and - of course - a more modern UI with a decent look-and-feel.

There is no concrete plan to deliver all this, but some things are happening in the background, with other people potentially interested in this project, so stay tuned for updates! If you are interested in working on this, please get in touch with [me on Github](http://github.org/lupino3).

Oh.. and... happy birthday EduMIPS64! You turned 10 at some point between March and April 2016 (depending on how we count). :)
