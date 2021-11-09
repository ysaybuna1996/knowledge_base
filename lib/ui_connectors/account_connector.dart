import 'package:flutter/material.dart';
import 'package:knowledgebase/bloc/api_caller_classes/get_account.dart';
import 'package:knowledgebase/bloc/enums/environment_variables.dart';
import 'package:knowledgebase/bloc/theme_classes/darkmode_provider.dart';
import 'package:provider/provider.dart';
import 'dart:html' as html;

class AccountConnector extends StatelessWidget {
  const AccountConnector({Key? key}) : super(key: key);

  String _parser(String name){
    var arrayName = name.split(' ');

    if(arrayName.isNotEmpty && arrayName.length >= 2){
      return arrayName[0].substring(0,1) + '' + arrayName[1].substring(0,1);
    }else {
      return arrayName[0].substring(0,1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 55),
          child: Container(
            color: Theme.of(context).canvasColor,
            height: 110,
            width: 250,
            child: Consumer2(
              builder:
                  (_, GetAccount getAccount, DarkModeSwitcher darkModeSwitcher, __) {
                Widget child;
                if (getAccount.processResponse == ProcessResponse.success) {
                  child = ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    primary: false,
                    children: [
                      ExpansionTile(
                        children:  [
                          ListTile(
                            title: const Text('Logout'),
                            leading: const Icon(Icons.logout_rounded),
                            onTap: () async {
                              await Provider.of<GetAccount>(context,listen: false).logout();
                              html.window.location.reload();
                            },
                          )
                        ],
                        subtitle: Text(getAccount.account.email!),
                          title: Text(getAccount.account.name!),
                          leading: CircleAvatar(
                            child: Text (_parser(getAccount.account.name!),),
                            backgroundColor: Colors.teal,
                          )),
                      SwitchListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text('Darkmode'),
                          value: darkModeSwitcher.isDarkMode,
                          onChanged: (val) {
                            darkModeSwitcher.isDarkMode = !darkModeSwitcher.isDarkMode;
                          }),
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
                          'Unknown error.',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, letterSpacing: 1.6),
                        ),
                      ),
                    ],
                  );
                }

                return child;
              },
            ),
          ),
        ),
      ],
    );
  }
}
