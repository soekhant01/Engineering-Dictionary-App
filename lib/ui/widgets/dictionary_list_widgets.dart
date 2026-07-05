import 'package:engineering_dictionary_app/ui/pages/dictionary_detail_page.dart';
import 'package:flutter/cupertino.dart';

import '../../database/database_model.dart';

class DictionaryListWidget extends StatelessWidget {
  const DictionaryListWidget({
    super.key,
    required this.results,
  });

  final List<DatabaseModel> results;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsetsGeometry.symmetric(
          horizontal: 8,
          vertical: 8
      ),
      itemCount: results.length,
      itemBuilder: (context, index) {
        DatabaseModel model = results[index];
        return GestureDetector(
          onTap: (){
            Navigator.push(context,
              CupertinoPageRoute(
                builder: (_){
                  return DictionaryDetailPage(databaseModel: model);
                }
              )
            );
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                color: CupertinoColors.systemBackground.resolveFrom(context),
                border: Border.all(
                  color: CupertinoColors.systemGrey4.resolveFrom(context),

                ),
              borderRadius: BorderRadius.circular(8)
            ),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        model.eng,
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
                        "(${model.type})",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: CupertinoColors.systemGrey2,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),

                Text(
                  model.myan,
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
  }
}