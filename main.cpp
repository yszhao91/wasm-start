#include <iostream>
#include <emscripten/emscripten.h>

extern "C"
{
    EMSCRIPTEN_KEEPALIVE float doAdd(float a, float b)
    {
        return a + b;
    }

    EMSCRIPTEN_KEEPALIVE float doSub(float a, float b)
    {
        return a - b;
    }

    EMSCRIPTEN_KEEPALIVE int doSubTest(int a, int b)
    {
        return a + b;
    }
}
