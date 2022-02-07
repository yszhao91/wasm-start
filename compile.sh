mkdir -p bin 
rm -rf bin/terrain.js bin/terrain.wasm 
echo 'building code'
if [ ! -f test.o ]; then
  echo 'building test...'
  emcc -s WASM=1 -O3 \
  test.cc \
  -DNDEBUG -DPX_SIMD_DISABLED -DPX_EMSCRIPTEN=1 -DPX_COOKING \
  -c
fi
emcc -s WASM=1 -s NO_EXIT_RUNTIME=1 -s TOTAL_MEMORY=209715200 -s ALLOW_MEMORY_GROWTH=0 -O3 \
terrain.cc test.cc \
-I. \
-o bin/terrain.js
sed -Ei 's/terrain.wasm/bin\/terrain.wasm/g' bin/geometry.js
echo 'let accept, reject;const p = new Promise((a, r) => {  accept = a;  reject = r;});Module.postRun = () => {  accept();};Module.waitForLoad = () => p;run();export default Module;' >> ./bin/terrain.js
echo done