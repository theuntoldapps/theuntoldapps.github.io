---
layout: post
title: "Running Rust Kernel in Deepnote"
date: 2023-03-17 06:52 +0530
categories: development
author: themythicalengineer
tags: development jupyter docker deepnote rust
comments: false
blogUid: 7bf41c74-858b-4ed8-95e0-239936d64e81
---
![deepnote-rust-banner](/assets/images/running-rust-kernel-deepnote/deepnote_rust_banner.webp)

If you need to work with a language other than Python, the Jupyter ecosystem offers a wide range of other kernels. [Deepnote](https://deepnote.com/) supports a lot of them!

[Deepnote Official documentation](https://docs.deepnote.com/environment/custom-environments/running-your-own-kernel) has instructions on setting up R, Julia, Bash, Scala and Ruby.

I tried to set up a [Rust](https://github.com/evcxr/evcxr) kernel and it works well in Deepnote. You can use the provided custom Dockerfile in your environment and you can run rust in Deepnote.

## Dockerfile for Rust Kernel 
```docker
FROM deepnote/python:3.10
RUN apt-get update -y
RUN curl https://sh.rustup.rs -sSf > install_rust.sh
RUN bash install_rust.sh -y
ENV PATH="/root/.cargo/bin:${PATH}"
RUN cargo --help
RUN cargo install evcxr_jupyter
RUN rustup component add rust-src
RUN pip install jupyter-console
RUN evcxr_jupyter --install
RUN jupyter kernelspec list
RUN jupyter console --kernel rust
ENV DEFAULT_KERNEL_NAME "rust"
```

After the completion of the build, you can execute `Rust` in the deepnote notebook.

![Rust Example](/assets/images/running-rust-kernel-deepnote/deepnote_rust_example.webp)


It's a little rusty right now as it throws a `SIGKILL` error sometimes. 

```rust
Error: Subprocess terminated with status: signal: 9 (SIGKILL)
```
![Rust SIGKILL Error](/assets/images/running-rust-kernel-deepnote/deepnote_rust_sigkill.webp)


You can check out my older blog post explaining use of `C++` and `Javascript` Kernel in Deepnote.

* [Running CPP and JS Kernel in Deepnote Jupyter Notebook](https://themythicalengineer.com/running-cpp-and-js-kernel-deepnote.html)
