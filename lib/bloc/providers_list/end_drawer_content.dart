import 'package:flutter/cupertino.dart';
import 'package:knowledgebase/bloc/enums/environment_variables.dart';

class EndDrawerProvider extends ChangeNotifier {
  EndDrawerPref? _endDrawerPref;

  EndDrawerProvider() {
    _endDrawerPref = EndDrawerPref.quickLinks;
  }

  set endDrawerPref(EndDrawerPref pref) {
    _endDrawerPref = pref;
    notifyListeners();
  }

  EndDrawerPref get endDrawerPref => _endDrawerPref!;
}
