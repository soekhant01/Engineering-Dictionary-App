import 'package:engineering_dictionary_app/database/db_service.dart';
import 'package:engineering_dictionary_app/ui/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DbService.init();
  runApp(const EngineeringDictionaryApp());
}

class EngineeringDictionaryApp extends StatelessWidget {
  const EngineeringDictionaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: HomePage(),
    );
  }
}

