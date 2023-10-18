import 'package:flutter/material.dart';
import 'package:weteam/src/widget/image_date.dart';

class TeamPlay extends StatefulWidget {
  const TeamPlay({super.key});

  @override
  _TeamPlayState createState() => _TeamPlayState();
}

class _TeamPlayState extends State<TeamPlay> {
  List<int> counts = List.generate(
      10,
      (index) => index == 5
          ? 0
          : 4); // 각 아이템의 카운트를 저장하는 리스트. index 5는 초기값 0, 나머지는 4로 설정.
  int itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        appBar: AppBar(
          backgroundColor: Color(0xFFF5F5F5),
          title: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              '진행 중인 팀플',
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
          onPressed: () {},
        ),
      ),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 25.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              width: double.infinity,
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
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '진행 중인 팀플',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: itemCount + 1,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20.0,
                          crossAxisSpacing: 30.0,
                          childAspectRatio: 1.6,
                        ),
                        itemBuilder: (context, index) {
                          if (index == itemCount) {
                            return GestureDetector(
                              onTap: () {
                                if (itemCount < counts.length) {
                                  setState(() {
                                    itemCount++;
                                  });
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  image: DecorationImage(
                                    image: AssetImage(ImagePath.addbox),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            );
                          }

                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                image: DecorationImage(
                                  image: AssetImage(ImagePath.boxitem),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
