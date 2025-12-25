run:
	/Users/felixjaschul/Library/zig/0.16.0-dev.1657+985a3565c/zig build --build-file build/build.zig -Dtarget=wasm32-emscripten --release=small && cp zig-out/web/index.html . && cp zig-out/web/index.js build/ && cp zig-out/web/index.wasm build/

clean:
	rm -rf .zig-cache
	rm -rf .zig-out

open:
	open index.html