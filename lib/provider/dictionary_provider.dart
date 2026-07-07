import 'package:engineering_dictionary_app/database/database_model.dart';
import 'package:engineering_dictionary_app/database/db_service.dart';
import 'package:flutter/foundation.dart';

class DictionaryProvider extends ChangeNotifier {
  final DbService _dbService = DbService();
  List<DatabaseModel> results = [];

  void searchWord(String keyword) async {
    results = await _dbService.searchWord(keyword);
    notifyListeners();
  }

  void clearFavourites() async {
    await _dbService.clearFavourites();
    notifyListeners();
  }
}
