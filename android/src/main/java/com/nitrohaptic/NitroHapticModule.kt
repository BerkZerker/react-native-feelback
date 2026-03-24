package com.nitrohaptic

import com.facebook.react.bridge.ReactApplicationContext

class NitroHapticModule(reactContext: ReactApplicationContext) :
  NativeNitroHapticSpec(reactContext) {

  override fun multiply(a: Double, b: Double): Double {
    return a * b
  }

  companion object {
    const val NAME = NativeNitroHapticSpec.NAME
  }
}
