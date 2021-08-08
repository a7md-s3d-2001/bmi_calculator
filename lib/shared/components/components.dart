import 'package:flutter/material.dart';

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

Widget defaultTextTitleInfo (String title) {
  return Text(
    title,
    style: TextStyle(
      color: Colors.blue,
      fontWeight: FontWeight.bold,
      fontSize: 18.0,
    ),
  );
}

Widget defaultTextDetailsInfo (String title){
  return Text(
    title,
    style: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      color: Colors.grey,
    ),
  );
}

Widget defaultButton ({
  @required Function onPressed,
  @required String title,
}) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
    ),
    child: MaterialButton(
      onPressed: onPressed,
      height: 50.0,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          letterSpacing: 3,
          fontSize: 25.0,
        ),
      ),
    ),
  );
}