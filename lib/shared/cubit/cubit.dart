import 'package:bloc/bloc.dart';
import 'package:bmi_cal/shared/cubit/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiCubit extends Cubit <BmiState> {
  BmiCubit() : super(AppInitialState());
  
  static BmiCubit get(context) => BlocProvider.of(context);
  bool gender = true;
  void isMaleFun ({@required bool isMale}) {
    gender = isMale;
    emit(AppChangeGenderState());
  }

  double height = 120.0;
  void changeSliderFun (value) {
    height = value;
    emit(AppChangeSliderState());
  }

  int age = 20;
  void changeAgeValue ({@required var value}) {
    age = age + value;
    emit(AppChangeAgeValueState());
  }

  int weight = 50;
  void changeWeightValue ({@required var value}) {
    weight = weight + value;
    emit(AppChangeWeightValueState());
  }

}