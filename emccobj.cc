  #include <emscripten.h>
  
  EMSCRIPTEN_KEEPALIVE float doAdd(float a, float b)
  {
    return a + b;
  }