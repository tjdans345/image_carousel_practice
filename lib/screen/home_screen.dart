import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Timer? timer;
  PageController pageController = PageController(
    initialPage: 0
  );

  // initState 는 위젯이 생성될 때 제일 처음으로 호출되는 메서드
  // initState 는 “오직 한번만” 호출 된다. 또한 반드시 super.initState()를 호출해야한다.
  @override
  void initState() {
    // 반드시 호출해 줘야한다.
    super.initState();
    timer = Timer.periodic(Duration(seconds: 3), (timer) {
      int currentPage = pageController.page!.toInt();
      int nextPage = currentPage + 1;

      if(nextPage > 4) {
        nextPage = 0;
      }

      pageController.animateToPage(nextPage, duration: Duration(milliseconds: 700), curve: Curves.decelerate);
    });
  }


  // dispose() 는 State 가 사라질 때 실행 된다.
  @override
  void dispose() {
    // 웬만한 컨트롤러는 다 dispose 하여 메모리릭을 방지해주는게 좋다.
    pageController.dispose();
    if(timer != null) {
      timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle 을 이용하여 앱과 관련이 없는 시스템 상태바의 색도 바꿀 수 있다
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      body: PageView(
        controller: pageController,
        // children: [
        //   // fit: BoxFit.cover 이미지를 화면에 꽉 채운다 하지만 이미지가 짤릴 수 있음
        //   Image.asset("asset/img/image_1.jpeg", fit: BoxFit.cover,),
        //   Image.asset("asset/img/image_2.jpeg", fit: BoxFit.cover,),
        //   Image.asset("asset/img/image_3.jpeg", fit: BoxFit.cover,),
        //   Image.asset("asset/img/image_4.jpeg", fit: BoxFit.cover,),
        //   Image.asset("asset/img/image_5.jpeg", fit: BoxFit.cover,),
        // ],


        // 코드 리팩토링
        // map 으로 돌리고 난 후 리스트로 변경해주기
        children: [1,2,3,4,5].map((e) => Image.asset("asset/img/image_$e.jpeg", fit: BoxFit.cover,)).toList(),
      ),
    );
  }
}
