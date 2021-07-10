import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {

  WebViewController _controller;
  final Completer<WebViewController> _controllerCompleter =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return WebView(
      javascriptMode: JavascriptMode.unrestricted,
      initialUrl: "https://studiodecor.co.in/wedding/",
      key: UniqueKey(),
      onWebViewCreated: (WebViewController webViewController) {
        _controllerCompleter.future.then((value) => _controller = value);
        _controllerCompleter.complete(webViewController);
      },
    );
  }
}
