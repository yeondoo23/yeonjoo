import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nemo_2_1124/tab/tab_heart.dart';
import 'package:nemo_2_1124/tab/tab_home.dart';
import 'package:nemo_2_1124/tab/tab_my.dart';
import 'package:nemo_2_1124/tab/tab_nearby.dart';
import 'package:nemo_2_1124/tab/tab_search.dart';
//하단 메뉴 바
class MenuBottom extends StatelessWidget {
  const MenuBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
    type: BottomNavigationBarType.fixed, //아이콘 4개 이상인 경우
    onTap: (int index) {
      switch(index)
          {
        case 0:
          Navigator.push(context, MaterialPageRoute(builder: (context)=>TabHome()));
        case 1:
          Navigator.push(context, MaterialPageRoute(builder: (context)=>TabNearby()));
        case 2:
          Navigator.push(context, MaterialPageRoute(builder: (context)=>TabSearch()));
        case 3:
          Navigator.push(context, MaterialPageRoute(builder: (context)=>TabHeart()));
        case 4:
          Navigator.push(context, MaterialPageRoute(builder: (context)=>TabMy()));
           }

    }, //각 아이콘 눌렀을 때
    items: [
    BottomNavigationBarItem(icon: Icon(Icons.home), label:'홈' ),
    BottomNavigationBarItem(icon: Icon(Icons.place), label: '내주변'),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: '검색'),
    BottomNavigationBarItem(icon: Icon(Icons.favorite_border_outlined), label: '찜'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이'),
    ],
    );
  }
}
