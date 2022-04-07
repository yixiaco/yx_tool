import 'package:yx_tool/core/test/yx_test.dart';
import 'package:yx_tool/core/util/random_util.dart';

void main() {
  testExecute(
    title: 'RandomUtil.randomInt Test',
    function: () {
      var random = RandomUtil.randomInt(min: 6, max: 10);
      print(random);
    },
    execute: true,
  );
}