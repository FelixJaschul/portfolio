run:
	/Users/felixjaschul/Library/zig/0.16.0-dev.1657+985a3565c/zig build --build-file build/build.zig -Dtarget=wasm32-emscripten --release=small
	cp build/zig-out/web/index.js .
	cp build/zig-out/web/index.wasm .
	cp build/zig-out/web/index.html .

clean:
	rm -rf .zig-cache
	rm -rf zig-out
	rm -rf index.js index.wasm
	rm -rf index.html

open:
	open index.html