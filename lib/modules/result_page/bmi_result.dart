import 'package:bmi_cal/shared/components/components.dart';
import 'package:bmi_cal/shared/cubit/cubit.dart';
import 'package:bmi_cal/shared/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BmiCubit, BmiState>(
      listener: (context, state){},
      builder: (context, state){
        BmiCubit cubit = BmiCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('BMI Result'),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.keyboard_arrow_left),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            defaultTextResult(
                              title: 'Gender : ${cubit.gender ? 'Male' : 'Female'}',
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            defaultTextResult(
                              title: 'Age : ${cubit.age}',
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            defaultTextResult(
                              title: 'Height : ${cubit.height.round()}',
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            defaultTextResult(
                              title: 'Weight : ${cubit.weight.round()}',
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Result : ${cubit.result.round()}',
                              style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 0.5,
                                color: Colors.blue[900],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                defaultButton(
                  title: 'Try Again',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
