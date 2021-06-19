---
layout: post
title: Running CPP and JS Kernel in Deepnote Jupyter Notebook
date: 2021-06-19 17:19 +0530
categories: tools
author: themythicalengineer
tags: development jupyter docker deepnote
comments: true
blogUid: "b469d42a-bb71-4c8d-9016-487178ca7010"
---
If you need to work with a language other than Python, the Jupyter ecosystem offers a wide range of other kernels.
Deepnote supports a lot of them!

[Deepnote Official documentation](https://docs.deepnote.com/environment/custom-environments/running-your-own-kernel) has instructions on setting up R, Julia, Bash, Scala and Ruby.

I was recently attempting to set up a [C++](https://root.cern/cling/) and [Javascript](https://github.com/n-riesco/ijavascript) kernels and finally figured out how to make it work. You can read more about [Interactive CPP with Cling](https://blog.llvm.org/posts/2020-11-30-interactive-cpp-with-cling/).

## Dockerfile for C++ Kernel 
```bash
FROM deepnote/python:3.9
RUN apt-get update && \
    apt-get install -y g++ libtinfo5
RUN pip install jupyter-console
RUN wget https://root.cern.ch/download/cling/cling_2020-11-05_ROOT-ubuntu18.04.tar.bz2 && \
    tar -xf cling_2020-11-05_ROOT-ubuntu18.04.tar.bz2 && \
    cd cling_2020-11-05_ROOT-ubuntu18.04/share/cling/Jupyter/kernel && \
    pip install -e . && \
    jupyter-kernelspec install --user cling-cpp17
ENV PATH="cling_2020-11-05_ROOT-ubuntu18.04/bin:$PATH"
RUN jupyter console --kernel cling-cpp17
ENV DEFAULT_KERNEL_NAME "cling-cpp17"
```

![Configure Dockerfile](/assets/images/running-cpp-and-js-kernel-deepnote/configure_dockerfile.webp)

After the completion of the build, you can execute C++ in the deepnote notebook.

![CPP Example](/assets/images/running-cpp-and-js-kernel-deepnote/deepnote_cpp_example.webp)

### Some things that don't work in this version, but maybe supported in upcoming versions of the kernel

> 👉 1. Function redefinitions are not allowed. [Issue Link] (https://github.com/jupyter-xeus/xeus-cling/issues/91)

> 👉 2. You cannot define more than one function in a block. [Issue Link](https://github.com/jupyter-xeus/xeus-cling/issues/40)

You can also try to [build the latest version](https://root.cern/cling/cling_build_instructions/) and try out these features.

<br/>

[IJavascript](https://github.com/n-riesco/ijavascript) is a Javascript kernel for the Jupyter notebook.
I used the commands provided on the official repository of the project to create this Dockerfile.

## Dockerfile for Javascript Kernel

```bash
FROM deepnote/python:3.9
RUN pip install jupyter-console
RUN apt-get update && apt-get install -y g++ libzmq3-dev nodejs npm
RUN npm install -g --unsafe-perm ijavascript
RUN ijsinstall --install=global
RUN jupyter console --kernel javascript
ENV DEFAULT_KERNEL_NAME "javascript"
```

Follow the same process as above for configuring the environment and you're ready to run Javascript in Deepnote Notebook.

![JS Example](/assets/images/running-cpp-and-js-kernel-deepnote/deepnote_js_example.webp)
