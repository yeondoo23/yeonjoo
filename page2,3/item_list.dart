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
          'https://m.eseasang.com/web/product/big/202304/7daa1f49ed23a22b5a183121eb7d1484.jpg',
    ),
    Design(
      designNo: 2,
      designImageUrl:
          'https://dnvefa72aowie.cloudfront.net/business-profile/bizPlatform/profile/757258/1676213755204/YzVlMDFhN2EzZDQ1ZjJkNGViMWQ3MWI0NDlhMjRhZmVmMDIyZjc1MGM4MDc4ZGNjYTliN2UxOTkyY2NmODA5NS5qcGc=.jpeg?q=95&s=1440x1440&t=inside',
    ),
    Design(
      designNo: 3,
      designImageUrl:
          'https://m.girlscoco.com/web/product/big/202201/96df7ba0098334c9863b78b61f579dfe.png',
    ),
    Design(
      designNo: 4,
      designImageUrl:
          'https://static.cdn.soomgo.com/upload/portfolio/5271730a-fd93-4074-8cf8-8abfc593cdfe.jpg?webp=1',
    ),
    Design(
      designNo: 5,
      designImageUrl:
          'https://i.pinimg.com/originals/de/06/27/de06275c9223f1162e724bb1dea91fb7.jpg',
    ),
    Design(
      designNo: 6,
      designImageUrl:
          'https://i.pinimg.com/originals/3a/92/33/3a9233b7160387f8f8cc12da9453f067.jpg',
    ),
    Design(
      designNo: 7,
      designImageUrl:
          'https://img.wkorea.com/w/2020/06/style_5ee0d758d5749.jpg',
    ),
    Design(
      designNo: 8,
      designImageUrl:
          'https://s.thesaracen.com/img/template/goods/217716/c846c75030bad95bd7477c54d79527d6.jpg.jpg',
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
          Image.network(
            designImageUrl,
            height: 150,
            fit: BoxFit.cover,
          )
        ]));
  }
}
