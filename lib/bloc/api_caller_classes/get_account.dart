import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:knowledgebase/bloc/api_caller_classes/api.dart';
import 'package:knowledgebase/bloc/enums/environment_variables.dart';
import 'package:knowledgebase/bloc/serialization_classes/account.dart';
import 'package:knowledgebase/bloc/server_configs/server_configuration.dart';
import 'package:http/http.dart' as http;

class GetAccount extends ChangeNotifier {
  ProcessResponse? _processResponse;
  Account? _account;

  GetAccount() {
    _processResponse = ProcessResponse.requesting;
    _account = Account();
    getData();
  }

  Account get account => _account!;

  getData() async {
    try {
      processResponse = ProcessResponse.requesting;
      http.Response response = await APICaller.callServer(
          link: "${ServerConfiguration.host}get_remote_user.php",
          httpverb: HttpVerb.post);
      if (response.statusCode == 200) {
        _account = Account.fromJson(jsonDecode(response.body));
      } else {
        processResponse = ProcessResponse.unknown;
        return;
      }
      processResponse = ProcessResponse.success;
    } catch (_) {
      processResponse = ProcessResponse.error;
    }
  }

  logout() async {
    try {
      processResponse = ProcessResponse.requesting;
      http.Response response = await APICaller.callServer(
          link: "${ServerConfiguration.host}logout.php",
          httpverb: HttpVerb.get);
      if (response.statusCode == 200) {
       return;
      } else {
        processResponse = ProcessResponse.unknown;
        return;
      }
      processResponse = ProcessResponse.success;
    } catch (_) {
      processResponse = ProcessResponse.error;
    }
  }

  set processResponse(ProcessResponse response) {
    _processResponse = response;
    notifyListeners();
  }

  ProcessResponse get processResponse => _processResponse!;
}
