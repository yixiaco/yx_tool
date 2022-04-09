import 'package:yx_tool/src/core/lang/num/number.dart';

class Byte extends AbstractInt<Byte> {

  static const MAX_VALUE = 0x7F;
  static const MIN_VALUE = -0x80;

  final int _value;

  Byte(int num) : _value = num.toSigned(8);

  @override
  int get value => _value;

  @override
  int get bits => 8;

  @override
  Byte valueOf(int num) {
    return Byte(num);
  }
}