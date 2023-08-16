import 'package:flutter/material.dart';
import 'package:goagrics/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

Widget MessageScreen(List messages, BuildContext context) {
  var w = getWidth(context);
  return ListView.separated(
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: messages[index]['isUserMessage']
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: const Radius.circular(
                          20,
                        ),
                        topRight: const Radius.circular(20),
                        bottomRight: Radius.circular(
                            messages[index]['isUserMessage'] ? 0 : 20),
                        topLeft: Radius.circular(
                            messages[index]['isUserMessage'] ? 20 : 0),
                      ),
                      color: messages[index]['isUserMessage']
                          ? Colors.green.shade400
                          : Colors.green.shade700.withOpacity(0.8)),
                  constraints: BoxConstraints(maxWidth: w * 2 / 3),
                  child: Text(
                    messages[index]['message'].text.text[0],
                    style: GoogleFonts.urbanist(
                        fontSize: 16, color: themeColorWhite),
                  )),
            ],
          ),
        );
      },
      separatorBuilder: (_, i) => Padding(padding: EdgeInsets.only(top: 10)),
      itemCount: messages.length);
}
