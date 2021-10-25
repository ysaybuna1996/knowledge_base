// ignore_for_file: non_constant_identifier_names, unused_import, avoid_web_libraries_in_flutter

import 'dart:js';
import 'package:flutter/material.dart';
import 'package:knowledgebase/router/routing.dart';
import 'package:routemaster/routemaster.dart';

class ResultCard extends StatelessWidget {
  final String? kb_number;
  final String? title;
  final String? description;
  final String? views;
  const ResultCard(
      {Key? key,
      required this.kb_number,
      required this.description,
      required this.title,
      this.views})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shadowColor: Colors.white,
      child: ListTile(
        minLeadingWidth: 0,
        isThreeLine: true,
        // ignore: sized_box_for_whitespace
        trailing: Container(
            decoration: const BoxDecoration(
                border:
                    Border(right: BorderSide(color: Colors.green, width: 5))),
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Icon(
                    Icons.remove_red_eye_rounded,
                    size: 12,
                  ),
                  Text(
                    '${views!} views',
                    style: const TextStyle(
                        fontStyle: FontStyle.italic, fontSize: 10),
                  ),
                ],
              ),
            )),
        // ignore: sized_box_for_whitespace
        leading: Container(
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "KB-${kb_number!}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            )),
        title: Text(
          title!,
          style: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, letterSpacing: 1.3),
        ),
        subtitle: Text(description!),
        onTap: () {
          RoutingMap.routeDelegate.push('/article/KB-${kb_number!}');
          // debugPrint(ViewFormatter.formatter("12345"));
        },
      ),
    );
  }
}
