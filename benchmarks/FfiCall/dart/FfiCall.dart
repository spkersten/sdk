// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// TODO(37581): Generate this file.

// These micro benchmarks track the speed of reading and writing C memory from
// Dart with a specific marshalling and unmarshalling of data.

import 'dart:ffi';
import 'dart:io';

import 'package:benchmark_harness/benchmark_harness.dart';

import 'dlopen_helper.dart';

//
// Trampoline functions.
//

DynamicLibrary ffiTestFunctions = dlopenPlatformSpecific("native_functions",
    path: Platform.script.resolve("native/out/").path);

typedef NativeFunction1Uint8 = Uint8 Function(Uint8);
typedef Function1int = int Function(int);
Function1int function1Uint8 = ffiTestFunctions
    .lookupFunction<NativeFunction1Uint8, Function1int>("Function1Uint8");

typedef NativeFunction1Uint16 = Uint16 Function(Uint16);
Function1int function1Uint16 = ffiTestFunctions
    .lookupFunction<NativeFunction1Uint16, Function1int>("Function1Uint16");

typedef NativeFunction1Uint32 = Uint32 Function(Uint32);
Function1int function1Uint32 = ffiTestFunctions
    .lookupFunction<NativeFunction1Uint32, Function1int>("Function1Uint32");

typedef NativeFunction1Uint64 = Uint64 Function(Uint64);
Function1int function1Uint64 = ffiTestFunctions
    .lookupFunction<NativeFunction1Uint64, Function1int>("Function1Uint64");

typedef NativeFunction1Int8 = Int8 Function(Int8);
Function1int function1Int8 = ffiTestFunctions
    .lookupFunction<NativeFunction1Int8, Function1int>("Function1Int8");

typedef NativeFunction1Int16 = Int16 Function(Int16);
Function1int function1Int16 = ffiTestFunctions
    .lookupFunction<NativeFunction1Int16, Function1int>("Function1Int16");

typedef NativeFunction1Int32 = Int32 Function(Int32);
Function1int function1Int32 = ffiTestFunctions
    .lookupFunction<NativeFunction1Int32, Function1int>("Function1Int32");

typedef NativeFunction2Int32 = Int32 Function(Int32, Int32);
typedef Function2int = int Function(int, int);
Function2int function2Int32 = ffiTestFunctions
    .lookupFunction<NativeFunction2Int32, Function2int>("Function2Int32");

typedef NativeFunction4Int32 = Int32 Function(Int32, Int32, Int32, Int32);
typedef Function4int = int Function(int, int, int, int);
Function4int function4Int32 = ffiTestFunctions
    .lookupFunction<NativeFunction4Int32, Function4int>("Function4Int32");

typedef NativeFunction10Int32 = Int32 Function(
    Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32);
typedef Function10int = int Function(
    int, int, int, int, int, int, int, int, int, int);
Function10int function10Int32 = ffiTestFunctions
    .lookupFunction<NativeFunction10Int32, Function10int>("Function10Int32");

typedef NativeFunction20Int32 = Int32 Function(
    Int32,
    Int32,
    Int32,
    Int32,
    Int32,
    Int32,
    Int32,
    Int32,
    Int32,
    Int32,
    Int32,
    Int32,
    Int32,
    Int32,
    Int32,
    Int32,
    Int32,
    Int32,
    Int32,
    Int32);
typedef Function20int = int Function(int, int, int, int, int, int, int, int,
    int, int, int, int, int, int, int, int, int, int, int, int);
Function20int function20Int32 = ffiTestFunctions
    .lookupFunction<NativeFunction20Int32, Function20int>("Function20Int32");

typedef NativeFunction1Int64 = Int64 Function(Int64);
Function1int function1Int64 = ffiTestFunctions
    .lookupFunction<NativeFunction1Int64, Function1int>("Function1Int64");

typedef NativeFunction2Int64 = Int64 Function(Int64, Int64);
Function2int function2Int64 = ffiTestFunctions
    .lookupFunction<NativeFunction2Int64, Function2int>("Function2Int64");

typedef NativeFunction4Int64 = Int64 Function(Int64, Int64, Int64, Int64);
Function4int function4Int64 = ffiTestFunctions
    .lookupFunction<NativeFunction4Int64, Function4int>("Function4Int64");

typedef NativeFunction10Int64 = Int64 Function(
    Int64, Int64, Int64, Int64, Int64, Int64, Int64, Int64, Int64, Int64);
Function10int function10Int64 = ffiTestFunctions
    .lookupFunction<NativeFunction10Int64, Function10int>("Function10Int64");

typedef NativeFunction20Int64 = Int64 Function(
    Int64,
    Int64,
    Int64,
    Int64,
    Int64,
    Int64,
    Int64,
    Int64,
    Int64,
    Int64,
    Int64,
    Int64,
    Int64,
    Int64,
    Int64,
    Int64,
    Int64,
    Int64,
    Int64,
    Int64);
Function20int function20Int64 = ffiTestFunctions
    .lookupFunction<NativeFunction20Int64, Function20int>("Function20Int64");

typedef NativeFunction1Float = Float Function(Float);
typedef Function1double = double Function(double);
Function1double function1Float = ffiTestFunctions
    .lookupFunction<NativeFunction1Float, Function1double>("Function1Float");

typedef NativeFunction2Float = Float Function(Float, Float);
typedef Function2double = double Function(double, double);
Function2double function2Float = ffiTestFunctions
    .lookupFunction<NativeFunction2Float, Function2double>("Function2Float");

typedef NativeFunction4Float = Float Function(Float, Float, Float, Float);
typedef Function4double = double Function(double, double, double, double);
Function4double function4Float = ffiTestFunctions
    .lookupFunction<NativeFunction4Float, Function4double>("Function4Float");

typedef NativeFunction10Float = Float Function(
    Float, Float, Float, Float, Float, Float, Float, Float, Float, Float);
typedef Function10double = double Function(double, double, double, double,
    double, double, double, double, double, double);
Function10double function10Float = ffiTestFunctions
    .lookupFunction<NativeFunction10Float, Function10double>("Function10Float");

typedef NativeFunction20Float = Float Function(
    Float,
    Float,
    Float,
    Float,
    Float,
    Float,
    Float,
    Float,
    Float,
    Float,
    Float,
    Float,
    Float,
    Float,
    Float,
    Float,
    Float,
    Float,
    Float,
    Float);
typedef Function20double = double Function(
    double,
    double,
    double,
    double,
    double,
    double,
    double,
    double,
    double,
    double,
    double,
    double,
    double,
    double,
    double,
    double,
    double,
    double,
    double,
    double);
Function20double function20Float = ffiTestFunctions
    .lookupFunction<NativeFunction20Float, Function20double>("Function20Float");

typedef NativeFunction1Double = Double Function(Double);
Function1double function1Double = ffiTestFunctions
    .lookupFunction<NativeFunction1Double, Function1double>("Function1Double");

typedef NativeFunction2Double = Double Function(Double, Double);
Function2double function2Double = ffiTestFunctions
    .lookupFunction<NativeFunction2Double, Function2double>("Function1Double");

typedef NativeFunction4Double = Double Function(Double, Double, Double, Double);
Function4double function4Double = ffiTestFunctions
    .lookupFunction<NativeFunction4Double, Function4double>("Function1Double");

typedef NativeFunction10Double = Double Function(Double, Double, Double, Double,
    Double, Double, Double, Double, Double, Double);
Function10double function10Double =
    ffiTestFunctions.lookupFunction<NativeFunction10Double, Function10double>(
        "Function10Double");

typedef NativeFunction20Double = Double Function(
    Double,
    Double,
    Double,
    Double,
    Double,
    Double,
    Double,
    Double,
    Double,
    Double,
    Double,
    Double,
    Double,
    Double,
    Double,
    Double,
    Double,
    Double,
    Double,
    Double);
Function20double function20Double =
    ffiTestFunctions.lookupFunction<NativeFunction20Double, Function20double>(
        "Function20Double");

typedef Function1PointerUint8 = Pointer<Uint8> Function(Pointer<Uint8>);
Function1PointerUint8 function1PointerUint8 = ffiTestFunctions.lookupFunction<
    Function1PointerUint8, Function1PointerUint8>("Function1PointerUint8");

typedef Function2PointerUint8 = Pointer<Uint8> Function(
    Pointer<Uint8>, Pointer<Uint8>);
Function2PointerUint8 function2PointerUint8 = ffiTestFunctions.lookupFunction<
    Function2PointerUint8, Function2PointerUint8>("Function2PointerUint8");

typedef Function4PointerUint8 = Pointer<Uint8> Function(
    Pointer<Uint8>, Pointer<Uint8>, Pointer<Uint8>, Pointer<Uint8>);
Function4PointerUint8 function4PointerUint8 = ffiTestFunctions.lookupFunction<
    Function4PointerUint8, Function4PointerUint8>("Function4PointerUint8");

typedef Function10PointerUint8 = Pointer<Uint8> Function(
    Pointer<Uint8>,
    Pointer<Uint8>,
    Pointer<Uint8>,
    Pointer<Uint8>,
    Pointer<Uint8>,
    Pointer<Uint8>,
    Pointer<Uint8>,
    Pointer<Uint8>,
    Pointer<Uint8>,
    Pointer<Uint8>);
Function10PointerUint8 function10PointerUint8 = ffiTestFunctions.lookupFunction<
    Function10PointerUint8, Function10PointerUint8>("Function10PointerUint8");

typedef Function20PointerUint8 = Pointer<Uint8> Function(
    Pointer<Uint8>,
    Pointer<Uint8>,
    Pointer<Uint8>,
    Pointer<Uint8>,
    Pointer<Uint8>,
    Pointer<Uint8>,
    Pointer<Uint8>,
    Pointer<Uint8>,
    Pointer<Uint8>,
    Pointer<Uint8>,
    Pointer<Uint8>,
    Pointer<Uint8>,
    Pointer<Uint8>,
    Pointer<Uint8>,
    Pointer<Uint8>,
    Pointer<Uint8>,
    Pointer<Uint8>,
    Pointer<Uint8>,
    Pointer<Uint8>,
    Pointer<Uint8>);
Function20PointerUint8 function20PointerUint8 = ffiTestFunctions.lookupFunction<
    Function20PointerUint8, Function20PointerUint8>("Function20PointerUint8");

//
// Trampoline call.
//

int doCall1Uint8(int length) {
  int x = 0;
  for (int i = 0; i < length; i++) {
    x += function1Uint8(17);
  }
  return x;
}

int doCall1Uint16(int length) {
  int x = 0;
  for (int i = 0; i < length; i++) {
    x += function1Uint16(17);
  }
  return x;
}

int doCall1Uint32(int length) {
  int x = 0;
  for (int i = 0; i < length; i++) {
    x += function1Uint32(i);
  }
  return x;
}

int doCall1Uint64(int length) {
  int x = 0;
  for (int i = 0; i < length; i++) {
    x += function1Uint64(i);
  }
  return x;
}

int doCall1Int8(int length) {
  int x = 0;
  for (int i = 0; i < length; i++) {
    x += function1Int8(17);
  }
  return x;
}

int doCall1Int16(int length) {
  int x = 0;
  for (int i = 0; i < length; i++) {
    x += function1Int16(17);
  }
  return x;
}

int doCall1Int32(int length) {
  int x = 0;
  for (int i = 0; i < length; i++) {
    x += function1Int32(i);
  }
  return x;
}

int doCall2Int32(int length) {
  int x = 0;
  for (int i = 0; i < length; i++) {
    x += function2Int32(i, i);
  }
  return x;
}

int doCall4Int32(int length) {
  int x = 0;
  for (int i = 0; i < length; i++) {
    x += function4Int32(i, i, i, i);
  }
  return x;
}

int doCall10Int32(int length) {
  int x = 0;
  for (int i = 0; i < length; i++) {
    x += function10Int32(i, i, i, i, i, i, i, i, i, i);
  }
  return x;
}

int doCall20Int32(int length) {
  int x = 0;
  for (int i = 0; i < length; i++) {
    x += function20Int32(
        i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i);
  }
  return x;
}

int doCall1Int64(int length) {
  int x = 0;
  for (int i = 0; i < length; i++) {
    x += function1Int64(i);
  }
  return x;
}

int doCall2Int64(int length) {
  int x = 0;
  for (int i = 0; i < length; i++) {
    x += function2Int64(i, i);
  }
  return x;
}

int doCall4Int64(int length) {
  int x = 0;
  for (int i = 0; i < length; i++) {
    x += function4Int64(i, i, i, i);
  }
  return x;
}

int doCall10Int64(int length) {
  int x = 0;
  for (int i = 0; i < length; i++) {
    x += function10Int64(i, i, i, i, i, i, i, i, i, i);
  }
  return x;
}

int doCall20Int64(int length) {
  int x = 0;
  for (int i = 0; i < length; i++) {
    x += function20Int64(
        i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i);
  }
  return x;
}

int doCall1Int64Mint(int length) {
  int x = 0x7FFFFFFF00000000;

  for (int i = 0; i < length; i++) {
    x = function1Int64(x);
  }
  return x;
}

double doCall1Float(int length) {
  double x = 0.0;
  for (int i = 0; i < length; i++) {
    x += function1Float(17.0);
  }
  return x;
}

double doCall2Float(int length) {
  double x = 0;
  for (int i = 0; i < length; i++) {
    x += function2Float(1.0, 2.0);
  }
  return x;
}

double doCall4Float(int length) {
  double x = 0;
  for (int i = 0; i < length; i++) {
    x += function4Float(1.0, 2.0, 3.0, 4.0);
  }
  return x;
}

double doCall10Float(int length) {
  double x = 0;
  for (int i = 0; i < length; i++) {
    x += function10Float(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0);
  }
  return x;
}

double doCall20Float(int length) {
  double x = 0;
  for (int i = 0; i < length; i++) {
    x += function20Float(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0,
        11.0, 12.0, 13.0, 14.0, 15.0, 16.0, 17.0, 18.0, 19.0, 20.0);
  }
  return x;
}

double doCall1Double(int length) {
  double x = 0.0;
  for (int i = 0; i < length; i++) {
    x += function1Double(17.0);
  }
  return x;
}

double doCall2Double(int length) {
  double x = 0;
  for (int i = 0; i < length; i++) {
    x += function2Double(1.0, 2.0);
  }
  return x;
}

double doCall4Double(int length) {
  double x = 0;
  for (int i = 0; i < length; i++) {
    x += function4Double(1.0, 2.0, 3.0, 4.0);
  }
  return x;
}

double doCall10Double(int length) {
  double x = 0;
  for (int i = 0; i < length; i++) {
    x += function10Double(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0);
  }
  return x;
}

double doCall20Double(int length) {
  double x = 0;
  for (int i = 0; i < length; i++) {
    x += function20Double(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0,
        11.0, 12.0, 13.0, 14.0, 15.0, 16.0, 17.0, 18.0, 19.0, 20.0);
  }
  return x;
}

Pointer<Uint8> doCall1PointerUint8(int length, Pointer<Uint8> p1) {
  Pointer<Uint8> x = p1;
  for (int i = 0; i < length; i++) {
    x = function1PointerUint8(x);
  }
  return x;
}

Pointer<Uint8> doCall2PointerUint8(
    int length, Pointer<Uint8> p1, Pointer<Uint8> p2) {
  Pointer<Uint8> x = p1;
  for (int i = 0; i < length; i++) {
    x = function2PointerUint8(x, p2);
  }
  return x;
}

Pointer<Uint8> doCall4PointerUint8(int length, Pointer<Uint8> p1,
    Pointer<Uint8> p2, Pointer<Uint8> p3, Pointer<Uint8> p4) {
  Pointer<Uint8> x = p1;
  for (int i = 0; i < length; i++) {
    x = function4PointerUint8(x, p2, p3, p4);
  }
  return x;
}

Pointer<Uint8> doCall10PointerUint8(
    int length,
    Pointer<Uint8> p1,
    Pointer<Uint8> p2,
    Pointer<Uint8> p3,
    Pointer<Uint8> p4,
    Pointer<Uint8> p5,
    Pointer<Uint8> p6,
    Pointer<Uint8> p7,
    Pointer<Uint8> p8,
    Pointer<Uint8> p9,
    Pointer<Uint8> p10) {
  Pointer<Uint8> x = p1;
  for (int i = 0; i < length; i++) {
    x = function10PointerUint8(x, p2, p3, p4, p5, p6, p7, p8, p9, p10);
  }
  return x;
}

Pointer<Uint8> doCall20PointerUint8(
    int length,
    Pointer<Uint8> p1,
    Pointer<Uint8> p2,
    Pointer<Uint8> p3,
    Pointer<Uint8> p4,
    Pointer<Uint8> p5,
    Pointer<Uint8> p6,
    Pointer<Uint8> p7,
    Pointer<Uint8> p8,
    Pointer<Uint8> p9,
    Pointer<Uint8> p10,
    Pointer<Uint8> p11,
    Pointer<Uint8> p12,
    Pointer<Uint8> p13,
    Pointer<Uint8> p14,
    Pointer<Uint8> p15,
    Pointer<Uint8> p16,
    Pointer<Uint8> p17,
    Pointer<Uint8> p18,
    Pointer<Uint8> p19,
    Pointer<Uint8> p20) {
  Pointer<Uint8> x = p1;
  for (int i = 0; i < length; i++) {
    x = function20PointerUint8(x, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12,
        p13, p14, p15, p16, p17, p18, p19, p20);
  }
  return x;
}

//
// Benchmark fixtures.
//

// Number of repeats: 1000
//  * CPU: Intel(R) Xeon(R) Gold 6154
//    * Architecture: x64
//      * 200 - 1100 us
//    * Architecture: SimDBC64
//      * 2800 - 110000 us
const N = 1000;

class Uint8x01 extends BenchmarkBase {
  Uint8x01() : super("FfiCall.Uint8x01");

  void run() {
    final int x = doCall1Uint8(N);
    if (x != N * 17 + N * 42) {
      throw Exception("$name: Unexpected result: $x");
    }
  }
}

class Uint16x01 extends BenchmarkBase {
  Uint16x01() : super("FfiCall.Uint16x01");

  void run() {
    final int x = doCall1Uint16(N);
    if (x != N * 17 + N * 42) {
      throw Exception("$name: Unexpected result: $x");
    }
  }
}

class Uint32x01 extends BenchmarkBase {
  Uint32x01() : super("FfiCall.Uint32x01");

  void run() {
    final int x = doCall1Uint32(N);
    if (x != N * (N - 1) / 2 + N * 42) {
      throw Exception("$name: Unexpected result: $x");
    }
  }
}

class Uint64x01 extends BenchmarkBase {
  Uint64x01() : super("FfiCall.Uint64x01");

  void run() {
    final int x = doCall1Uint64(N);
    if (x != N * (N - 1) / 2 + N * 42) {
      throw Exception("$name: Unexpected result: $x");
    }
  }
}

class Int8x01 extends BenchmarkBase {
  Int8x01() : super("FfiCall.Int8x01");

  void run() {
    final int x = doCall1Int8(N);
    if (x != N * 17 + N * 42) {
      throw Exception("$name: Unexpected result: $x");
    }
  }
}

class Int16x01 extends BenchmarkBase {
  Int16x01() : super("FfiCall.Int16x01");

  void run() {
    final int x = doCall1Int16(N);
    if (x != N * 17 + N * 42) {
      throw Exception("$name: Unexpected result: $x");
    }
  }
}

class Int32x01 extends BenchmarkBase {
  Int32x01() : super("FfiCall.Int32x01");

  void run() {
    final int x = doCall1Int32(N);
    if (x != N * (N - 1) / 2 + N * 42) {
      throw Exception("$name: Unexpected result: $x");
    }
  }
}

class Int32x02 extends BenchmarkBase {
  Int32x02() : super("FfiCall.Int32x02");

  void run() {
    final int x = doCall2Int32(N);
    if (x != N * (N - 1) * 2 / 2) {
      throw Exception("$name: Unexpected result: $x");
    }
  }
}

class Int32x04 extends BenchmarkBase {
  Int32x04() : super("FfiCall.Int32x04");

  void run() {
    final int x = doCall4Int32(N);
    if (x != N * (N - 1) * 4 / 2) {
      throw Exception("$name: Unexpected result: $x");
    }
  }
}

class Int32x10 extends BenchmarkBase {
  Int32x10() : super("FfiCall.Int32x10");

  void run() {
    final int x = doCall10Int32(N);
    if (x != N * (N - 1) * 10 / 2) {
      throw Exception("$name: Unexpected result: $x");
    }
  }
}

class Int32x20 extends BenchmarkBase {
  Int32x20() : super("FfiCall.Int32x20");

  void run() {
    final int x = doCall20Int32(N);
    if (x != N * (N - 1) * 20 / 2) {
      throw Exception("$name: Unexpected result: $x");
    }
  }
}

class Int64x01 extends BenchmarkBase {
  Int64x01() : super("FfiCall.Int64x01");

  void run() {
    final int x = doCall1Int64(N);
    if (x != N * (N - 1) / 2 + N * 42) {
      throw Exception("$name: Unexpected result: $x");
    }
  }
}

class Int64x02 extends BenchmarkBase {
  Int64x02() : super("FfiCall.Int64x02");

  void run() {
    final int x = doCall2Int64(N);
    if (x != N * (N - 1) * 2 / 2) {
      throw Exception("$name: Unexpected result: $x");
    }
  }
}

class Int64x04 extends BenchmarkBase {
  Int64x04() : super("FfiCall.Int64x04");

  void run() {
    final int x = doCall4Int64(N);
    if (x != N * (N - 1) * 4 / 2) {
      throw Exception("$name: Unexpected result: $x");
    }
  }
}

class Int64x10 extends BenchmarkBase {
  Int64x10() : super("FfiCall.Int64x10");

  void run() {
    final int x = doCall10Int64(N);
    if (x != N * (N - 1) * 10 / 2) {
      throw Exception("$name: Unexpected result: $x");
    }
  }
}

class Int64x20 extends BenchmarkBase {
  Int64x20() : super("FfiCall.Int64x20");

  void run() {
    final int x = doCall20Int64(N);
    if (x != N * (N - 1) * 20 / 2) {
      throw Exception("$name: Unexpected result: $x");
    }
  }
}

class Int64Mintx01 extends BenchmarkBase {
  Int64Mintx01() : super("FfiCall.Int64Mintx01");

  void run() {
    final int x = doCall1Int64Mint(N);
    if (x != 0x7FFFFFFF00000000 + N * 42) {
      throw Exception("$name: Unexpected result: $x");
    }
  }
}

class Floatx01 extends BenchmarkBase {
  Floatx01() : super("FfiCall.Floatx01");

  void run() {
    final double x = doCall1Float(N);
    final double expected = N * (N - 1) / 2 + N * 42;
    if (0.999 * expected > x && x > 1.001 * expected) {
      throw Exception("$name: Unexpected result: $x");
    }
  }
}

class Floatx02 extends BenchmarkBase {
  Floatx02() : super("FfiCall.Floatx02");

  void run() {
    final double x = doCall2Float(N);
    final double expected = N * 55.0;
    if (0.999 * expected > x && x > 1.001 * expected) {
      throw Exception("$name: Unexpected result: $x");
    }
  }
}

class Floatx04 extends BenchmarkBase {
  Floatx04() : super("FfiCall.Floatx04");

  void run() {
    final double x = doCall4Float(N);
    final double expected = N * 55.0;
    if (0.999 * expected > x && x > 1.001 * expected) {
      throw Exception("$name: Unexpected result: $x");
    }
  }
}

class Floatx10 extends BenchmarkBase {
  Floatx10() : super("FfiCall.Floatx10");

  void run() {
    final double x = doCall10Float(N);
    final double expected = N * 55.0;
    if (0.999 * expected > x && x > 1.001 * expected) {
      throw Exception("$name: Unexpected result: $x");
    }
  }
}

class Floatx20 extends BenchmarkBase {
  Floatx20() : super("FfiCall.Floatx20");

  void run() {
    final double x = doCall20Float(N);
    final double expected = N * 220.0;
    if (0.999 * expected > x && x > 1.001 * expected) {
      throw Exception("$name: Unexpected result: $x");
    }
  }
}

class Doublex01 extends BenchmarkBase {
  Doublex01() : super("FfiCall.Doublex01");

  void run() {
    final double x = doCall1Double(N);
    final double expected = N * (N - 1) / 2 + N * 42;
    if (0.999 * expected > x && x > 1.001 * expected) {
      throw Exception("$name: Unexpected result: $x");
    }
  }
}

class Doublex02 extends BenchmarkBase {
  Doublex02() : super("FfiCall.Doublex02");

  void run() {
    final double x = doCall2Double(N);
    final double expected = N * 55.0;
    if (0.999 * expected > x && x > 1.001 * expected) {
      throw Exception("$name: Unexpected result: $x");
    }
  }
}

class Doublex04 extends BenchmarkBase {
  Doublex04() : super("FfiCall.Doublex04");

  void run() {
    final double x = doCall4Double(N);
    final double expected = N * 55.0;
    if (0.999 * expected > x && x > 1.001 * expected) {
      throw Exception("$name: Unexpected result: $x");
    }
  }
}

class Doublex10 extends BenchmarkBase {
  Doublex10() : super("FfiCall.Doublex10");

  void run() {
    final double x = doCall10Double(N);
    final double expected = N * 55.0;
    if (0.999 * expected > x && x > 1.001 * expected) {
      throw Exception("$name: Unexpected result: $x");
    }
  }
}

class Doublex20 extends BenchmarkBase {
  Doublex20() : super("FfiCall.Doublex20");

  void run() {
    final double x = doCall20Double(N);
    final double expected = N * 220.0;
    if (0.999 * expected > x && x > 1.001 * expected) {
      throw Exception("$name: Unexpected result: $x");
    }
  }
}

class PointerUint8x01 extends BenchmarkBase {
  PointerUint8x01() : super("FfiCall.PointerUint8x01");

  Pointer<Uint8> pointer;
  void setup() => pointer = Pointer.allocate(count: N + 1);
  void teardown() => pointer.free();

  void run() {
    final Pointer<Uint8> x = doCall1PointerUint8(N, pointer);
    if (x.address != pointer.address + N) {
      throw Exception("$name: Unexpected result: $x");
    }
  }
}

class PointerUint8x02 extends BenchmarkBase {
  PointerUint8x02() : super("FfiCall.PointerUint8x02");

  Pointer<Uint8> pointer, pointer2;

  void setup() {
    pointer = Pointer.allocate(count: N + 1);
    pointer2 = pointer.elementAt(1);
  }

  void teardown() {
    pointer.free();
  }

  void run() {
    final Pointer<Uint8> x = doCall2PointerUint8(N, pointer, pointer2);
    if (x.address != pointer.address + N * sizeOf<Uint8>()) {
      throw Exception("$name: Unexpected result: $x");
    }
  }
}

class PointerUint8x04 extends BenchmarkBase {
  PointerUint8x04() : super("FfiCall.PointerUint8x04");

  Pointer<Uint8> pointer, pointer2, pointer3, pointer4;

  void setup() {
    pointer = Pointer.allocate(count: N + 1);
    pointer2 = pointer.elementAt(1);
    pointer3 = pointer.elementAt(2);
    pointer4 = pointer.elementAt(3);
  }

  void teardown() {
    pointer.free();
  }

  void run() {
    final Pointer<Uint8> x =
        doCall4PointerUint8(N, pointer, pointer2, pointer3, pointer4);
    if (x.address != pointer.address + N * sizeOf<Uint8>()) {
      throw Exception("$name: Unexpected result: $x");
    }
  }
}

class PointerUint8x10 extends BenchmarkBase {
  PointerUint8x10() : super("FfiCall.PointerUint8x10");

  Pointer<Uint8> pointer,
      pointer2,
      pointer3,
      pointer4,
      pointer5,
      pointer6,
      pointer7,
      pointer8,
      pointer9,
      pointer10;

  void setup() {
    pointer = Pointer.allocate(count: N + 1);
    pointer2 = pointer.elementAt(1);
    pointer3 = pointer.elementAt(2);
    pointer4 = pointer.elementAt(3);
    pointer5 = pointer.elementAt(4);
    pointer6 = pointer.elementAt(5);
    pointer7 = pointer.elementAt(6);
    pointer8 = pointer.elementAt(7);
    pointer9 = pointer.elementAt(8);
    pointer10 = pointer.elementAt(9);
  }

  void teardown() {
    pointer.free();
  }

  void run() {
    final Pointer<Uint8> x = doCall10PointerUint8(
        N,
        pointer,
        pointer2,
        pointer3,
        pointer4,
        pointer5,
        pointer6,
        pointer7,
        pointer8,
        pointer9,
        pointer10);
    if (x.address != pointer.address + N * sizeOf<Uint8>()) {
      throw Exception("$name: Unexpected result: $x");
    }
  }
}

class PointerUint8x20 extends BenchmarkBase {
  PointerUint8x20() : super("FfiCall.PointerUint8x20");

  Pointer<Uint8> pointer,
      pointer2,
      pointer3,
      pointer4,
      pointer5,
      pointer6,
      pointer7,
      pointer8,
      pointer9,
      pointer10,
      pointer11,
      pointer12,
      pointer13,
      pointer14,
      pointer15,
      pointer16,
      pointer17,
      pointer18,
      pointer19,
      pointer20;

  void setup() {
    pointer = Pointer.allocate(count: N + 1);
    pointer2 = pointer.elementAt(1);
    pointer3 = pointer.elementAt(2);
    pointer4 = pointer.elementAt(3);
    pointer5 = pointer.elementAt(4);
    pointer6 = pointer.elementAt(5);
    pointer7 = pointer.elementAt(6);
    pointer8 = pointer.elementAt(7);
    pointer9 = pointer.elementAt(8);
    pointer10 = pointer.elementAt(9);
    pointer11 = pointer.elementAt(10);
    pointer12 = pointer.elementAt(11);
    pointer13 = pointer.elementAt(12);
    pointer14 = pointer.elementAt(13);
    pointer15 = pointer.elementAt(14);
    pointer16 = pointer.elementAt(15);
    pointer17 = pointer.elementAt(16);
    pointer18 = pointer.elementAt(17);
    pointer19 = pointer.elementAt(18);
    pointer20 = pointer.elementAt(19);
  }

  void teardown() {
    pointer.free();
  }

  void run() {
    final Pointer<Uint8> x = doCall20PointerUint8(
        N,
        pointer,
        pointer2,
        pointer3,
        pointer4,
        pointer5,
        pointer6,
        pointer7,
        pointer8,
        pointer9,
        pointer10,
        pointer11,
        pointer12,
        pointer13,
        pointer14,
        pointer15,
        pointer16,
        pointer17,
        pointer18,
        pointer19,
        pointer20);
    if (x.address != pointer.address + N * sizeOf<Uint8>()) {
      throw Exception("$name: Unexpected result: $x");
    }
  }
}

//
// Main driver.
//

main() {
  final benchmarks = [
    () => Uint8x01(),
    () => Uint16x01(),
    () => Uint32x01(),
    () => Uint64x01(),
    () => Int8x01(),
    () => Int16x01(),
    () => Int32x01(),
    () => Int32x02(),
    () => Int32x04(),
    () => Int32x10(),
    () => Int32x20(),
    () => Int64x01(),
    () => Int64x02(),
    () => Int64x04(),
    () => Int64x10(),
    () => Int64x20(),
    () => Int64Mintx01(),
    () => Floatx01(),
    () => Floatx02(),
    () => Floatx04(),
    () => Floatx10(),
    () => Floatx20(),
    () => Doublex01(),
    () => Doublex02(),
    () => Doublex04(),
    () => Doublex10(),
    () => Doublex20(),
    () => PointerUint8x01(),
    () => PointerUint8x02(),
    () => PointerUint8x04(),
    () => PointerUint8x10(),
    () => PointerUint8x20(),
  ];
  benchmarks.forEach((benchmark) => benchmark().report());
}
