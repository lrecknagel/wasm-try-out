# WebAssembly Tryout

* Simple fibonacci function _(fib.c)_
* Simple index.html to load wasm module

## Using
* emscripten SDK https://kripken.github.io/emscripten-site/docs/getting_started/downloads.html
* emscripten https://github.com/kripken/emscripten @incoming branch
* WebAssembly Binary Toolkit https://github.com/WebAssembly/wabt

## How I tried to compile and use and FAILED:

```bash
emcc -s BINARYEN=1 -s 'EXPORTED_FUNCTIONS=["_fib"]' fib.c -o fib.js # or without EXPORTED_FUNCTIONS
# already produces a .wasm file but error below appears
# OR
emcc fib.c -s WASM=1 -s SIDE_MODULE=1 -Os -g -o fib.js
asm2wasm fib.asm.js > fib_2.wasm
wasm-as fib_2.wasm > fib_3.wasm
# same error below
```

* It already produces a fib.wasm file but:
    * Chrome 54: Uncaught (in promise) WebAssembly.compile(): Result = expected magic word 00 61 73 6d, found 3c 21 44 4f @+0
    * Chrome Canary: Uncaught (in promise) TypeError: WebAssembly.Instance(): Import #0 module="env" function="STACKTOP" error: module is not an object or function
    at load
    * Chromium 56.0.2922.0: Uncaught (in promise) CompileError: WebAssembly.compile(): Wasm decoding failedResult = expected magic word 00 61 73 6d, found 3c 21 44 4f @+0

* If I try like that:

```bash
emcc -s BINARYEN=1 -s 'EXPORTED_FUNCTIONS=["_fib"]' fib.c -o fib.js # or without EXPORTED_FUNCTIONS
asm2wasm fib.asm.js > fib.wast

# infinite lines of:
...
4
iv
naiii
ivlnnninaivvvnivldaaavnai lllavldciiilai adddildcl   di alccc dcl aaac altlllacl allllaltr   ll agttt ltreaaat agtrrratre:gggragt eeegre:tttegt $:::te:   :t $l :o$$$ $la$odlss$la4ottlodaooola4
drraod4eeda4
i444dn
4
iv


nai
ivlniiinaivnnnivldavvvnai laaavldcilllai adiiildcl dddi alc   dcl accc altlaaacl allllaltr llll agt   ltreattt agtraaatre:grrragt egggre:teeegt $:ttte: :::t $l   :o$ $la$$$odl$la4osslodattola4
dooaod4rrda4
...
```

## How I compiled and use and succeed:

```bash
# llvm => http://blog.golovin.in/how-to-start-using-webassembly-today/
git clone http://llvm.org/git/llvm.git
cd llvm/tools
git clone http://llvm.org/git/clang.git
cd ../projects
git clone http://llvm.org/git/compiler-rt.git
mkdir ../build
cd ../build
cmake -G Ninja -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=WebAssembly ..
ninja
```

* Compile it via:

```bash
../llvm/build/bin/clang -emit-llvm --target=wasm32 -S fib.c
../llvm/build/bin/llc fib.ll -march=wasm32
s2wasm fib.s > fib.wast
wasm-as fib.wast -o fib.wasm

# SUCCESS 🎉🎉🎉🎉🎉
```
🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉
