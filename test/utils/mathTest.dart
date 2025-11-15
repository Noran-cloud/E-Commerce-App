import 'dart:nativewrappers/_internal/vm/lib/math_patch.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rwad2/utils/math.dart';
import 'package:rwad2/utils/widgets.dart';

void main() {
  test('add two numbers', () {
    expect(add(6, 3), 9);
  });

  testWidgets('test widgets screen', (tester) async {
    await tester.pumpWidget(MaterialApp(home: MyWidget()));
    expect(find.byKey(Key('button')), findsOneWidget);
    expect(find.byType(Text), findsOneWidget);
  });
}
