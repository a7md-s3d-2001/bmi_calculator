import 'package:bmi_cal/modules/info_page/bmi_info.dart';
import 'package:bmi_cal/shared/cubit/cubit.dart';
import 'package:bmi_cal/shared/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bmi_cal/shared/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BmiCubit(),
      child: BlocConsumer<BmiCubit, BmiState>(
        listener: (context, state){},
        builder: (context, state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: InfoPage(),
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                elevation: 0.0,
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.blue,
                  statusBarIconBrightness: Brightness.light,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}