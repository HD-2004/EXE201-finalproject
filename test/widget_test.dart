import 'package:flutter_test/flutter_test.dart';
import 'package:oppo_mobile/app.dart';

void main() {
  testWidgets('shows onboarding actions and opens jobs list', (tester) async {
    await tester.pumpWidget(const OppoApp());
    await tester.pumpAndSettle();

    expect(find.text('Op Po'), findsOneWidget);
    expect(find.text('Find shifts'), findsOneWidget);
    expect(find.text('Post a job'), findsOneWidget);

    await tester.tap(find.text('Find shifts'));
    await tester.pumpAndSettle();

    expect(find.text('Urgent jobs'), findsOneWidget);
    expect(find.text('Barista ca tối'), findsOneWidget);
  });
}
