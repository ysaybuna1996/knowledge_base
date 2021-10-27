// ignore_for_file: must_be_immutable, avoid_web_libraries_in_flutter

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:knowledgebase/bloc/theme_classes/darkmode_provider.dart';
import 'package:knowledgebase/pages/article_viewer.dart';
import 'package:knowledgebase/router/routing.dart';
import 'package:knowledgebase/ui_connectors/quick_links_connector.dart';
import 'package:knowledgebase/ui_connectors/result_card_connector.dart';
import 'package:knowledgebase/widgets/footer.dart';
import 'package:knowledgebase/widgets/header.dart';
import 'package:knowledgebase/widgets/search_bar.dart';
import 'package:provider/provider.dart';
import 'dart:html' as html;

class HomePage extends StatelessWidget {
  String? kbId;
  HomePage({Key? key, this.kbId}) : super(key: key);

  final GlobalKey<ScaffoldState> scf = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final darkMode = Provider.of<DarkModeSwitcher>(context);
    // kbId == null ? debugPrint('nall') : showAlertDialog(context);
    debugPrint('$kbId');
    Future.delayed(const Duration(milliseconds: 250), () {
      if (kbId.toString() != 'null') {
        scf.currentState?.openDrawer();
      }
    });
    return Scaffold(
      key: scf,
      endDrawer: Drawer(
          backgroundColor: Theme.of(context).canvasColor,
          child: const QuickLinksConnector()),
      drawerEdgeDragWidth: 0,
      drawer: Container(
        color: Theme.of(context).canvasColor,
        width: MediaQuery.of(context).size.width * 0.75,
        height: MediaQuery.of(context).size.height,
        child: ArticleViewer(
          kb_id: kbId!,
          mode: darkMode.isDarkMode ? 'dark' : 'light',
        ),
      ),
      floatingActionButton: SizedBox(
        height: 80,
        width: 80,
        child: Tooltip(
          message: "Create and submit KB Article!",
          child: FloatingActionButton(
            backgroundColor: Colors.teal,
            child: const Icon(
              Icons.edit_rounded,
              size: 40,
            ),
            onPressed: () {
              String mode = darkMode.isDarkMode ? "dark" : "light";
              html.window.open(
                  "http://dcitgsdfb4k7c2.continuumgbl.com/api/tech/create-article.php?mode=$mode",
                  "_blank",
                  'location=yes,height=900,width=1300,scrollbars=yes,status=yes');

              debugPrint('here');
            },
          ),
        ),
      ),
      appBar: AppBar(
        leadingWidth: 65,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset(
            'logo.png',
            fit: BoxFit.contain,
          ),
        ),
        title: const Text(
          "Knowledge Base",
          style: TextStyle(),
        ),
        elevation: 0,
        actions: [
          Consumer(builder:
              (BuildContext ctx, DarkModeSwitcher darkModeSwitcher, _) {
            return Tooltip(
              message: "Toggle between dark and light mode.",
              child: IconButton(
                  onPressed: () {
                    //scaffoldKey.currentState?.openDrawer();
                    darkModeSwitcher.isDarkMode = !darkModeSwitcher.isDarkMode;
                    RoutingMap.routeDelegate.popRoute();
                  },
                  icon: Icon(darkModeSwitcher.isDarkMode
                      ? Icons.light_mode
                      : Icons.dark_mode)),
            );
          })
        ],
      ),
      body: Builder(builder: (ctx) {
        return SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(ctx).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: MediaQuery.of(ctx).size.height * 0.33,
                  width: MediaQuery.of(ctx).size.width,
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('background.jpg'),
                            fit: BoxFit.fill)),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 7.01, sigmaY: 7.01),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            // ignore: prefer_const_constructors
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.20,
                              child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Header(
                                    scf: scf,
                                  )),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: 20, right: 20, top: 80),
                              child: Divider(
                                color: Colors.white38,
                                thickness: 5,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 230, bottom: 30),
                              child: SizedBox(
                                  width: MediaQuery.of(ctx).size.width * 0.60,
                                  child: const Searchbar()),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: (MediaQuery.of(ctx).size.height * 0.55),
                  child: const ResultCardConnector(),
                ),
                const Footer()
              ],
            ),
          ),
        );
      }),
    );
  }
}
