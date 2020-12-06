import 'dart:io';
import 'package:path/path.dart' show join, dirname;

String fixture(String name) {
  try {
    return File(join(dirname('test'), 'fixtures', name)).readAsStringSync();
  } catch (_) {
    return File(join(dirname('test/fixtures'), 'fixtures', name))
        .readAsStringSync();
  }
}
