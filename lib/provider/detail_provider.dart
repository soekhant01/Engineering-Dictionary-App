import 'package:engineering_dictionary_app/database/db_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

class DetailProvider extends ChangeNotifier{

  final DbService _dbService = DbService();
  int? favourite;

  void updateFavourite(int id, int favourite) async{
    await _dbService.updateFavourite(id, favourite);
    getFavourite(id);
  }

  void getFavourite(int id) async{
    favourite = await _dbService.getFavourite(id);
    notifyListeners() ;
  }


}