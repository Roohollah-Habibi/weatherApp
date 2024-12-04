import 'package:dio/dio.dart';
import 'package:weather/core/resources/data_state.dart';
import 'package:weather/features/weather_feature/data/data_source/remote/api_provider.dart';
import 'package:weather/features/weather_feature/data/models/current_city_model.dart';
import 'package:weather/features/weather_feature/domain/entities/current_city_entity.dart';
import 'package:weather/features/weather_feature/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final ApiProvider _apiProvider;

  WeatherRepositoryImpl(this._apiProvider);

  @override
  Future<DataState<CurrentCityEntity>> fetchCurrentWeatherData(String cityName) async {
    try {
      final Response response = await _apiProvider.callCurrentWeather(cityName);

      if (response.statusCode == 200) {
        final CurrentCityEntity currentCityEntity = CurrentCityModel.fromJson(response.data);
        return DataSuccess(currentCityEntity);
      }else{
        return DataFailed('Something went wrong...try again');
      }
    } catch (e) {
      return DataFailed('Network Error');
    }
  }
}
