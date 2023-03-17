import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/models/footer_item.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/constants.dart';
import '../../../utils/screen_helper.dart';

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}

final List<FooterItem> footerItems = [
  FooterItem(
    iconPath: CupertinoIcons.map_pin,
    title: "ADDRESS",
    text1: "Great Eastern Street\nNikol, Ahemdabad 382350",
    // text2: "",
    onTap: () => launchUrl(
      Uri.parse(
        'https://www.google.com/maps/place/Great+Eastern+Rd,+Nikol,+Ahmedabad,+Gujarat+382410/@23.0373953,72.6735868,',
      ),
    ),
  ),
  FooterItem(
    iconPath: CupertinoIcons.phone,
    title: "PHONE",
    text1: "+91 6353-728-521",
    // text2: "",
    onTap: () => launchUrl(
      Uri.parse('tel:+91-6353-728-521'),
    ),
  ),
  FooterItem(
    iconPath: CupertinoIcons.mail,
    title: "EMAIL",
    text1: "vadadoriyajaimin@gmail.com",
    // text2: "",
    onTap: () {
      // final Uri emailLaunchUri = Uri(
      //   scheme: 'mailto',
      //   path: 'vadadoriyajaimin@gmail.com',
      //   // query: encodeQueryParameters(<String, String>{
      //   //   'subject': 'Example Subject & Symbols are allowed!',
      //   // },
      //   // ),
      // );

      // launchUrl(emailLaunchUri);
      launchUrl(Uri.parse('mailto:vadadoriyajaimin@gmail.com'));
    },
  ),
  FooterItem(
    iconPath: CupertinoIcons.bubble_left_bubble_right,
    title: "WHATSAPP",
    text1: "+91 6353-728-521",
    // text2: "",
    onTap: () => launchUrl(
      Uri.parse('https://wa.me/916353728521'),
    ),
  )
];

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: _buildUi(kDesktopMaxWidth, context),
      tablet: _buildUi(kTabletMaxWidth, context),
      mobile: _buildUi(getMobileMaxWidth(context), context),
    );
  }
}

Widget _buildUi(double width, BuildContext context) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: footerItems
                      .map(
                        (footerItem) => SizedBox(
                          height: 120.0,
                          width: ScreenHelper.isMobile(context)
                              ? constraints.maxWidth / 2.0 - 20.0
                              : constraints.maxWidth / 4.0 - 20.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    footerItem.iconPath,
                                    size: 25.0,
                                    color: kPrimaryColor,
                                  ),
                                  // .iconPath,
                                  // width: 25.0,
                                  const SizedBox(
                                    width: 15.0,
                                  ),
                                  Text(
                                    footerItem.title,
                                    style: GoogleFonts.oswald(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              SelectableText(
                                "${footerItem.text1}\n",
                                // onTap: () {
                                //   // Clipboard.setData(ClipboardData(
                                //   //     text: "${footerItem.text1}\n"));
                                // },
                                onTap: footerItem.onTap,
                                showCursor: true,
                                cursorHeight: 1.8,
                                cursorRadius: const Radius.circular(2),
                                cursorColor: kPrimaryColor,
                                style: const TextStyle(
                                  color: kCaptionColor,
                                  height: 1.8,
                                ),
                              ),
                              // MouseRegion(
                              //   cursor: SystemMouseCursors.click,
                              //   child: GestureDetector(
                              //     onTap: footerItem.onTap,
                              //     child: RichText(
                              //       textAlign: TextAlign.start,
                              //       text: TextSpan(
                              //         children: [
                              //           TextSpan(
                              //             text: "${footerItem.text1}\n",
                              //             style: const TextStyle(
                              //               color: kCaptionColor,
                              //               height: 1.8,
                              //             ),
                              //           ),
                              //           // TextSpan(
                              //           //   text: "${footerItem.text2}\n",
                              //           //   style: TextStyle(
                              //           //     color: kCaptionColor,
                              //           //   ),
                              //           // )
                              //         ],
                              //       ),
                              //     ),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Flex(
                direction: ScreenHelper.isMobile(context)
                    ? Axis.vertical
                    : Axis.horizontal,
                mainAxisAlignment: ScreenHelper.isMobile(context)
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Copyright (c) 2023 Vadadoriya Jaimin. All rights Reserved",
                      style: TextStyle(
                        color: kCaptionColor,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: const MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Text(
                            "Privacy Policy",
                            style: TextStyle(
                              color: kCaptionColor,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: const Text(
                          "|",
                          style: TextStyle(
                            color: kCaptionColor,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Text(
                            "Terms & Conditions",
                            style: TextStyle(
                              color: kCaptionColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          );
        },
      ),
    ),
  );
}
