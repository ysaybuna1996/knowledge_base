import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:knowledgebase/bloc/api_caller_classes/api.dart';
import 'package:knowledgebase/bloc/enums/environment_variables.dart';
import 'package:knowledgebase/bloc/serialization_classes/article.dart';
import 'package:knowledgebase/bloc/server_configs/server_configuration.dart';

class GetArticle extends ChangeNotifier {
  ProcessResponse? _processResponse;
  List<ArticlePage>? _articlePages;
  int? _page;
  int? _totalPage;
  String? _keyWord;
  GetArticle() {
    _keyWord = "";
    _totalPage = 0;
    _page = 1;
    _articlePages = [];
    getAllArticle();
  }

  set keyWord(arg) {
    _keyWord = arg;
    notifyListeners();
  }

  String? get keyWord => _keyWord;

  set articlePages(List<ArticlePage> articlePages) {
    _articlePages = articlePages;
    notifyListeners();
  }

  List<ArticlePage> get articlePages => _articlePages!;

  set pageIncrement(bool increment) {
    increment ? _page = _page! + 1 : _page = _page! - 1;
    notifyListeners();
  }

  set resetPage(bool val) {
    _page = 1;
    notifyListeners();
  }

  int get page => _page!;

  set totalPage(tPage) {
    _totalPage = tPage;
    notifyListeners();
  }

  int get totalPage => _totalPage!;

  getAllArticle() async {
    articlePages.clear();
    processResponse = ProcessResponse.requesting;
    debugPrint(
        "${ServerConfiguration.host}getresult.php?page_no=$_page&keyword=$_keyWord");
    try {
      http.Response response = await APICaller.callServer(
          link:
              "${ServerConfiguration.host}getresult.php?page_no=$_page&keyword=$_keyWord",
          httpverb: HttpVerb.get);
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        Article art = Article.fromJson(jsonResponse);
        articlePages = art.data!;
        totalPage = art.page!;
        if (articlePages.isEmpty) {
          debugPrint('pumasok');
          processResponse = ProcessResponse.noDataReceived;
          return;
        }
        processResponse = ProcessResponse.success;
      } else {
        processResponse = ProcessResponse.error;
        debugPrint('error');
      }
    } catch (e) {
      processResponse = ProcessResponse.error;
      debugPrint(e.toString());
    }
  }

  set processResponse(ProcessResponse arg) {
    _processResponse = arg;
    notifyListeners();
  }

  ProcessResponse get processResponse => _processResponse!;
}
