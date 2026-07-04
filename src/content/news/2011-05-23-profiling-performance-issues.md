---
title: "Profiling performance issues"
date: 2011-05-23
kind: note
source: https://edumips64.blogspot.com/2011/05/profiling-performance-issues.html
excerpt: "After noticing the simulator had become considerably slower, the EduMIPS64 team used the YourKit Java Profiler (kindly provided free for open source projects) to find and start fixing bottlenecks."
---

After some recent changes to the logging code and to the help system, I noticed that the startup of the simulator and its normal operations were **considerably** slower than the older version. After a bit of search by trial-and-error, I told to myself that I had to use a more scientific method and try to profile the application with a profiler.

So I started searching for a profiler for Java, and I found the [YourKit Java Profiler](http://www.yourkit.com/), and it seemed to be what I was searching for. I briefly tried it and, thanks to the "HotSpot" feature, I immediately found a bottleneck (formatting the log messages even when they are discarded), so I asked them if they would provide free licenses for open source developers; I then discovered that YourKit is kindly supporting open source projects with free licenses of its full-featured Java Profiler.

YourKit profilers are produced by YourKit, LLC: they produce both a [Java](http://www.yourkit.com/download/index.jsp) and a [.NET](http://www.yourkit.com/dotnet/download/index.jsp) profiler. Of course I only briefly tried the Java profiler, and I can tell you that it was really easy to spot that obvious bottleneck. I'm going to spend some time to profile EduMIPS64 and remove the most prominent bottlenecks.
