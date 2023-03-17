import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../models/design_process.dart';

final List<DesignProcess> designProcesses = [
  DesignProcess(
    title: "DESIGN",
    // iconPath: FlutterIcons.nail_mco,
    iconPath: CupertinoIcons.hammer,
    subtitle:
        "A full stack allround designer thay may or may not include a guide for specific creative",
  ),
  DesignProcess(
    title: "DEVELOP",
    // iconPath: FlutterIcons.desk_lamp_mco,
    iconPath: CupertinoIcons.device_desktop,
    subtitle:
        "A full stack allround developer thay may or may not include a guide for specific creative",
  ),
  DesignProcess(
    title: "WRITE",
    // iconPath: FlutterIcons.API_ant,
    iconPath: CupertinoIcons.pen,
    subtitle:
        "A full stack allround writer thay may or may not include a guide for specific creative",
  ),
  DesignProcess(
    title: "PROMOTE",
    // iconPath: FlutterIcons.CodeSandbox_ant,
    // iconPath: CupertinoIcons.timelapse,
    iconPath: CupertinoIcons.rocket,
    subtitle:
        "A full stack allround promoter thay may or may not include a guide for specific creative",
  ),
];

class CvSection extends StatelessWidget {
  const CvSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ScreenHelper(
        desktop: _buildUi(context, kDesktopMaxWidth),
        tablet: _buildUi(context, kTabletMaxWidth),
        mobile: _buildUi(context, getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(BuildContext context, double width) {
    // we need the context to get maxWidth before the constraints below
    return ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "BETTER DESIGN,\nBETTER EXPERIENCES",
                style: GoogleFonts.oswald(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  height: 1.8,
                  fontSize: 18.0,
                ),
              ),
              GestureDetector(
                onTap: () {
                  AnchorElement anchorElement =
                      AnchorElement(href: 'assets/download/Resume.pdf');
                  anchorElement.download = "resume.pdf";
                  anchorElement.click();
                },
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Text(
                    "DOWNLOAD CV",
                    style: GoogleFonts.oswald(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50.0,
          ),
          LayoutBuilder(builder: (context, constaints) {
            return ResponsiveGridView.builder(
              padding: const EdgeInsets.all(0.0),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              alignment: Alignment.topCenter,
              gridDelegate: ResponsiveGridDelegate(
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 20.0,
                maxCrossAxisExtent: ScreenHelper.isTablet(context) ||
                        ScreenHelper.isMobile(context)
                    ? constaints.maxWidth / 2.0
                    : 250.0,
                // Hack to adjust child height
                childAspectRatio: ScreenHelper.isDesktop(context)
                    ? 1
                    : MediaQuery.of(context).size.aspectRatio * 1.5,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Image.asset(
                        //   designProcesses[index].imagePath,
                        //   width: 40.0,
                        // ),
                        Icon(
                          designProcesses[index].iconPath as IconData,
                          size: 40.0,
                          color: kPrimaryColor,
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          designProcesses[index].title,
                          style: GoogleFonts.oswald(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      designProcesses[index].subtitle,
                      style: const TextStyle(
                        color: kCaptionColor,
                        height: 1.5,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                );
              },
              itemCount: designProcesses.length,
            );
          }),
        ],
      ),
    );
  }
}
