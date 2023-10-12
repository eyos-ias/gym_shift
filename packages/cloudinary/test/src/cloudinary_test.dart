// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:cloudinary/cloudinary.dart';

void main() {
  group('Cloudinary', () {
    test('can be instantiated', () {
      expect(Cloudinary(), isNotNull);
    });
  });
}
