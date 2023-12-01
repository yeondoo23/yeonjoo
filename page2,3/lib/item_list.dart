import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'design.dart';
import 'menu_bottom.dart';

class ItemList extends StatefulWidget {
  const ItemList({super.key});

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  //네일아트 디자인 더미 데이터
  List<Design> designList = [
    Design(
      designNo: 1,
      designImageUrl:
          'assets/images/nail1.jpg',
    ),
    Design(
      designNo: 2,
      designImageUrl:
        'assets/images/nail2.jpg',
    ),
    Design(
      designNo: 3,
      designImageUrl:
          'assets/images/nail3.jpg',
    ),
    Design(
      designNo: 4,
      designImageUrl:
          'assets/images/nail4.jpg',
    ),
    Design(
      designNo: 5,
      designImageUrl:
          'assets/images/nail5.jpeg',
    ),
    Design(
      designNo: 6,
      designImageUrl:
          'assets/images/nail6.jpeg',
    ),
    Design(
      designNo: 7,
      designImageUrl:
          'assets/images/nail7.jpg',
    ),
    Design(
      designNo: 8,
      designImageUrl:
          'assets/images/nail8.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //페이지 3
      appBar: AppBar(
        centerTitle: true,
        title: Text('네일 디자인 검색 결과'),
        actions: [
          IconButton(
              onPressed: () {
                /*우측 상단 홈 아이콘 눌렀을 시의 동작*/
                print("Home Icon Pressed");
              },
              icon: Icon(Icons.home)),
        ],
      ),
      body: GridView.builder(
        itemCount: designList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.9,
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return designContainer(
            designImageUrl: designList[index].designImageUrl ?? "",
          );
        },
      ),

      bottomNavigationBar: MenuBottom(), //하단 메뉴 바
    );
  }

  Widget designContainer({required String designImageUrl}) {
    return Container(
        padding: const EdgeInsets.all(5),
        child: Column(children: [
          Image.asset(
            designImageUrl,
            height: 150,
            fit: BoxFit.cover,
          )
        ]));
  }
}
