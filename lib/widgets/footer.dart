import 'package:flutter/material.dart';
import 'package:knowledgebase/bloc/api_caller_classes/get_all_result.dart';
import 'package:knowledgebase/bloc/enums/environment_variables.dart';
import 'package:provider/provider.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, GetArticle getArticle, __) {
      return getArticle.processResponse == ProcessResponse.success
          ? SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  getArticle.page != 1
                      ? InkWell(
                          onTap: () async {
                            getArticle.pageIncrement = false;
                            getArticle.getAllArticle();
                          },
                          child: const Icon(
                            Icons.arrow_left_rounded,
                            size: 60,
                          ),
                        )
                      : const SizedBox(),
                  Container(
                    width: 30,
                    decoration: const BoxDecoration(
                        color: Colors.transparent, shape: BoxShape.rectangle),
                    child: Center(
                        child: Text(
                      getArticle.page.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          shadows: [
                            Shadow(
                              blurRadius: 1.0,
                              color: Colors.teal,
                              offset: Offset(1.0, 1.0),
                            ),
                          ]),
                    )),
                  ),
                  getArticle.totalPage != getArticle.page
                      ? InkWell(
                          borderRadius: BorderRadius.circular(60),
                          onTap: () async {
                            getArticle.pageIncrement = true;
                            getArticle.getAllArticle();
                          },
                          child: const Icon(
                            Icons.arrow_right_rounded,
                            size: 60,
                          ),
                        )
                      : const SizedBox()
                ],
              ),
            )
          : Container();
    });
  }
}
