# adr_in_app_review

Flutter plugin project to show in app review dialog by google play

## Getting Started

You can simply start using this plugin by calling this method in your desired flow:

```
await startInAppReview();
```

in case error happens, you can fallback by calling the method like this one

```
AdrInAppReview.startInAppReview().then((value) => print('result $value'))
        .catchError((e) {
            // only to avoid crash when error happened and not being handled
            print(e.toString());
      });
```

The google play in app review has a quota, so make sure you don't excessively use it, 
you can use it for example the user already used/experienced some feature on your app.
For more info on best practices, visit: https://developer.android.com/guide/playcore/in-app-review#when-to-request

## Testing

When you running on debug mode, the review dialog won't show, in this case you just need to make sure
that the method `startInAppReview()` return true. If you want to test in real environment, you need to upload
the apk on `Google Play Internal App Sharing or using Internal Test Track` note that to be able to use
those, you will need a google play developer account and already published app.
More Info on how do you test, you can check it here: https://developer.android.com/guide/playcore/in-app-review/test

## Sample

To run the sample, you can open the sample project and run it from there.

screenshots:

Ss 1 | Ss2 | Ss3
------------ | ------------- | ------------- 
<img src="https://github.com/muhrahmatullah/adr_in_app_review/blob/master/ss/1.png" /> | <img src="https://github.com/muhrahmatullah/adr_in_app_review/blob/master/ss/3.png"/> | <img src="https://github.com/muhrahmatullah/adr_in_app_review/blob/master/ss/2.png"/>

note: in above screenshots, I used internal app sharing therefore the submit button is disabled
