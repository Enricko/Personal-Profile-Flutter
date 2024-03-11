import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'pages/homepage.dart';
import 'routes/route_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Enricko Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      darkTheme: ThemeData.light(),
      themeMode: (GetStorage().read("isDarkMode") != null ? GetStorage().read("isDarkMode") : false)
          ? ThemeMode.dark
          : ThemeMode.light,
      getPages: RouteList.pages,
      initialRoute: "/",
      unknownRoute: GetPage(
        name: "/lost",
        page: () => Center(
          child: Text("Not Found"),
        ),
      ),
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
    );
  }
}
