import 'package:engineering_dictionary_app/database/database_model.dart';
import 'package:engineering_dictionary_app/database/db_service.dart';
import 'package:flutter/cupertino.dart';

class FavouriteProvider extends ChangeNotifier {
  final DbService _dbService = DbService();
  List<DatabaseModel> favouriteList = [];

  void getFavouriteList() async {
    favouriteList = await _dbService.getFavouriteList();
    notifyListeners();
  }
}
