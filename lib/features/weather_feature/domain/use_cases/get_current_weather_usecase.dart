import 'package:weather/core/resources/data_state.dart';
import 'package:weather/core/use_case.dart';
import 'package:weather/features/weather_feature/domain/entities/current_city_entity.dart';
import 'package:weather/features/weather_feature/domain/repository/weather_repository.dart';

class GetCurrentWeatherUseCase extends UseCase<DataState<CurrentCityEntity>,String>{
  final WeatherRepository weatherRepository;
  GetCurrentWeatherUseCase(this.weatherRepository);

  @override
  Future<DataState<CurrentCityEntity>> call(String cityName) {
    return weatherRepository.fetchCurrentWeatherData(cityName);
  }


}