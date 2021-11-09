import 'package:flutter/material.dart';
import 'package:knowledgebase/bloc/api_caller_classes/get_account.dart';
import 'package:knowledgebase/bloc/api_caller_classes/get_all_result.dart';
import 'package:knowledgebase/bloc/api_caller_classes/get_quick_links.dart';
import 'package:knowledgebase/bloc/providers_list/end_drawer_content.dart';
import 'package:knowledgebase/bloc/theme_classes/darkmode_provider.dart';
import 'package:provider/provider.dart';

class AppProviders extends StatelessWidget {
  final Widget child;

  const AppProviders({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GetArticle()),
        ChangeNotifierProvider(create: (_) => DarkModeSwitcher()),
        ChangeNotifierProvider(create: (_) => GetQuickLinks()),
        ChangeNotifierProvider(create: (_) => EndDrawerProvider()),
        ChangeNotifierProvider(create: (_) => GetAccount())
      ],
      child: child,
    );
  }
}
