import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

class AdrInAppReview {
  static const MethodChannel _channel =
      const MethodChannel('adr_in_app_review');

  static Future<bool> startInAppReview({bool isTest = false}) async {
    if(Platform.isAndroid) {
      try {
        // if the response return true, meaning that the in app review flow has been shown to the user
        // however as per api said, we don't have the control to know whether user already submit a review
        // or just dismiss the dialog
        final response = await _channel.invokeMethod('startInAppReview');
        return response;
      } on PlatformException catch (e) {
        throw('error happened: ${e.toString()}');
      }
    } else if (isTest) {
      // temporary solution for testing
      try {
        final response = await _channel.invokeMethod('startInAppReview');
        return response;
      } on PlatformException catch (e) {
        throw('error happened: ${e.toString()}');
      }
    }else {
      throw('this plugin only support android os');
    }
  }

}
