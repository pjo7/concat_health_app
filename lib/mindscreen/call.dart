// ignore_for_file: prefer_const_constructors

/*import 'dart:developer';

import 'package:chatgpt_course/providers/chats_provider.dart';
import 'package:chatgpt_course/providers/models_provider.dart';
import 'package:chatgpt_course/widgets/chat_widget.dart';
import 'package:chatgpt_course/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'chat_screen.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:chatgpt_course/services/speechapi.dart';
class Utils {
  static void scanText(String rawText) {
    final text = rawText.toLowerCase();
  }
}
class Call extends StatefulWidget {
  const Call({super.key});

  @override
  State<Call> createState() => _CallState();
}

class _CallState extends State<Call> {
  bool _isTyping = false;

  late TextEditingController textEditingController;
  late ScrollController _listScrollController;
  late FocusNode focusNode;
  @override
  void initState() {
    toggleRecording();
    _listScrollController = ScrollController();
    textEditingController = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _listScrollController.dispose();
    textEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }
  FlutterTts flutterTts = FlutterTts();
  TextEditingController controller = TextEditingController();
  String text = 'Press the button and start speaking';
  bool isListening = false;
  @override
  Widget build(BuildContext context) {
    final double width=MediaQuery.of(context).size.width;
    final double height=MediaQuery.of(context).size.height;
    final modelsProvider = Provider.of<ModelsProvider>(context);
    final chatProvider = Provider.of<ChatProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          color:Colors.white,
          child: Column(
            children: [
              Container(
                width: width,
                height: height*9/10,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 232, 210, 248),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              
              BottomAppBar(
                elevation: 0,
                height: height/10,
                color: Colors.white,
                child: Row(
                  children: [
                    Container(
                      width: width/3,
                      child: GestureDetector(
                        onTap:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen()));
                          isListening=false;
                          _stop();
                        },
                        child: Icon(Icons.phone_disabled_sharp,color: Colors.black,)),
                    ),
                    Container(
                      width: width/3,
                      child: GestureDetector(
                        onTap: _speak,
                        child: Icon(Icons.speaker_phone,color: Colors.black,)),
                    ),
                    Container(
                      width: width/3,
                      child: GestureDetector(
                        onTap: ()async{
                           await sendMessageFCT(
                              modelsProvider: modelsProvider,
                              chatProvider: chatProvider);
                        },
                        child: Icon(Icons.mic,color: Colors.black,)),
                    ),                    
                    ]
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }

  Future toggleRecording() => SpeechApi.toggleRecording(
        onResult: (text) => setState(() => this.text = text),
        onListening: (isListening) {
          setState(() => this.isListening = isListening);

          if (!isListening) {
            Future.delayed(Duration(seconds: 1), () {
              Utils.scanText(text);
              print(text);
              textEditingController.text=text;
              
            });
          }
        },
      );
      void _speak() async {
                         
                              controller.text=ChatWidget.ans;
                              //print(controller.text);
    await flutterTts.speak(controller.text);
                        }

  void _stop() async {
    await flutterTts.stop();
  }

void scrollListToEND() {
    _listScrollController.animateTo(
        _listScrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 2),
        curve: Curves.easeOut);
  }

  Future<void> sendMessageFCT(
      {required ModelsProvider modelsProvider,
      required ChatProvider chatProvider}) async {
    try {
      String msg = textEditingController.text;
      setState(() {
        _isTyping = true;
        // chatList.add(ChatModel(msg: textEditingController.text, chatIndex: 0));
        chatProvider.addUserMessage(msg: msg);
        textEditingController.clear();
        focusNode.unfocus();
      });
      await chatProvider.sendMessageAndGetAnswers(
          msg: msg, chosenModelId: modelsProvider.getCurrentModel);
      // chatList.addAll(await ApiService.sendMessage(
      //   message: textEditingController.text,
      //   modelId: modelsProvider.getCurrentModel,
      // ));
      setState(() {});
    } catch (error) {
      log("error $error");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: TextWidget(
          label: error.toString(),
        ),
        backgroundColor: Colors.red,
      ));
    } finally {
      setState(() {
        scrollListToEND();
        _isTyping = false;
      });
    }
  }

  void function() async{
                          _speak;
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen()));
                          isListening=false;
                          
                        }

}*/