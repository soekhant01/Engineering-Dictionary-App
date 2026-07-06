import 'package:engineering_dictionary_app/database/db_service.dart';
import 'package:engineering_dictionary_app/provider/detail_provider.dart';
import 'package:engineering_dictionary_app/provider/dictionary_provider.dart';
import 'package:engineering_dictionary_app/ui/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbService.init();
  runApp(const EngineeringDictionaryApp());
}

class EngineeringDictionaryApp extends StatelessWidget {
  const EngineeringDictionaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DictionaryProvider()),
        ChangeNotifierProvider(create: (_) => DetailProvider()),
      ],
      child: CupertinoApp(debugShowCheckedModeBanner: false, home: HomePage()),
    );
    // return CupertinoApp(
    //   debugShowCheckedModeBanner: false,
    //   home: MultiProvider(
    //     providers: [
    //       ChangeNotifierProvider(create: (_) => DictionaryProvider()),
    //       ChangeNotifierProvider(create: (_) => DetailProvider()),
    //     ],
    //     child: HomePage(),
    //   ),
    // );
  }
}
