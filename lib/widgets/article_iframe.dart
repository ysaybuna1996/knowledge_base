// ignore_for_file: must_be_immutable, avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui' as ui;
//conditional import
import 'package:flutter/material.dart';

class ArticleIFrame extends StatefulWidget {
  String? src;
  ArticleIFrame({Key? key, required this.src}) : super(key: key);

  @override
  State<ArticleIFrame> createState() => _ArticleIFrameState();
}

class _ArticleIFrameState extends State<ArticleIFrame> {
  String localValue = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void deactivate() {
    localValue = '';
    debugPrint('deact');
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory("_iframe_window", (int viewId) {
      return iframeBuilder(widget.src!);
    });
    return HtmlElementView(
      viewType: '_iframe_window',
      key: UniqueKey(),
    );
  }

  IFrameElement iframeBuilder(String src) {
    IFrameElement element = IFrameElement();
//Event Listener
    window.onMessage.forEach((element) async {
      debugPrint('Event Received in callback: ${element.data}');
      if (element.data == 'FAILED') {
        debugPrint(element.data);
        // Navigator.pop(context);
      } else if (element.data == 'SUCCESS') {
        debugPrint(element.data);
      }
    });

    debugPrint(src);

    element.requestFullscreen();
    element.src = src;
    element.style.border = 'none';
    element.style.height = '100%';
    element.style.width = '100%';

    return element;
  }
}
