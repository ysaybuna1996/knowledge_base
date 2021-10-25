import 'package:flutter/material.dart';
import 'package:knowledgebase/bloc/api_caller_classes/get_all_result.dart';
import 'package:knowledgebase/bloc/enums/environment_variables.dart';
import 'package:knowledgebase/bloc/serialization_classes/article.dart';
import 'package:knowledgebase/widgets/article_card.dart';
import 'package:provider/provider.dart';

class ResultCardConnector extends StatelessWidget {
  const ResultCardConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, GetArticle getArticle, __) {
      Widget? child;
      if (getArticle.processResponse == ProcessResponse.success) {
        child = Padding(
          padding: const EdgeInsets.only(top: 0, left: 130, right: 130),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:
                  processArticleRequest(article: getArticle.articlePages)),
        );
      } else if (getArticle.processResponse == ProcessResponse.requesting) {
        child = Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'Brewing result...',
                style:
                    TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.6),
              ),
            )
          ],
        );
      } else if (getArticle.processResponse == ProcessResponse.error ||
          getArticle.processResponse == ProcessResponse.unknown) {
        child = Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.broken_image_rounded,
              color: Colors.red,
              size: 50,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 15),
              child: Text(
                'An unknown error encountered while brewing the result.',
                style:
                    TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.6),
              ),
            ),
            IconButton(
                onPressed: () async {
                  await getArticle.getAllArticle();
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
                style:
                    TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.6),
              ),
            ),
          ],
        );
      }
      return child;
    });
  }

  List<Widget> processArticleRequest({required List<ArticlePage> article}) {
    List<Widget> card = [];

    for (var element in article) {
      card.add(Padding(
        padding: const EdgeInsets.only(top: 12),
        child: ResultCard(
          kb_number: element.id,
          description: element.diagnosis,
          title: element.title,
          views: element.views,
        ),
      ));
    }

    //card.add(const Footer());

    // ResultCard(kb_number: element.id, description: element.diagnosis, title: element.title);

    return card;
  }
}
