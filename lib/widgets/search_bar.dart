import 'package:flutter/material.dart';
import 'package:knowledgebase/bloc/api_caller_classes/get_all_result.dart';
import 'package:provider/provider.dart';

class Searchbar extends StatefulWidget {
  const Searchbar({Key? key}) : super(key: key);

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 15),
          child: Text(
            'Search KB Article',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15),
          ),
        ),
        Expanded(
          child: TextFormField(
            controller: _textController,
            onChanged: (text) async {
              /* if (text.toString().length >= 3) {
                Future.delayed(const Duration(milliseconds: 600), () {
                  reset(context, text);
                });
              }

              return;*/
            },
            onFieldSubmitted: (text) {
              reset(context, text);
            },
            style: const TextStyle(color: Colors.black),
            showCursor: true,
            decoration: InputDecoration(
              suffixIcon: Tooltip(
                message: "Clear search",
                child: InkWell(
                  onTap: () {
                    _textController.clear();
                    reset(context, "");
                  },
                  child: const Icon(
                    Icons.close_rounded,
                    color: Colors.teal,
                  ),
                ),
              ),
              suffixStyle: const TextStyle(color: Colors.teal),
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  const EdgeInsets.only(left: 14.0, bottom: 10, top: 20),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(25.7),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(25.7),
              ),
            ),
          ),
        )
      ],
    );
  }

  void reset(BuildContext context, String text) {
    Provider.of<GetArticle>(context, listen: false).resetPage = true;
    Provider.of<GetArticle>(context, listen: false).totalPage = 0;
    Provider.of<GetArticle>(context, listen: false).keyWord = text;
    Provider.of<GetArticle>(context, listen: false).getAllArticle();
  }
}
