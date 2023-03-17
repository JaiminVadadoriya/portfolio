import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/screen_helper.dart';

import '../../../models/header_item.dart';
import '../../../utils/globals.dart';
import '../home.dart';

List<HeaderItem> headerItems = [
  HeaderItem(
    title: "HOME",
    onTap: (BuildContext context) {
      scrollTo(ScreenHelper.isMobile(context) ? 47.0 : 47.0);
      // _scrollToIndex(0);
    },
  ),
  HeaderItem(
    title: "MY INTRO",
    onTap: (BuildContext context) {
      scrollTo(ScreenHelper.isMobile(context) ? 679.0 : 757.0);
      // scrollTo(SizeConfig.screenHeight);
      // _scrollToIndex(0);
    },
  ),
  HeaderItem(
    title: "SERVICE",
    onTap: (BuildContext context) {
      scrollTo(ScreenHelper.isMobile(context) ? 758.0 : 850.0);
      // _scrollToIndex(1);
    },
  ),
  HeaderItem(
    title: "SKILLS",
    onTap: (BuildContext context) {
      scrollTo(ScreenHelper.isMobile(context) ? 1670.0 : 1543.1);
      // scrollTo(ScreenHelper.isMobile(context) ? 1403.0 : 1543.1);
      // _scrollToIndex(2);
    },
  ),
  HeaderItem(
    title: "HIRE ME",
    onTap: (BuildContext context) {
      scrollTo(ScreenHelper.isMobile(context) ? 1938.0 : 1855);
      // _scrollToIndex(3);
    },
    isButton: true,
  ),
];

void scrollTo(double offset) {
  // double offset = 0;
  // switch (title) {
  //   case Constants.HOME:
  //     offset = offsetHome;
  //     break;
  //   case Constants.ABOUT:
  //     offset = offsetAbout;
  //     break;
  //   case Constants.BLOG:
  //     offset = offsetBlog;
  //     break;
  //   case Constants.PROJECTS:
  //     offset = offsetProjects;
  //     break;
  // }

  // setState(() {
  //   _curNavItem = title;
  // });

  // animate to the pag
  scrollController.animateTo(
    offset,
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOutQuart,
  );
}

// PageController controller = PageController();

// void _scrollToIndex(int index) {
//   controller.animateToPage(index,
//       duration: const Duration(seconds: 2),
//       curve: Curves.fastLinearToSlowEaseIn);
// }

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          AnchorElement anchorElement = AnchorElement(href: '#');
          anchorElement.click();
        },
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "JAI",
                style: GoogleFonts.oswald(
                  color: kDangerColor,
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: "M",
                style: GoogleFonts.oswald(
                  color: Colors.white,
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: "IN",
                style: GoogleFonts.oswald(
                  color: kPrimaryColor,
                  fontSize: 32.0,
                  // fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderRow extends StatelessWidget {
  const HeaderRow({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveVisibility(
      visible: false,
      visibleWhen: const [Condition.largerThan(name: MOBILE)],
      child: Row(
        children: headerItems
            .map(
              (item) => item.isButton
                  ? MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        decoration: BoxDecoration(
                          color: kDangerColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        child: TextButton(
                          onPressed: () => item.onTap(context),
                          child: Text(
                            item.title,
                            style: const TextStyle(
                              color: Colors.white,
                              letterSpacing: 1.75,
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  : MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        margin: const EdgeInsets.only(right: 30.0),
                        child: GestureDetector(
                          onTap: () => item.onTap(context),
                          child: Text(
                            item.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
            )
            .toList(),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: buildHeader(),
      ),
      mobile: buildMobileHeader(),
      tablet: buildHeader(),
      // key: null,
    );
  }

  // mobile header
  Widget buildMobileHeader() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const HeaderLogo(),
            // Restart server to make icons work
            // Lets make a scaffold key and create a drawer
            GestureDetector(
              onTap: () {
                // Lets open drawer using global key
                Globals.scaffoldKey.currentState?.openEndDrawer();
              },
              child: const Icon(
                // FlutterIcons.menu_fea,
                // CupertinoIcons.line_horizontal_3,
                CupertinoIcons.layers_alt_fill,
                color: Colors.white,
                size: 28.0,
              ),
            )
          ],
        ),
      ),
    );
  }

  // Lets plan for mobile and smaller width screens
  Widget buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          HeaderLogo(),
          HeaderRow(),
        ],
      ),
    );
  }
}
