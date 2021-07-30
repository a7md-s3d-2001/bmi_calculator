import 'dart:math';
import 'package:bmi_cal/shared/components/components.dart';
import 'package:bmi_cal/shared/cubit/cubit.dart';
import 'package:bmi_cal/shared/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BmiCubit(),
      child: BlocConsumer<BmiCubit, BmiState>(
        listener: (context, state) {},
        builder: (context, state) {
          BmiCubit cubit = BmiCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'BMI Calculator',
              ),
              brightness: Brightness.dark,
            ),
            body: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        selectGender(
                          onTap: () {
                            cubit.isMaleFun(isMale: true);
                          },
                          title: 'Male',
                          srcImage: 'assets/images/male.png',
                          color: cubit.gender ? Colors.blue : Colors.grey[300],
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        selectGender(
                          onTap: () {
                            cubit.isMaleFun(isMale: false);
                          },
                          title: 'Female',
                          srcImage: 'assets/images/female.png',
                          color: cubit.gender ? Colors.grey[300] : Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Height',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                '${cubit.height.round()}',
                                style: TextStyle(
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                'CM',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Slider(
                            value: cubit.height,
                            onChanged: (value) {
                              cubit.changeSliderFun(value);
                            },
                            min: 80.0,
                            max: 250.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        defaultSelectValue(
                          title: 'Age',
                          value: cubit.age,
                          onTapMinus: () {
                            cubit.changeAgeValue(
                              value: -1,
                            );
                          },
                          onTapPlus: () {
                            cubit.changeAgeValue(
                              value: 1,
                            );
                          },
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        defaultSelectValue(
                          title: 'Weight',
                          value: cubit.weight,
                          onTapMinus: () {
                            cubit.changeWeightValue(
                              value: -1,
                            );
                          },
                          onTapPlus: () {
                            cubit.changeWeightValue(
                              value: 1,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      double result = cubit.weight / pow(cubit.height / 100, 2);
                      Navigator.push(
                        context,
                        PageTransition(
                          child: bmiResult(context, cubit,result),
                          type: PageTransitionType.fade,
                        ),
                      );
                    },
                    height: 50.0,
                    child: Text(
                      'CALCULATE',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
