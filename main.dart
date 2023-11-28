import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            // 뒤로가기 버튼이 클릭되었을 때 수행할 작업
          },
        ),
        flexibleSpace: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              '예약하기',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black, // Color: #000
                fontFamily: 'Noto Sans KR',
                fontSize: 20,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                letterSpacing: 0, // This corresponds to font-feature-settings: 'clig' off, 'liga' off;
                height: 1.0, // This corresponds to line-height: 20px;
              ),

            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // '홈' 버튼이 클릭되었을 때 수행할 작업
            },
            icon: Icon(Icons.home_outlined),
            color: Colors.black38,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ReservationButton(
              icon: Icons.restaurant_rounded,
              label: '네이버로 예약하기',
              onPressed: () {
                // 네이버로 예약하기 버튼이 눌렸을 때 수행할 동작
                launch('https://booking.naver.com');
                print('네이버로 예약하기');
              },
              iconTopMargin: 30, // 아이콘을 화면 상단에서 35 픽셀 떨어지게 함
              textBottomMargin: 18, // 텍스트와 아이콘 사이에 18 픽셀 간격을 둠
            ),
          // 버튼 사이에 간격을 두기 위한 SizedBox
            Container(
              width: 343,
              height: 1,
              color: Colors.black,
            ),
            SizedBox(height: 16), // 버튼 사이에 간격을 두기 위한 SizedBox
            ReservationButton(
              icon: Icons.message,
              label: '카카오로 예약하기',
              onPressed: () {
                // 카카오로 예약하기 버튼이 눌렸을 때 수행할 동작
                launch('https://booking.naver.com');
                print('카카오로 예약하기');
              },
            ),
            Container(
              width: 343,
              height: 1,
              color: Colors.black,
            ),

          ],
        ),
      ),
    );
  }
}

class ReservationButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final double iconTopMargin;
  final double textBottomMargin;

  const ReservationButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    this.iconTopMargin = 0,
    this.textBottomMargin = 0,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(top: iconTopMargin, bottom: textBottomMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            SizedBox(width: 8), // 아이콘과 텍스트 사이 간격 조절
            Text(
              label,
              style: TextStyle(
                color: Colors.black, // Color: #000
                fontFamily: 'Noto Sans KR',
                fontSize: 16,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                letterSpacing: -0.08, // This corresponds to letter-spacing: -0.08px;
                height: 1.0, // This corresponds to line-height: 100%;

              ),
            ),
          ],
        ),
      ),
    );
  }
}
