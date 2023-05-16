import '../Airport_model.dart';

abstract class AirportState {}

class Init extends AirportState {}

class Loading extends AirportState {}

class Loaded extends AirportState {
  List<AirportModel> list;

  Loaded(this.list);
}

class Failed extends AirportState {
  String msg;

  Failed(this.msg);
}
