
import 'package:get_it/get_it.dart';
import 'package:weather/features/weather_feature/data/data_source/remote/api_provider.dart';
import 'package:weather/features/weather_feature/data/repository/weather_repository_impl.dart';
import 'package:weather/features/weather_feature/domain/repository/weather_repository.dart';
import 'package:weather/features/weather_feature/domain/use_cases/get_current_weather_usecase.dart';
import 'package:weather/features/weather_feature/presentation/bloc/home_bloc.dart';

GetIt locator = GetIt.instance;

setup(){
  locator.registerSingleton<ApiProvider>(ApiProvider());

  /// repositories
  locator.registerSingleton<WeatherRepository>(WeatherRepositoryImpl(locator()));

  ///use case
  locator.registerSingleton<GetCurrentWeatherUseCase>(GetCurrentWeatherUseCase(locator()));

  /// bloc
  locator.registerSingleton<HomeBloc>(HomeBloc(locator()));


}