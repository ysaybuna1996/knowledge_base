import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:knowledgebase/bloc/api_caller_classes/api.dart';
import 'package:knowledgebase/bloc/enums/environment_variables.dart';
import 'package:knowledgebase/bloc/serialization_classes/quick_links.dart';
import 'package:knowledgebase/bloc/server_configs/server_configuration.dart';
import 'package:http/http.dart' as http;

class GetQuickLinks extends ChangeNotifier {
  ProcessResponse? _processResponse;
  List<QuickLinks>? _quickLinks;

  GetQuickLinks() {
    _processResponse = ProcessResponse.requesting;
    _quickLinks = [];
    getData();
  }

  List<QuickLinks> get quickLinks => _quickLinks!;

  getData() async {
    try {
      processResponse = ProcessResponse.requesting;
      _quickLinks?.clear();
      http.Response response = await APICaller.callServer(
          link: "${ServerConfiguration.host}get_quick_links.php",
          httpverb: HttpVerb.get);
      if (response.statusCode == 200) {
        _quickLinks = List<QuickLinks>.from(jsonDecode(response.body)
            .map((data) => QuickLinks.fromJson(data))).toList();
      } else {
        processResponse = ProcessResponse.unknown;
        return;
      }
      if (_quickLinks!.isEmpty) {
        processResponse = ProcessResponse.noDataReceived;
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
