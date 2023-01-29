import 'dart:io';

import 'package:cli/cli.dart';
import 'package:test/test.dart';

void main() {
  var libPath = Platform.script.path.replaceAll(RegExp(r'[^/]+$'), '');
  print('libPath: $libPath');
}
