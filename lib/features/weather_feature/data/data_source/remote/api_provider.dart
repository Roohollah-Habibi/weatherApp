import 'package:dio/dio.dart';
import 'package:weather/core/constants/constants.dart';

class ApiProvider{
  final Dio _dio = Dio();


  /// current weather api call
  Future<dynamic> callCurrentWeather(String cityName) async{
    Response response = await _dio.get(Constants.baseUrl,queryParameters: {
      'q': cityName,
      'appid': Constants.apiKey1,
      'units': 'metric',
      'lang': 'fa'
    });
    print(response.data);
    return response;
  }
}