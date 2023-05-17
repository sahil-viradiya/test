import 'package:dio/dio.dart';

class AirportRepo {
  Future<dynamic> loadData() async {
    var response = await Dio().get(
        "https://raw.githubusercontent.com/mwgg/Airports/master/airports.json");
    return response;
  }
}
