import 'package:equatable/equatable.dart';
import 'package:weather/features/weather_feature/data/models/current_city_model.dart';

class CurrentCityEntity extends Equatable {
  final Coord? coord;
  final List<Weather>? weather;
  final String? base;
  final Main? main;
  final num? visibility;
  final Wind? wind;
  final Rain? rain;
  final Clouds? clouds;
  final num? dt;
  final Sys? sys;
  final num? timezone;
  final num? id;
  final String? name;
  final num? cod;

  const CurrentCityEntity({
    this.weather,
    this.base,
    this.main,
    this.coord,
    this.dt,
    this.visibility,
    this.name,
    this.clouds,
    this.id,
    this.rain,
    this.sys,
    this.timezone,
    this.wind,
    this.cod,
  });

  @override
  List<Object?> get props => [coord,weather,base,main];
}
