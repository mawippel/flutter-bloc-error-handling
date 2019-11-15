import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_error_handling/src/app/app_module.dart';
import 'package:flutter_error_handling/src/pages/home/home_bloc.dart';
import 'package:flutter_error_handling/src/pages/home/home_page.dart';
import 'package:flutter_error_handling/src/pages/home/home_repository.dart';
import 'package:flutter_error_handling/src/shared/dio/custom_dio.dart';

class HomeModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => HomeBloc(HomeModule.to.getDependency<HomeRepository>())),
      ];

  @override
  List<Dependency> get dependencies => [
    Dependency((i) => HomeRepository(AppModule.to.getDependency<CustomDio>())),
  ];

  @override
  Widget get view => HomePage();

  static Inject get to => Inject<HomeModule>.of();
}
