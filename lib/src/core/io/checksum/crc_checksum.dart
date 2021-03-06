import 'dart:typed_data';

import 'package:yx_tool/src/core/io/checksum/checksum.dart';

/// 循环冗余校验码
abstract class CRCChecksum extends Checksum {
  late int wCRCin;

  CRCChecksum() {
    reset();
  }

  @override
  void update(Uint8List ints, [int off = 0, int? len]) {
    len ??= ints.length;
    for (var i = off; i < off + len; i++) {
      updateInt(ints[i]);
    }
  }

  @override
  void reset() {
    wCRCin = 0;
  }
}
