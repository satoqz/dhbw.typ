# DHBW Typst Template

A thesis template for work at DHBW created in [Typst](https://github.com/typst/typst), because you should really let that other thing ending in "X" die.

I was likely the first student at DHBW to ever use Typst for a thesis, this is the template I've ended up with after several iterations and gathering feedback from other students using unreleased variations of it.

[**Preview**](./thesis.pdf)

### **Why you should write your thesis in Typst**

- **Blazing fast compile times.** Your overleaf compilation timed out for the 50th time today? Your local LaTeX installation takes more than a full minute to compile your thesis? Fear no more. Typst will compile your thesis in under two seconds on a cold start, and in less than 100ms on an incremental refresh in watch mode. This means you can have an **actual live preview** of your thesis, not one that lags behind by minutes.

- **Easy to install.** Ever tried to install LaTeX on Windows and miserably failed? Or waited hours for a `tlmgr` update? Typst ships in a single binary file that is less than 50MB.

- **Easy to run, no clutter.** Ever used a local LaTeX install and ended up with 20 weird files in your project directory after running `pdflatex` 6 times until your bibliography finally showed up? Typst will only create the PDF file that you want, after a single run.

- **Readable markup language.** Typst uses a markup language that feels like a mix of 1) Markdown and 2) Rust without the hard parts. If you know any other common general purpose programming language, you will learn Typst in a couple of hours at most. Additionally, compilation errors are findable and understandable.

- **Great documentation.** Have you tried looking up the documentation of a LaTeX package? Did you end up finding it? Me neither. Typst has great documentation available at [typst.app/docs](https://typst.app/docs).

### **How to get started**

1. Install Typst using one of the many available installation methods.

2. Install the "Computer Modern" font. The installation procedure strongly depends on your environment.

3. Grab the [`template.typ`](./template.typ) and [`thesis.typ`](./thesis.typ) files and if needed the [`assets`](./assets) folder from this repository.

4. Take a look at the parameters of the `thesis` function defined in [`template.typ`](./template.typ). Then get started by editing [`thesis.typ`](./thesis.typ) according to your needs. If you haven't you should probably also take a look at the [Typst documentation](https://typst.app/docs).