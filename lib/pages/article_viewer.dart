// ignore_for_file: non_constant_identifier_names, avoid_web_libraries_in_flutter

import 'dart:html' as html;
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:knowledgebase/bloc/server_configs/server_configuration.dart';

// ignore: must_be_immutable
class ArticleViewer extends StatefulWidget {
  String? kb_id;
  String? mode;
  GlobalKey<ScaffoldState>? keyPassed;
  ArticleViewer({Key? key, this.kb_id, this.mode, this.keyPassed})
      : super(key: key);

  @override
  State<ArticleViewer> createState() => _ArticleViewerState();
}

class _ArticleViewerState extends State<ArticleViewer> {
  @override
  Widget build(BuildContext context) {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry
        .registerViewFactory("${widget.kb_id!}${widget.mode!}", (int viewId) {
      return iframeBuilder(widget.kb_id!, context, widget.mode!);
    });
    return HtmlElementView(
      viewType: "${widget.kb_id!}${widget.mode!}",
      key: UniqueKey(),
    );
  }

  html.IFrameElement iframeBuilder(String id, BuildContext ctx, String mode) {
    html.IFrameElement element = html.IFrameElement();
    html.window.onMessage.forEach((element) {
      debugPrint('Event Received in callback: ${element.data}');
      if (element.data == 'FAILED') {
        debugPrint(element.data);
      } else if (element.data == 'SUCCESS') {
        debugPrint(element.data);

        if (mounted) {
          setState(() {});
        }
      }
    });

    //&mode=${Provider.of<DarkModeSwitcher>(ctx).isDarkMode ? "dark" : "light"}
    element.requestFullscreen();
    element.src = "${ServerConfiguration.viewer}$id&mode=$mode";
    element.style.border = 'none';
    element.style.height = '100%';
    element.style.width = '100%';

    return element;
  }
}
