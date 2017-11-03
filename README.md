# steamlink-sdk-rs-maybe
A basic proof of concept getting Rust code to run on the Steam Link.

Tested on Rust 1.22 nightly. Requires rustc nightly and [Xargo](https://github.com/japaric/xargo). 

Haven't tried interfacing with OpenGL ES/SDL/Qt yet.

## Basic steps
1. Clone both this repo and [steamlink-sdk](https://github.com/ValveSoftware/steamlink-sdk)
2. If [#109](https://github.com/ValveSoftware/steamlink-sdk/pull/109) isn't merged yet, go into `$steamlink-sdk/rootfs/lib` and run `ln -s libgcc_s.so.1 libgcc_s.so`.
3. `source $steamlink-sdk/setenv.sh` to setup the Steam Link SDK environment variables
4. `source ./fix-setenv.sh` to fix the `$CC` environment variable, needed for things to compile correctly.
5. Run `./gen-target.sh` to generate the target file. The generated file will have a path to the Steam Link SDK hardcoded in it.
6. Run `xargo build --target armv7a-cros-linux-gnueabi` to build
7. Your binary will show up in `target/armv7a-cros-linux-gnueabi/debug/`.

## Demo
```text
$ rustc -V
rustc 1.22.0-nightly (8493813cd 2017-10-22)
$ xargo build --target armv7a-cros-linux-gnueabi
   Compiling steamlink-sdk-rs-maybe v0.1.0 (file:///home/zekesonxx/bullshit/steamlink-sdk-rs-maybe)
    Finished dev [unoptimized + debuginfo] target(s) in 0.44 secs
$ scp target/armv7a-cros-linux-gnueabi/debug/steamlink-sdk-rs-maybe steamlink:
steamlink-sdk-rs-maybe    100% 2258KB   2.2MB/s   00:01    
$ ssh steamlink
/home/steam
# ./steamlink-sdk-rs-maybe
Hello World!
```

## Notes
* Valve somehow thinks it's okay to put flags in `$CC` (this is what `fix-setenv.sh` fixes)
* The LLVM triple is specified in the target file as `armv7a-cros-linux-gnueabihf` rather than `-gnueabi` since it *is* hard-float, and this makes LLVM compile things properly.
* `panic = "abort"` only for right now. Not sure how to get unwrap working yet.

## License
Public domain / CC0.