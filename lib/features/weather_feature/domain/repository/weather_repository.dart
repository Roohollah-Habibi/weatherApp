import 'package:weather/core/resources/data_state.dart';
import 'package:weather/features/weather_feature/domain/entities/current_city_entity.dart';


abstract class WeatherRepository {
  Future<DataState<CurrentCityEntity>>fetchCurrentWeatherData(String cityName);
}