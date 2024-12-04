import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/features/weather_feature/presentation/bloc/home_bloc.dart';
import 'package:weather/locator.dart';
import 'core/widgets/main_wrapper.dart';

void main() async {
  await setup();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MultiBlocProvider(
      providers: [BlocProvider(create: (_) => locator<HomeBloc>())],
      child: const MainWrapper(),
    ),
  ));
}
