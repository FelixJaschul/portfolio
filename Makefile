run:
	/Users/felixjaschul/Library/zig/0.16.0-dev.1657+985a3565c/zig build -Dtarget=wasm32-emscripten --release=small && cp zig-out/web/index.html . && cp zig-out/web/index.js . && cp zig-out/web/index.wasm .

clean:
	rm -rf .zig-cache
	rm -rf .zig-out

open:
	open index.html