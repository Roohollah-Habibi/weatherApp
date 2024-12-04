import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather/core/resources/data_state.dart';
import 'package:weather/features/weather_feature/domain/use_cases/get_current_weather_usecase.dart';
import 'package:weather/features/weather_feature/presentation/bloc/cw_status.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetCurrentWeatherUseCase getCurrentWeatherUseCase;
  HomeBloc(this.getCurrentWeatherUseCase) : super(HomeState(cwStatus: CwLoading())) {
    on<LoadCwEvent>((event, emit) async {
      emit(state.copyWith(newStatus: CwLoading()));

      DataState dataState = await getCurrentWeatherUseCase(event.cityName);

      if(dataState is DataSuccess){
        emit(state.copyWith(newStatus: CwCompleted(dataState.data)));
      }
      if(dataState is DataFailed){
        emit(state.copyWith(newStatus: CwError(dataState.error!)));
      }
    });
  }
}
