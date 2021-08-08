import 'package:bmi_cal/modules/home_page/bmi_home.dart';
import 'package:bmi_cal/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI INFO'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  defaultTextTitleInfo('BMI CALCULATOR'),
                  SizedBox(
                    height: 10.0,
                  ),
                  defaultTextDetailsInfo('Body mass index (BMI) is a measure of body fat based on height and weight that applies to adult men and women',),
                  SizedBox(
                    height: 30.0,
                  ),
                  defaultTextTitleInfo('BMI CATEGORIES'),
                  SizedBox(
                    height: 10.0,
                  ),
                  defaultTextDetailsInfo('Underweight = <18.5'),
                  SizedBox(
                    height: 10.0,
                  ),
                  defaultTextDetailsInfo('Normal weight = 18.5–24.9'),
                  SizedBox(
                    height: 10.0,
                  ),
                  defaultTextDetailsInfo('Overweight = 25–29.9'),
                  SizedBox(
                    height: 10.0,
                  ),
                  defaultTextDetailsInfo('Obesity = BMI of 30 or greater'),
                ],
              ),
            ),
          ),
          defaultButton(
            title: 'Go To CALCULATOR',
            onPressed: () {
              Navigator.push(
                context,
                PageTransition(
                  child: HomePage(),
                  type: PageTransitionType.fade,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
