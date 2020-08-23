import 'package:adr_in_app_review/adr_in_app_review.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'In App Review Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'In App Review Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void testInAppReview() {
    Future.microtask(() async {
      AdrInAppReview.startInAppReview().then((value) => print('result $value')).catchError((e) {
        print(e.toString());
        // only to avoid crash when error happened and not being handled
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from e it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
          // note: this is only used for testing purpose, don't trigger the in app review flow by active user action
          // it can exhaust your quota, for more info and best practice,
          // check here: https://developer.android.com/guide/playcore/in-app-review#when-to-request
          child: MaterialButton(
        onPressed: testInAppReview,
        child: Text(
          'Test In app review',
          style: TextStyle(color: Colors.white),
        ),
        color: Colors.blue,
      )),
    );
  }
}
