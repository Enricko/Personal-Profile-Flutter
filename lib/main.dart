import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loop_page_view/loop_page_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CarouselPage(),
    );
  }
}

class CarouselPage extends StatefulWidget {
  @override
  _CarouselPageState createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> with SingleTickerProviderStateMixin {
  CarouselController controller = Get.put(CarouselController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Carousel Example'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: height * .9,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  for (var x = 0; x < controller.imageList.value.length; x++)
                    Obx(
                      () => AnimatedContainer(
                        width: controller._currentPage == x ? width : 0,
                        height: controller._currentPage == x ? height * .9 : 0,
                        duration: Duration(milliseconds: 1000),
                        curve: Curves.fastOutSlowIn,
                        child: Image.network(
                          controller.imageList.value[x],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 350,
                      height: 75,
                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.black54
                      ),
                      child: LoopPageView.builder(
                        itemCount: controller.imageList.value.length,
                        controller: controller._pageController.value,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 100,
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            child: Image.network(
                              controller.imageList.value[index],
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CarouselController extends GetxController {
  Rx<LoopPageController?> _pageController = Rx<LoopPageController?>(null);
  var _currentPage = 0.obs;
  RxList<String> imageList = [
    "https://images.unsplash.com/photo-1701941258075-ae093a5f0185?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1701921188059-daa354b6a91c?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1701762292610-3323efd62273?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTh8fHxlbnwwfHx8fHw%3D"
  ].obs;

  @override
  void onInit() {
    super.onInit();
    _pageController.value = LoopPageController(initialPage: _currentPage.value, viewportFraction: 1 / 3);
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage.value < imageList.length - 1) {
        _currentPage.value++;
      } else {
        _currentPage.value = 0;
      }

      _pageController.value!.animateToPage(
        _currentPage.value,
        duration: Duration(milliseconds: 350),
        curve: Curves.fastOutSlowIn,
      );
    });
  }
}