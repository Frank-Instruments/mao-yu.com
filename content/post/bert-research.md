+++
author = "Maoserr"
autoCollapseToc = false
categories = ["bert guide"]
comment = false
contentCopyright = false
date = 2020-06-06T17:10:00Z
description = ""
draft = true
hiddenFromHomePage = false
hideHeaderAndFooter = false
keywords = []
lastmod = ""
mathjax = false
mathjaxEnableAutoNumber = false
mathjaxEnableSingleDollar = false
postMetaInFooter = false
reward = false
tags = []
title = "Bert Model Guide"
toc = true
[flowchartDiagrams]
enable = false
options = ""
[sequenceDiagrams]
enable = false
options = ""

+++
# Using Google's Bert Model

Google's Bert model can be used for various NLP related tasks, this series of article documents my experiences.

## Background

[https://blog.usejournal.com/part1-bert-for-advance-nlp-with-transformers-in-pytorch-357579d63512](https://blog.usejournal.com/part1-bert-for-advance-nlp-with-transformers-in-pytorch-357579d63512 "Transformers Tutorial")

How to batch, shuffle repeat

[https://www.tensorflow.org/guide/data](https://www.tensorflow.org/guide/data "https://www.tensorflow.org/guide/data")

But try not to use large batch sizes since it will overfit the data. People commonly use mini-batch sizes of `32, 64, 128, 256, 512, 1024, 2048`.

@eggie5 having a bigger batch size results to a lower variance of the model, since what the model learns is the "general" trend in your entire dataset. This is good for convex optimization problems. However, if you have a highly non convex optimization problem, meaning there are a lot of local minima in your loss function, it's better to choose a smaller batch size. This will effectively make your model jump out of a local minima. It also results to a faster training time. So a small enough batch size ensures you don't get stuck in a local minima, but big enough to remain in a global minima

Small batches can offer a regularizing effect (Wilson and Martinez, 2003), perhaps due to the noise they add to the learning process. Generalization error is often best for a batch size of 1. Training with such a small batch size might require a small learning rate to maintain stability because of the high variance in the estimate of the gradient. The total runtime can be very high as a result of the need to make more steps, both because of the reduced learning rate and because it takes more steps to observe the entire training set.

[http://www.deeplearningbook.org](http://www.deeplearningbook.org "http://www.deeplearningbook.org")