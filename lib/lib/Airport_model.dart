class AirportModel {
  AirportModel({
     required this.icao,
     required this.iata,
     required this.name,
     required this.city,
     required this.state,
     required this.country,
     required this.elevation,
     required this.lat,
     required this.lon,
     required this.tz,});

  AirportModel.fromJson(dynamic json) {
    icao = json['icao'];
    iata = json['iata'];
    name = json['name'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    elevation = json['elevation'];
    lat = json['lat'];
    lon = json['lon'];
    tz = json['tz'];
  }
 late String? icao;
 late String? iata;
 late String? name;
 late String? city;
 late String? state;
 late String? country;
 late num elevation;
 late num lat;
 late num lon;
 late String tz;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['icao'] = icao;
    map['iata'] = iata;
    map['name'] = name;
    map['city'] = city;
    map['state'] = state;
    map['country'] = country;
    map['elevation'] = elevation;
    map['lat'] = lat;
    map['lon'] = lon;
    map['tz'] = tz;
    return map;
  }

}