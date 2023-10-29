import 'package:flutter/material.dart';

class LadderPage extends StatelessWidget {
  const LadderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF5F5F5),
          title: Text('사다리타기'),
        ),
      ),
    );
  }
}
