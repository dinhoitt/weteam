import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weteam/src/controller/checkboxcontroller.dart';
import 'package:weteam/src/widget/ladderwidget/countwidget.dart';

class LadderSettingPage extends StatelessWidget {
  final CheckboxController checkboxController = Get.put(CheckboxController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF5F5F5),
          title: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              '사다리타기',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
          centerTitle: true,
        ),
        body: _body(),
        backgroundColor: Color(0xFFF5F5F5),
      ),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '참여 인원 수',
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            Divider(
              thickness: 1.0,
              color: Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CounterWidget(),
              ],
            ),
            Obx(() => CheckboxListTile(
                  title: Text("첫번째 아이템 이름 변경"),
                  value: checkboxController.isChecked1.value,
                  onChanged: (newValue) {
                    checkboxController.toggleCheckBox1();
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                )),
            Obx(() => CheckboxListTile(
                  title: Text("두번째 아이템 이름 변경"),
                  value: checkboxController.isChecked2.value,
                  onChanged: (newValue) {
                    checkboxController.toggleCheckBox2();
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                )),
          ],
        ),
      ),
    );
  }
}
