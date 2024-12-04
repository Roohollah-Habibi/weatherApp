import 'package:flutter/material.dart';
import 'package:weather/features/weather_feature/domain/entities/current_city_entity.dart';

@immutable
class CwStatus {}

class CwLoading extends CwStatus{}

class CwCompleted extends CwStatus{
  final CurrentCityEntity currentCityEntity;
  CwCompleted(this.currentCityEntity);
}

class CwError extends CwStatus{
  final String error;
  CwError(this.error);
}
