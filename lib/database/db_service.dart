import 'dart:io';
import 'dart:typed_data';

import 'package:engineering_dictionary_app/database/database_model.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbService {

  static late Database _database;
  final String _tableName = "engineers";
  static Future<void> init() async{
    Directory directory = await getApplicationDocumentsDirectory();
    File dbFile = File("${directory.path}/engineering.db");
    // only one time copy if user first time run app
    if(!dbFile.existsSync()){
      ByteData byteData = await rootBundle.load("assets/engineering.db");
      ByteBuffer buffer = byteData.buffer;
    //   copying the db file
      await dbFile.writeAsBytes(
        buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes)
      );

      _database = await openDatabase(dbFile.path);
    }
  }

  Future<List<DatabaseModel>> searchWord(String keyword) async{
    // to safe sql injection risk we should use both arguments for rawQuery()
    final result = await _database.rawQuery("select * from $_tableName where eng like ?",['$keyword%']);
    return result.map((map){
      return DatabaseModel.fromMap(map);
    }).toList();

  }

}