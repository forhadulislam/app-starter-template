class Airport {
  int id;
  String name;
  String city;
  String country;
  String iata;
  String icao;
  String latitude;
  String longitude;
  String altitude;
  String timezone;
  String dst;

  Airport(this.name, this.city, this.country,
      this.iata, this.icao, this.latitude,
      this.longitude, this.altitude, this.timezone, this.dst);
}