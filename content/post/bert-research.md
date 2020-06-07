+++
author = "Maoserr"
autoCollapseToc = false
categories = []
comment = false
contentCopyright = false
date = ""
description = ""
draft = true
hiddenFromHomePage = false
hideHeaderAndFooter = false
keywords = []
lastmod = 2020-06-06T17:10:11Z
mathjax = false
mathjaxEnableAutoNumber = false
mathjaxEnableSingleDollar = false
postMetaInFooter = false
reward = false
tags = []
title = "Bert Research"
toc = false
[flowchartDiagrams]
enable = false
options = ""
[sequenceDiagrams]
enable = false
options = ""

+++
[https://blog.usejournal.com/part1-bert-for-advance-nlp-with-transformers-in-pytorch-357579d63512](https://blog.usejournal.com/part1-bert-for-advance-nlp-with-transformers-in-pytorch-357579d63512 "Transformers Tutorial")

How to batch, shuffle repeat

[https://www.tensorflow.org/guide/data](https://www.tensorflow.org/guide/data "https://www.tensorflow.org/guide/data")

But try not to use large batch sizes since it will overfit the data. People commonly use mini-batch sizes of `32, 64, 128, 256, 512, 1024, 2048`.

  
@eggie5 having a bigger batch size results to a lower variance of the model, since what the model learns is the "general" trend in your entire dataset. This is good for convex optimization problems. However, if you have a highly non convex optimization problem, meaning there are a lot of local minima in your loss function, it's better to choose a smaller batch size. This will effectively make your model jump out of a local minima. It also results to a faster training time. So a small enough batch size ensures you don't get stuck in a local minima, but big enough to remain in a global minima