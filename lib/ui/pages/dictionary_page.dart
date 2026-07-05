import 'package:engineering_dictionary_app/database/database_model.dart';
import 'package:engineering_dictionary_app/provider/dictionary_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                  return ListView.builder(
                    padding: EdgeInsetsGeometry.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    itemCount: results.length,
                    itemBuilder: (context, index) {
                      DatabaseModel resultList = results[index];
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: .start,
                            children: [
                              Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      resultList.eng,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Flexible(
                                    child: Text(
                                      "(${resultList.type})",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),

                              Text(
                                resultList.myan,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
