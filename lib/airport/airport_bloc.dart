import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import '../Airport_model.dart';
import 'airport_event.dart';
import 'airport_repo.dart';
import 'airport_state.dart';
import 'database.dart';

class AirportBloc extends Bloc<AirpoerEvent, AirportState> {
  AirportRepo repo = AirportRepo();

  AirportBloc() : super(Init()) {
    on<AirportList>((event, emit) async {
      emit(Loading());
      List<AirportModel> list = [];
      try {
        String path = await getDbPath('Airport.db');
        Database database = await openDB(path);
        try {
          List<Map> dblist =
              await database.rawQuery('SELECT * FROM AirportModel');
          list = dblist.map<AirportModel>((e) {
            return AirportModel.fromJson(e);
          }).toList();
          print("done");
        } catch (e) {
          if (e is DatabaseException && e.isNoSuchTableError()) {
            print(e.isNoSuchTableError());
            await createTable(database,
                'CREATE TABLE AirportModel (icao TEXT, iata TEXT,name TEXT,city TEXT,state TEXT,country TEXT,tz TEXT,elevation REAL,lat REAL,lon REAL)');
          }
          print(e);
        }


        if (list.isEmpty) {
          var response = await repo.loadData();

          list = jsonDecode(response.data).values.map<AirportModel>((element) {
            return AirportModel.fromJson(element);
          }).toList();

          await database.transaction((txn) async {
            list.forEach((element) async {
              await txn.rawInsert(
                  'INSERT INTO AirportModel(icao, iata, name,city,state,country,tz,elevation,lat,lon) VALUES("${element.icao}", "${element.iata}", "${element.name}","${element.city}","${element.state}","${element.country}","${element.tz}",${element.elevation},${element.lat},${element.lon})');
            });
          });
        }

        emit(Loaded(list));
      } catch (e) {
        print(e);
      }
    });
  }
}
