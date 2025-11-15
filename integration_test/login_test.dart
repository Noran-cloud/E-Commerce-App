import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:rwad2/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('test full login flow', (tester) async {
    app.main();
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(Key('email')), 'test@gmail.com');
    await tester.tap(find.byKey(Key('loginBtn')));
    await tester.pumpAndSettle();
    expect(find.text('welcome'), findsOneWidget);
  });
}
