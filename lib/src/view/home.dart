import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weteam/src/page/alert.dart';
import 'package:weteam/src/page/notice.dart';
import 'package:weteam/src/data/image_date.dart';
import 'package:weteam/src/widget/homewidget/buildbox1.dart';
import 'package:weteam/src/widget/homewidget/buildbox2.dart';
import 'package:weteam/src/widget/homewidget/buildbox3.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        body: CustomScrollView(
          slivers: <Widget>[
            _body(),
          ],
        ),
      ),
    );
  }

  Widget _body() {
    return SliverList.builder(
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  ImagePath.title1,
                  width: 58.0,
                  height: 24.0,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 5.0, top: 10.0, bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '안녕하세요 xx 님!', //${}
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: ImageIcon(
                            AssetImage(ImagePath.bellIcon),
                          ),
                          onPressed: () {
                            Get.to(() => Alert());
                          },
                        ),
                        IconButton(
                          icon: ImageIcon(
                            AssetImage(ImagePath.icon2Icon),
                          ),
                          onPressed: () {
                            Get.to(() => Notice());
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const BuildBox1(),
              const SizedBox(
                height: 5.0,
              ),
              const BuildBox2(),
              const SizedBox(
                height: 5.0,
              ),
              const BuildBox3(),
            ],
          ),
        );
      },
    );
  }
}
