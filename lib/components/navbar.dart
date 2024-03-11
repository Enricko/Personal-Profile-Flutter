import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/navbar.dart';

class NavBar extends StatelessWidget {
  var controllerNavbar = Get.put(NavbarController());
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
              borderRadius: BorderRadius.circular(10),
              hoverColor: Colors.black12,
              onTap: () {
                Get.offNamed("/");
                controllerNavbar.scrollOffset.value = 0.0;
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Enricko",
                  style: context.textTheme.displaySmall!.copyWith(
                    fontWeight: FontWeight.w900
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
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
      hoverDuration: Duration(milliseconds: 400),
      onTap: widget.onTap,
      onHover: (value) {
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
            color: _isHover || Get.currentRoute == widget.route ? Colors.blueAccent : Colors.transparent,
          ),
        ),
        child: Text(
          widget.title,
          style: context.textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w600, color: _isHover || Get.currentRoute == widget.route ? Colors.white : Get.textTheme.titleMedium!.color),
        ),
      ),
    );
  }
}
