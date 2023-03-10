import 'dart:typed_data';

import '../../util/_internal.dart';

@internal
class VP8LColorCache {
  final Uint32List colors; // color entries
  final int hashShift; // Hash shift: 32 - hash_bits.

  VP8LColorCache(int hashBits)
      : colors = Uint32List(1 << hashBits),
        hashShift = 32 - hashBits;

  void insert(int argb) {
    final a = (argb * _hashMultiplier) & 0xffffffff;
    final key = a >> hashShift;
    colors[key] = argb;
  }

  int lookup(int key) => colors[key];

  static const _hashMultiplier = 0x1e35a7bd;
}
