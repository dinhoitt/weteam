import 'package:flutter/material.dart';
import 'package:weteam/src/widget/image_date.dart';

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
          )),
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
                child: Text(
                  '🔴 위팀',
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
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
              SizedBox(height: 20),
              _buildBox1(),
              SizedBox(
                height: 20,
              ),
              _buildBox1(),
              SizedBox(
                height: 20,
              ),
              _buildBox1(),
              SizedBox(
                height: 20,
              ),
              _buildBox1(),
              SizedBox(
                height: 20,
              ),
              _buildBox1(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBox1() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        width: double.infinity,
        height: 200.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white, // Card의 기본 배경색과 동일하게 설정
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4.0,
              spreadRadius: 2.0,
              offset: Offset(0, 0), // 상하좌우에 그림자 적용
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '진행 중인 팀플 실시간 현황',
                style: TextStyle(
                  fontSize: 10.0,
                  color: Colors.grey[600],
                ),
              ),
              Text(
                '팀플 바로가기',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Center(
                  child: Image.asset(ImagePath.emptygroup),
                ),
              ),
              Center(
                child: Text('앗, 현재진행중인 팀플이 없어 보여요! \n 지금 팀플 추가하러 가기 >',
                    style: TextStyle(), textAlign: TextAlign.center),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBox2() {
    return const Column();
  }
}
