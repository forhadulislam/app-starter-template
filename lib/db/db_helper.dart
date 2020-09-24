import 'dart:async';
import 'dart:io' as io;
import 'package:app_starter_template/models/airport.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelpers{
  static Database _db;

  Future<Database> get db async{
    if(_db != null) return _db;
    _db = await initDB();
    return _db;
  }

  initDB() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String dbPath = join(documentsDirectory.path, "assets/data/airports.sqlite");
    var db = await openDatabase(dbPath);
    return db;
  }

  Future<List<Airport>> getAirports() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM airports');
    List<Airport> airports = new List();
    for (int i = 0; i < list.length; i++) {
      airports.add( new Airport( list[i]["name"], list[i]["city"], list[i]["country"],
          list[i]["iata"], list[i]["icao"], list[i]["latitude"],
          list[i]["longitude"], list[i]["altitude"], list[i]["timezone"], list[i]["dst"] ));
    }
    print(airports.length);
    return airports;
  }
}