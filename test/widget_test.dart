// Widget tests for the BeAFox app.
//
// The splash screen runs a repeating dot-spinner animation and a 3-second
// auto-redirect timer, so tests advance time with explicit `pump` durations
// rather than `pumpAndSettle` (which never settles while the spinner repeats).

import 'package:flutter_test/flutter_test.dart';

import 'package:beafox/main.dart';

void main() {
  group('BeAFox', () {
    testWidgets('launches on the branded splash screen', (tester) async {
      await tester.pumpWidget(const BeafoxApp());

      // The first frame shows the splash brand mark.
      expect(find.text('BeAFox'), findsOneWidget);

      // Drain the splash auto-redirect timer so no timer is left pending.
      await tester.pump(const Duration(seconds: 3));
      await tester.pump(const Duration(milliseconds: 500));
    });

    testWidgets('auto-advances from splash to onboarding', (tester) async {
      await tester.pumpWidget(const BeafoxApp());

      // Splash waits 3s, then routes to the welcome screen.
      await tester.pump(const Duration(seconds: 3));
      await tester.pump(); // build the route transition
      await tester.pump(const Duration(milliseconds: 500)); // finish transition

      // Welcome screen primary call-to-action.
      expect(find.text('Get Started'), findsOneWidget);
    });
  });
}
