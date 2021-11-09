// ignore_for_file: avoid_web_libraries_in_flutter, must_be_immutable

import 'package:flutter/material.dart';
import 'package:knowledgebase/bloc/enums/environment_variables.dart';
import 'package:knowledgebase/bloc/providers_list/end_drawer_content.dart';
import 'package:knowledgebase/local_preference/custom_icons/c_icons.dart';
import 'dart:html' as html;

import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  GlobalKey<ScaffoldState>? scf;
  Header({Key? key, required this.scf}) : super(key: key);

  List<Widget> headerContent(BuildContext ctx) {
    return [
      Padding(
        padding: const EdgeInsets.only(left: 15, right: 50),
        child: InkWell(
          onTap: () {
            html.window.open(
                'http://dcitgsdfb4k7c2.continuumgbl.com/cannedresponse/',
                "_blank");
            //scf!.currentState?.openEndDrawer();
          },
          child: Card(
            elevation: 10,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: SizedBox(
              height: 150,
              width: 175,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.article_rounded,
                    size: 70,
                    color: Colors.teal,
                  ),
                  Text(
                    'Canned Response',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 15, right: 50),
        child: InkWell(
          onTap: () {
            html.window
                .open('http://dcitgsdfb4k7c2.continuumgbl.com/IM/', "_blank");
          },
          child: Card(
            elevation: 10,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: SizedBox(
              height: 150,
              width: 175,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.warning_amber_rounded,
                    size: 70,
                    color: Colors.teal,
                  ),
                  Text(
                    'Incident Reporting',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 15, right: 50),
        child: InkWell(
          onTap: () {
            html.window.open(
                'https://adfs.continuumgbl.com/adfs/ls/IdpInitiatedSignon.aspx?LoginToRP=https://continuumgbl.kronos.net',
                "_blank");
          },
          child: Card(
            elevation: 10,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: SizedBox(
              height: 150,
              width: 175,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    CustomIcons.kronos,
                    size: 65,
                    color: Colors.teal,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Kronos',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 15, right: 50),
        child: InkWell(
          onTap: () {
            html.window.open(
                'https://adfs.continuumgbl.com/adfs/ls/idpinitiatedsignon.aspx?loginToRp=https://www.successfactors.com/continuumg',
                "_blank");

            //
          },
          child: Card(
            elevation: 10,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: SizedBox(
              height: 150,
              width: 175,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    CustomIcons.sap,
                    size: 75,
                    color: Colors.teal,
                  ),
                  Text(
                    'HR Central',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 15, right: 50),
        child: InkWell(
          onTap: () {
            html.window.open(
                'https://continuumgbl.sharepoint.com/sites/ITOCServiceDesk/Lists/Whats%20New',
                "_blank");
            //https://continuumgbl.sharepoint.com/sites/ITOCServiceDesk/Lists/Whats%20New
          },
          child: Card(
            elevation: 10,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: SizedBox(
              height: 150,
              width: 175,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    CustomIcons.sharepoint,
                    size: 65,
                    color: Colors.teal,
                  ),
                  Text(
                    'ITOC Sharepoint',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 15, right: 50),
        child: InkWell(
          onTap: () {
            Provider.of<EndDrawerProvider>(ctx, listen: false).endDrawerPref = EndDrawerPref.quickLinks;
            scf!.currentState?.openEndDrawer();
          },
          child: Card(
            elevation: 10,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: SizedBox(
              height: 150,
              width: 175,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.http_rounded,
                    size: 70,
                    color: Colors.teal,
                  ),
                  Text(
                    'Quick Links',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListView(
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          primary: false,
          children: List.generate(headerContent(context).length,
              (index) => headerContent(context).elementAt(index))),
    );
  }
}
