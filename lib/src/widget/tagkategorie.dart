import 'package:flutter/material.dart';

class TagKategorie extends StatefulWidget {
  final String text;

  TagKategorie({required this.text});

  @override
  _TagKategorieState createState() => _TagKategorieState();
}

class _TagKategorieState extends State<TagKategorie> {
  double fontSize = 12.0;

  @override
  Widget build(BuildContext context) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: widget.text, style: TextStyle(fontSize: fontSize)),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);

    double width = textPainter.size.width + 10;

    return SizedBox(
      width: width,
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            fontSize = 14.0;
          });
        },
        style: OutlinedButton.styleFrom(
          side: BorderSide.none,
          primary: Colors.black,
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5.0),
        ),
        child: Text(
          widget.text,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: fontSize),
        ),
      ),
    );
  }
}
