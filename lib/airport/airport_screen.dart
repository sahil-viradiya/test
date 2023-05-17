import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'airport_bloc.dart';
import 'airport_details_screen.dart';
import 'airport_event.dart';
import 'airport_state.dart';

class AirportScreen extends StatelessWidget {
  const AirportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AirportBloc, AirportState>(
        listener: (context, state) {
          //todo
        },
        builder: (context, state) {
          if (state is Init) {
            BlocProvider.of<AirportBloc>(context).add(AirportList());
          }
          return state is Loaded
              ? ListView.builder(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AirportDetailsScreen(state.list[index]),
                            ));
                      },
                      child: Container(
                        margin: EdgeInsets.all(24),
                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(color: Colors.cyan),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.all(8),
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(6)),
                                  child:
                                      Text("Name : ${state.list[index].name}"),
                                ),
                                Container(
                                  margin: EdgeInsets.all(8),
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(6)),
                                  child:
                                      Text("City :  ${state.list[index].city}"),
                                ),
                                Container(
                                  margin: EdgeInsets.all(8),
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Text(
                                      "State :  ${state.list[index].state}"),
                                ),
                                Container(
                                  margin: EdgeInsets.all(8),
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(6)),
                                  child:
                                      Text("Icao :  ${state.list[index].icao}"),
                                ),
                                Container(
                                  margin: EdgeInsets.all(8),
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Text(
                                      "Country :  ${state.list[index].country}"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: state.list.length)
              : CircularProgressIndicator();
        },
      ),
    );
  }
}
