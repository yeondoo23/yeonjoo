import 'package:flutter/material.dart';
import 'package:nemo_2_1124/item_list.dart';
import 'package:nemo_2_1124/menu_bottom.dart';

//CamelCase (낙타형) : 클래스명
//snake_case (뱀형) : 파일명
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NEMO'),
      ),
      body: Center(
        //3페이지로 이동
        child: GestureDetector(
          onTap: (){Navigator.push(context,
              MaterialPageRoute(builder: (context)=>ItemList()));},

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text("Click",
                      style: TextStyle(
                      color: Colors.black,
                      fontSize: 50,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,),
                      ),

              SizedBox(height: 10.0,),
              Text(
                '네일 디자인 검색',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              Text(
                '&샵 예약하러 가기',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              /*ElevatedButton(
                onPressed: () {
                  setState(() {
                    number--;
                  });
                },
                child: Text('ElevatedButton'),
              ),*/
              /*TextButton(
                onPressed: () {},
                child: Text('TextButton'),
              ),*/
              /*OutlinedButton(
                onPressed: () {},
                child: Text('OutlinedButton'),
              )*/
            ],
          ),
        ),
      ),

      bottomNavigationBar: MenuBottom(), //하단 메뉴 바

    );
    //return Container();
    //return const Placeholder();
  }
}
