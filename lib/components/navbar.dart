import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_profile/controller/theme.dart';

import '../controller/navbar.dart';
import 'button/switch.dart';

class NavBar extends StatelessWidget {
  var controllerNavbar = Get.find<NavbarController>();
  var controllerTheme = Get.find<ThemeController>();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: controllerNavbar.scrollBool()
          ? Colors.transparent
          : Get.theme.appBarTheme.backgroundColor,
      toolbarHeight: 120,
      title: Center(
        child: Row(
          children: [
            InkWell(
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
                  style: context.textTheme.displaySmall!.copyWith(fontWeight: FontWeight.w900),
                ),
              ),
            ),
            Expanded(
              child: context.width < 960
                  ? SizedBox()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NavbarButton(
                          title: "Home",
                          route: "/",
                          onTap: () {},
                        ),
                        SizedBox(width: context.width / 20),
                        NavbarButton(
                          title: "About Us",
                          route: "/about_us",
                          onTap: () {},
                        ),
                        SizedBox(width: context.width / 20),
                        NavbarButton(
                          title: "Portofolio",
                          route: "/portofolio",
                          onTap: () {},
                        ),
                        SizedBox(width: context.width / 20),
                        NavbarButton(
                          title: "Education",
                          route: "/education",
                          onTap: () {},
                        ),
                        SizedBox(width: context.width / 20),
                        NavbarButton(
                          title: "Contact Us",
                          route: "/contact_us",
                          onTap: () {},
                        ),
                      ],
                    ),
            ),
            Obx(
              () {
                return CustomAdvanceSwitch(
                  controller: controllerTheme.controller.value,
                  activeChild: const Icon(Icons.dark_mode),
                  inactiveChild: const Icon(Icons.light_mode),
                  activeColor: const Color.fromARGB(255, 34, 34, 34),
                  inactiveColor: const Color.fromARGB(255, 116, 173, 185),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NavbarButton extends StatefulWidget {
  const NavbarButton({
    super.key,
    required this.route,
    required this.title,
    required this.onTap,
  });
  final VoidCallback onTap;
  final String route;
  final String title;

  @override
  State<NavbarButton> createState() => _NavbarButtonState();
}

class _NavbarButtonState extends State<NavbarButton> {
  bool _isHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      autofocus: Get.currentRoute == widget.route,
      focusColor: Colors.black,
      hoverColor: Colors.black,
      highlightColor:Colors.black,
      hoverDuration: const Duration(milliseconds: 400),
      onTap: widget.onTap,
      onHover: (value) {
        setState(() {
          _isHover = value;
        });
      },
      onFocusChange: (value) {
        setState(() {
          _isHover = value;
        });
      
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 3,
            color: _isHover || Get.currentRoute == widget.route
                ? Colors.blueAccent
                : Colors.transparent,
          ),
          color: _isHover || Get.currentRoute == widget.route
              ? Colors.black
              : Colors.transparent,
        ),
        child: Text(
          widget.title,
          style: context.textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w600,
              color: _isHover || Get.currentRoute == widget.route
                  ? Colors.white
                  : Get.textTheme.titleMedium!.color),
        ),
      ),
    );
  }
}
