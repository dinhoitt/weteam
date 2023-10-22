import 'package:flutter/material.dart';

class MyPageBox1 extends StatelessWidget {
  const MyPageBox1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        width: double.infinity,
        height: 200.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4.0,
              spreadRadius: 2.0,
              offset: Offset(0, 0),
            ),
          ],
        ),
      ),
    );
  }
}
