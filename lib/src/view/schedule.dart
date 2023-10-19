import 'package:flutter/material.dart';
import 'package:weteam/src/data/image_date.dart';

class Schedule extends StatelessWidget {
  const Schedule({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF5F5F5),
          title: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              '내 스케쥴',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          centerTitle: true,
        ),
        body: _body(),
        floatingActionButton: FloatingActionButton(
          child: Image.asset(ImagePath.addschedule),
          onPressed: () {},
        ),
      ),
    );
  }

  Widget _body() {
    return const Scaffold();
  }
}
