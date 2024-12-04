import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/features/weather_feature/domain/entities/current_city_entity.dart';
import 'package:weather/features/weather_feature/presentation/bloc/cw_status.dart';
import 'package:weather/features/weather_feature/presentation/bloc/home_bloc.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {

  @override
  void initState() {
    super.initState();

    BlocProvider.of<HomeBloc>(context).add(LoadCwEvent('Herat'));
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<HomeBloc,HomeState>(builder: (context, state) {
              if(state.cwStatus is CwLoading){
                return const Text('LOADING...');
              }

              if(state.cwStatus is CwCompleted){
                CwCompleted cwCompleted = state.cwStatus as CwCompleted;
                final CurrentCityEntity currentCityEntity = cwCompleted.currentCityEntity;
                return Text('${currentCityEntity.name}');
              }
              if(state.cwStatus is CwError){
                return const Text('Error...');
              }
              return Container();
            },)
          ],
        ),
      ),
    );
  }
}
