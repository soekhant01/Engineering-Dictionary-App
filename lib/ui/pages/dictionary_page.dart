import 'package:engineering_dictionary_app/database/database_model.dart';
import 'package:engineering_dictionary_app/provider/dictionary_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../widgets/dictionary_list_widgets.dart';

class DictionaryPage extends StatefulWidget {
  const DictionaryPage({super.key});

  @override
  State<DictionaryPage> createState() => _DictionaryPageState();
}

class _DictionaryPageState extends State<DictionaryPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: NestedScrollView(
        headerSliverBuilder: (_, _) {
          return [
            CupertinoSliverNavigationBar(
              largeTitle: Text("Engineering Dictionary"),
            ),
          ];
        },
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 16.0,
                left: 16.0,
                right: 16.0,
              ),
              child: CupertinoSearchTextField(
                placeholder: "Search Engineering Work",
                onChanged: (String text) {
                  Provider.of<DictionaryProvider>(
                    context,
                    listen: false,
                  ).searchWord(text);
                },
              ),
            ),

            Expanded(
              child: Consumer<DictionaryProvider>(
                builder: (_, provider, _) {
                  List<DatabaseModel> results = provider.results;
                  if (results.isEmpty) {
                    return Center(
                      child: const Icon(
                        CupertinoIcons.doc_text_search,
                        size: 80,
                      ),
                    );
                  }
                  return DictionaryListWidget(results: results);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


