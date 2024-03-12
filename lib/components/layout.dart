import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/navbar.dart';
import '../controller/theme.dart';
import 'navbar.dart';

class Layout extends StatelessWidget {
  Layout({required this.child});

  var controllerNavbar = Get.put(NavbarController());
  var controllerTheme = Get.put(ThemeController());

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: NavBar(),
      ),
      endDrawer: (context.width > 960)
          ? Obx(
              () => Drawer(
                backgroundColor: controllerTheme.isDarkMode.value
                    ? Color(0xff1E1E1E)
                    : Color.fromARGB(255, 255, 255, 255),
                child: Column(
                  children: [
                    DrawerHeader(
                      child: InkWell(
                        hoverDuration: const Duration(milliseconds: 400),
                        borderRadius: BorderRadius.circular(10),
                        hoverColor: Colors.black12,
                        onTap: () {
                          Get.offNamed("/");
                          controllerNavbar.scrollOffset.value = 0.0;
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "Enricko",
                            style: context.textTheme.displaySmall!
                                .copyWith(fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          ListTile(
                            onTap: () {
                              Get.offNamed("/");
                              controllerNavbar.scrollOffset.value = 0.0;
                            },
                            hoverColor: Colors.black,
                            leading: Icon(Icons.home),
                            title: Text(
                              "Home",
                              style: context.textTheme.titleMedium,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          : null,
      body: Container(
        child: SingleChildScrollView(
          child: child,
        ),
      ),
    );
  }
}
