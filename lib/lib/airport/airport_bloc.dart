import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../Airport_model.dart';
import 'airport_event.dart';
import 'airport_repo.dart';
import 'airport_state.dart';

class AirportBloc extends Bloc<AirpoerEvent, AirportState> {
  AirportRepo repo = AirportRepo();

  AirportBloc() : super(Init()) {
    on<AirportList>((event, emit) async {
      emit(Loading());
      try {
        var response = await repo.loadData();
        List<AirportModel> list =
            jsonDecode(response.data).values.map<AirportModel>((element) {
          return AirportModel.fromJson(element);
        }).toList();

        emit(Loaded(list));
      } catch (e) {
        print(e);
      }
    });
  }
}
