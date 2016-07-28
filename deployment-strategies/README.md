# Deployment strategies

A paper based on my Master's thesis on deployment strategies intended for [2nd IoT & Cloud Computing conference, Cambridge, UK. Proceedings (ACM)](http://www.icc-conference.org/).

## Get started

### Dependencies

This section assumes macOS with [Homebrew](http://brew.sh/) and [LaTeX](http://pandoc.org/installing.html#mac-os-x) installed.

```sh
brew install pandoc           # "compiler"
brew install python           # pip for installing packages
brew install pandoc-citeproc  # citation formatting with CSL file 
pip install pandoc-fignos     # in-text reference to figures

```

### Build the paper

1. `$ ./build.sh`
2. `$ open ./paper.pdf`
