import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcare/mindwidget/text_widget.dart';

import '../mindconstants/constants.dart';
import '../mindservices/assets_manager.dart';
//import 'text_widget.dart';

class ChatWidget extends StatelessWidget {
   ChatWidget(
      {super.key,
      required this.msg,
      required this.chatIndex,
      this.shouldAnimate = false});

  final String msg;
  static  String ans='';
  final int chatIndex;
  final bool shouldAnimate;
  @override
  Widget build(BuildContext context) {
     ans=msg.trim();
    //print(ans);
    return Column(
      children: [
        Material(
          color: chatIndex == 0 ? scaffoldBackgroundColor : cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  chatIndex == 0
                      ? AssetsManager.botImage
                      : AssetsManager.botImage,
                  height: 30,
                  width: 30,
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: chatIndex == 0
                      ? TextWidget(
                          label: msg,  //sending message
                        )
                      : shouldAnimate
                          ? DefaultTextStyle(
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                 // fontWeight: FontWeight.w700,
                                  fontSize: 16),
                              child: AnimatedTextKit(
                                  isRepeatingAnimation: false,
                                  repeatForever: false,
                                  displayFullTextOnTap: true,
                                  totalRepeatCount: 1,
                                  animatedTexts: [
                                    TyperAnimatedText(
                                      msg.trim(),
                                    ),
                                  ]),
                            )
                          : Text(
                              msg.trim(),
                              style:  GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16),
                            ),
                ),
                
              ],
            ),
          ),
        ),
      ],
    );
  }
}
