import 'package:flutter/material.dart';
import 'package:weteam/src/data/image_date.dart';

void showscheduleOverlay(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 200,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(ImagePath.addschedulebutton),
          ],
        ),
      );
    },
  );
}
