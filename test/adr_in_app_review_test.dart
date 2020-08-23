import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:adr_in_app_review/adr_in_app_review.dart';

void main() {
  const MethodChannel channel = MethodChannel('adr_in_app_review');

  TestWidgetsFlutterBinding.ensureInitialized();


  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      if(methodCall.method == 'startInAppReview') {
        return true;
      } else {
        return false;
      }
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('startInAppReview', () async {
    expect(await AdrInAppReview.startInAppReview(isTest: true), true);
  });
}
