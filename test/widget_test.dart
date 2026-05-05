import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:openmarket/features/browse/browse_screen.dart';

void main() {
  testWidgets('BrowseScreen renders search field and seed listings', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(home: BrowseScreen()),
      ),
    );
    await tester.pump();

    expect(find.byType(TextField), findsOneWidget);
    expect(find.byTooltip('Filters'), findsOneWidget);
    expect(find.byTooltip('Create listing'), findsOneWidget);
    expect(find.textContaining('\$'), findsWidgets);
  });

  testWidgets('Typing in search filters listings (debounced)', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(home: BrowseScreen()),
      ),
    );
    await tester.pump();

    await tester.enterText(find.byType(TextField), 'hasselblad');
    await tester.pump(const Duration(milliseconds: 350));
    await tester.pump();

    expect(find.textContaining('Hasselblad'), findsOneWidget);
    expect(find.textContaining('Vitamix'), findsNothing);
  });
}
