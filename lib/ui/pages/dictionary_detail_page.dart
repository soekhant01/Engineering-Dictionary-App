import 'package:engineering_dictionary_app/database/database_model.dart';
import 'package:engineering_dictionary_app/provider/detail_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class DictionaryDetailPage extends StatefulWidget {
  const DictionaryDetailPage({super.key, required this.databaseModel});

  final DatabaseModel databaseModel;

  @override
  State<DictionaryDetailPage> createState() => _DictionaryDetailPageState();
}

class _DictionaryDetailPageState extends State<DictionaryDetailPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DetailProvider>(
        context,
        listen: false,
      ).getFavourite(widget.databaseModel.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    DatabaseModel databaseModel = widget.databaseModel;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(databaseModel.eng),
        trailing: Consumer<DetailProvider>(
          builder:
              (BuildContext context, DetailProvider provider, Widget? child) {
                int? fav = provider.favourite;
                return GestureDetector(
                  onTap: () {
                    int newFav = fav == 1 ? 0 : 1;
                    Provider.of<DetailProvider>(
                      context,
                      listen: false,
                    ).updateFavourite(databaseModel.id, newFav);
                  },
                  child: fav == 1
                      ? Icon(CupertinoIcons.heart_fill)
                      : Icon(CupertinoIcons.heart),
                );
              },
        ),
      ),
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: CupertinoColors.systemBackground.resolveFrom(context),
              border: Border.all(
                color: CupertinoColors.systemGrey4.resolveFrom(context),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  databaseModel.eng,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),
                Text(
                  "Type: ${databaseModel.type}",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(height: 16),

                Text(
                  "မြန်မာဘာသာ : ",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.systemGrey2,
                  ),
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                ),

                Text(
                  databaseModel.myan.split("~~~").first,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
