import 'package:http/http.dart' as http;
import 'package:knowledgebase/bloc/enums/environment_variables.dart';

class APICaller {
  static Future callServer(
      {required String? link,
      Map<String, dynamic>? requestBody,
      required HttpVerb? httpverb}) async {
    if (httpverb == HttpVerb.get) {
      return await http.get(Uri.parse(link!));
    } else if (httpverb == HttpVerb.post) {
      return http.post(Uri.parse(link!), body: requestBody);
    }
    return null;
  }
}
