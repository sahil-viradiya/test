import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:intern/lib/Airport_model.dart';
import 'package:latlong2/latlong.dart';

class AirportDetailsScreen extends StatelessWidget {
  final mapController = MapController();
  AirportModel model;

  AirportDetailsScreen(this.model);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(model.lat.toDouble(), model.lon.toDouble()),
          zoom: 3.2,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(model.lat.toDouble(), model.lon.toDouble()),
                width: 80,
                height: 80,
                builder: (context) {
                  return Column(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.red,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 180,
              margin: EdgeInsets.all(80),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38,
                      offset: Offset(2, 2),
                      blurRadius: 12),
                ],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name.toString(),
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'City: ${model.city}',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    'State: ${model.state}',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    'Country:  ${model.country}',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    'tz:  ${model.tz}',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    'Icao:  ${model.icao}',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
