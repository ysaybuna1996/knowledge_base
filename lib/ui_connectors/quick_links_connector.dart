// ignore_for_file: sized_box_for_whitespace, avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:knowledgebase/bloc/api_caller_classes/get_quick_links.dart';
import 'package:knowledgebase/bloc/enums/environment_variables.dart';
import 'package:provider/provider.dart';
import 'dart:html' as html;

class QuickLinksConnector extends StatelessWidget {
  const QuickLinksConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, GetQuickLinks getQuickLinks, __) {
        Widget? child;
        if (getQuickLinks.processResponse == ProcessResponse.success) {
          child = ListView.separated(
              primary: false,
              itemBuilder: (ctx, index) {
                return ListTile(
                  onTap: () {
                    html.window.open(
                        getQuickLinks.quickLinks.elementAt(index).link!,
                        "_blank");
                  },
                  isThreeLine: false,
                  title: Text(getQuickLinks.quickLinks.elementAt(index).name!),
                  leading: Container(
                      height: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 10,
                            backgroundImage: NetworkImage(
                              getQuickLinks.quickLinks
                                  .elementAt(index)
                                  .favicon!,
                            ),
                          ),
                        ],
                      )),
                );
              },
              separatorBuilder: (ctx, index) {
                return const Divider();
              },
              itemCount: getQuickLinks.quickLinks.length);
        } else if (getQuickLinks.processResponse ==
            ProcessResponse.requesting) {
          child = Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Fetching data from the server.',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, letterSpacing: 1.6),
                ),
              )
            ],
          );
        } else if (getQuickLinks.processResponse == ProcessResponse.error ||
            getQuickLinks.processResponse == ProcessResponse.unknown) {
          child = Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.broken_image_rounded,
                color: Colors.red,
                size: 50,
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 15),
                  child: Text(
                    'Unable to complete the request.',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, letterSpacing: 1.6),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () async {
                    getQuickLinks.getData();
                  },
                  icon: const Icon(
                    Icons.refresh_rounded,
                    color: Colors.teal,
                  )),
              const Text(
                'Retry',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ],
          );
        } else {
          child = Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(
                Icons.search_off_outlined,
                color: Colors.red,
                size: 50,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'No results found. Please narrow your query and try again.',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, letterSpacing: 1.6),
                ),
              ),
            ],
          );
        }

        return child;
      },
    );
  }
}
