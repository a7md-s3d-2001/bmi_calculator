import 'package:flutter/material.dart';
import 'dart:math';

Widget selectGender({
  @required Function onTap,
  @required String srcImage,
  @required String title,
  @required Color color,
}) {
  return Expanded(
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(srcImage),
              height: 60.0,
              width: 60.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget defaultSelectValue({
  @required String title,
  @required int value,
  @required Function onTapMinus,
  @required Function onTapPlus,
}) {
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '$value',
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.w900,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: onTapMinus,
                heroTag: '$title-',
                child: Icon(
                  Icons.remove,
                ),
                mini: true,
              ),
              FloatingActionButton(
                onPressed: onTapPlus,
                heroTag: '$title+',
                child: Icon(
                  Icons.add,
                ),
                mini: true,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget defaultTextResult({
  @required String title,
}) {
  return Text(
    title,
    style: TextStyle(
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.5,
    ),
  );
}

Widget bmiResult(context, cubit, result) {
  return Scaffold(
    appBar: AppBar(
      brightness: Brightness.dark,
      elevation: 0.0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.keyboard_arrow_left),
      ),
      title: Text('BMI Result'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
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
                    'Result : ${result.round()}',
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
          SizedBox(
            height: 30.0,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              height: 50,
              child: Text(
                'Try Again',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
