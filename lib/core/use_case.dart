import 'package:weather/features/weather_feature/domain/entities/current_city_entity.dart';

import 'resources/data_state.dart';

abstract class UseCase<T,P>{

  Future<T> call(P params);
}