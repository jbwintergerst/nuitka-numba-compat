# Numba / Nuitka compatibility: test case

## Presentation

Here is a test case for using [numba](https://numba.pydata.org/numba-doc/latest/index.html) 
with [nuitka](https://nuitka.net/doc/user-manual.html).


### Nuitka

Nuitka is used here for compiling the whole package as a unique binary `mymodule.so`
that can be called by an entrypoint script `main.py`.

### Numba

Numba is used for code optimization for this great optimization/time invested ratio.
Numba can be used in 2 ways:
* Just In Time compilation ([JIT](https://numba.pydata.org/numba-doc/latest/user/jit.html)):
  the functions are compiled at runtime (or cached)
* Ahead Of Time Compilation ([AOT](https://numba.pydata.org/numba-doc/latest/reference/aot-compilation.html)):
  the functions are precompiled into a binary to be used in the python code with a classic `import`
  
### Objectives

The objective in this test case is to compile a `mymodule` python package as a unique binary (`.so` or other) \
JIT usage of numba is preferred as it is way easier and cleaner to use :
 * don't have to isolate numba function in a different module
 * the use of AOT needs to point numba files manually to be compiled (running each files or using a setup.py 
   with a list of file to compile)

But can be more challenging since nuitka would need to trigger the code compilation of numba 
and grabbing the resulting byte-code.

The AOT route might be easier since nuitka just has to grab the precompiled numba binary 
and integrate it into its own binary.

## The test case

The test env can be build with `docker` ([DockerFile](Dockerfile)) using the [Makefile](Makefile) to build, launch 
tests and browse the test image.

In this repo, you will find 2 scenarios

### Using JIT (ultimate objective)

> On branch `master` or `test/jit`

### Using AOT

> On branch `test/aot`
