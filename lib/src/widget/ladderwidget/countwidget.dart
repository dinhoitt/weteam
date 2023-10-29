import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weteam/src/controller/counter_controller.dart';

class CounterWidget extends StatelessWidget {
  final controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildButton(
          icon: Icons.remove,
          onPressed: controller.decrement,
        ),
        Obx(
          () => Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Text(
              '${controller.count}',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        _buildButton(
          icon: Icons.add,
          onPressed: controller.increment,
        ),
      ],
    );
  }

  Widget _buildButton(
      {required IconData icon, required VoidCallback onPressed}) {
    return IconButton(
      icon: Icon(icon),
      onPressed: onPressed,
    );
  }
}
