import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/Messages.dart';
import '../utils/constants.dart';

class GoAgricsBot extends StatefulWidget {
  const GoAgricsBot({super.key});

  @override
  State<GoAgricsBot> createState() => _GoAgricsBotState();
}

class _GoAgricsBotState extends State<GoAgricsBot> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DialogFlowtter.fromFile().then((e) => dialogFlowtter = e);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Image(image: AssetImage('assets/images/goagrics.png')),
          backgroundColor: themeColorWhite,
          elevation: 0.0,
          title: Text(
            'GoAgrics',
            style: GoogleFonts.urbanist(
                fontSize: 18.0,
                color: themeColorDark,
                fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: themeColorWhite,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Expanded(child: MessageScreen(messages, context)),
                Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.green.shade200,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _controller,
                          cursorColor: themeColorLight,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(2.0),
                            hintText: "Enter your query...",
                            border: InputBorder.none,
                          ),
                          style: GoogleFonts.urbanist(
                              color: themeColorDark, fontSize: 16),
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      IconButton(
                          onPressed: () {
                            _controller.clear();
                            sendMessage(_controller.text);
                          },
                          icon: Icon(Icons.send))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      print("Empty Message not allowed");
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });

      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));
      if (response.message == null) return null;
      setState(() {
        addMessage(response.message!);
      });
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }
}
