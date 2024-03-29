mkdir -p bin
rm -rf bin/terrain.js bin/terrain.wasm 
echo 'building code...'
if [ ! -f test.o ]; then
  echo 'building test...'
  emcc -s WASM=1 -O3 \
  test.cc \
  -DNDEBUG -DPX_SIMD_DISABLED -DPX_EMSCRIPTEN=1 -DPX_COOKING \
  -c
fi

emcc -O3 \
main.cpp test.cc \
-o  ./bin/terrain.js
 
sed -Ei 's/terrain.wasm/bin\/terrain.wasm/g' bin/terrain.js
echo 'let accept, reject;const p = new Promise((a, r) => {  accept = a;  reject = r;});Module.postRun = () => {  accept();};Module.waitForLoad = () => p;run();export default Module;' >> ./bin/terrain.js
echo done

echo done
sleep 10000
