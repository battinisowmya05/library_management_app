import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:library_management_app/main.dart';

void main() {
  testWidgets('Library Management System basic widgets test', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const LibraryApp());

    expect(find.text('Library Management System'), findsOneWidget);

    expect(find.text('Welcome to Digital Library'), findsOneWidget);

    expect(find.byIcon(Icons.library_books), findsOneWidget);

    expect(find.text('Explore Books'), findsOneWidget);

    expect(find.byType(Image), findsOneWidget);

    expect(find.byType(Container), findsWidgets);
  });
}
