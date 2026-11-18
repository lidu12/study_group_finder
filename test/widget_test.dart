import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:study_group_finder/main.dart';

void main() {
  testWidgets('App launches on Home screen and navigation tabs exist', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: StudyGroupFinderApp(),
      ),
    );
    await tester.pumpAndSettle();

    // Verify AppBar on Home Screen
    expect(find.text('Study Group Finder'), findsOneWidget);

    // Verify 4 Bottom Navigation Bar destinations exist
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Find Groups'), findsOneWidget);
    expect(find.text('AI Planner'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);

    // Verify Section Headers on Home
    expect(find.text('My Study Groups'), findsOneWidget);
    expect(find.text('Upcoming Sessions'), findsOneWidget);
  });

  testWidgets('Navigation switches tabs to AI Planner and Find Groups', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: StudyGroupFinderApp(),
      ),
    );
    await tester.pumpAndSettle();

    // Tap "AI Planner" tab
    await tester.tap(find.text('AI Planner'));
    await tester.pumpAndSettle();

    // Verify AI Planner screen is rendered
    expect(find.text('Generate Study Plan'), findsOneWidget);
    expect(find.text('Available Study Time'), findsOneWidget);

    // Tap "Find Groups" tab
    await tester.tap(find.text('Find Groups'));
    await tester.pumpAndSettle();

    // Verify Find Groups screen is rendered
    expect(find.text('Find Study Groups'), findsOneWidget);
  });
}
