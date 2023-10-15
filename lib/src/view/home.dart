import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body());
  }

  Widget _body() {
    return const Center(
      child: Text(
        'weteam',
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}
