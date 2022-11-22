// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:bdb_challenge/src/ui/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bdb_challenge/main.dart';

void main() {

  var videoKey = const Key(Keys.videoKey);

  group('TikTok video Test', () {
    testWidgets('When app starts video is visible. ', (WidgetTester tester) async {
      // pump widget
      await tester.pumpWidget( MyApp());

      // Verify that video is visible.
      expect(find.byKey(videoKey), findsOneWidget);

    } );

    testWidgets('User can play and pause video. ', (WidgetTester tester) async {
      // pump widget
      await tester.pumpWidget( MyApp());
      var videoButton = find.byKey(videoKey);

      expect(videoButton, findsOneWidget);

      // Tap the 'video Thumbnail'.
      await tester.tap(videoButton,warnIfMissed: false,);
      await tester.pump();

    }

    );
  });

}
