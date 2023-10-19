import 'package:flutter/material.dart';
import 'package:weteam/src/widget/buildbox1.dart';
import 'package:weteam/src/widget/buildbox2.dart';
import 'package:weteam/src/widget/buildbox3.dart';
import 'package:weteam/src/data/image_date.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
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
                    Text(
                      '안녕하세요 xx 님!', //${}
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: ImageIcon(
                            AssetImage(ImagePath.bellIcon),
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: ImageIcon(
                            AssetImage(ImagePath.icon2Icon),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              BuildBox1(),
              SizedBox(
                height: 5.0,
              ),
              BuildBox2(),
              SizedBox(
                height: 5.0,
              ),
              BuildBox3(),
            ],
          ),
        );
      },
    );
  }
}
