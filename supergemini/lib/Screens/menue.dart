import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:LumiAI/Screens/chatroom.dart';
import 'package:LumiAI/Screens/intro.dart';
import 'package:startapp_sdk/startapp.dart';

class MENUERM extends StatefulWidget {
  MENUERM({super.key});

  @override
  State<MENUERM> createState() => _MENUERMState();
}

TextEditingController _controller = TextEditingController();
bool isTrue = true;

var startAppSdk = StartAppSdk();

bool showIntro = true;
FocusNode _focus = FocusNode();
var ACHTRESPONSE = "Generating Response!";
var UCHTRESPONSE = "";

class _MENUERMState extends State<MENUERM> {
  StartAppInterstitialAd? interstitialAd;

  @override
  void initState() {
    _focus.addListener(_onFocusChange);
    loadInterstitialAd();
    super.initState();
  }

  void _onFocusChange() {
    setState(() {
      if (showIntro == true) {
        showIntro = false;
      } else {
        showIntro = true;
      }
    });
  }

  Widget build(BuildContext context) {
    return Column(children: [
      isTrue
          ? Expanded(
              child: showIntro
                  ? INTRORM()
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network(
                              "https://res.cloudinary.com/dghloo9lv/image/upload/v1707580687/LUMI_AI_ko6wek.png",
                              height: 90,
                              width: 90,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Get Answers of Your Questions or Make Arts",
                              style: TextStyle(color: Colors.white),
                            ),
                          ]),
                    ))
          : Expanded(
              child: ChatsR(
                UCHT: UCHTRESPONSE,
                ACHT: ACHTRESPONSE,
              ),
            ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  showIntro = false;
                },
                child: TextField(
                    focusNode: _focus,
                    autofocus: false,
                    controller: _controller,
                    cursorColor: Colors.grey,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "How May I Help You?",
                      filled: true,
                      fillColor: Colors.grey.shade900,
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.amber)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.amberAccent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.amberAccent),
                      ),
                    )),
              ),
            ),
            IconButton(
                onPressed: () {
                  if (_controller.text.isEmpty) {
                  } else {
                    if (interstitialAd != null) {
                      interstitialAd!.show().then((shown) {
                        if (shown) {
                          setState(() {
                            // NOTE interstitial ad can be shown only once
                            this.interstitialAd = null;

                            // NOTE load again
                            loadInterstitialAd();
                          });
                        }

                        return null;
                      }).onError((error, stackTrace) {
                        debugPrint("Error showing Interstitial ad: $error");
                      });
                    }
                    setState(() {
                      isTrue = false;
                      gm();

                      UCHTRESPONSE = _controller.text;
                      ACHTRESPONSE = "Generating Response!";
                      _controller.clear();
                    });
                  }
                },
                icon: Icon(
                  Icons.send_rounded,
                  color: Colors.grey.shade800,
                ))
          ],
        ),
      ),
    ]);
  }

  gm() {
    final gemini = Gemini.instance;

    gemini.text(_controller.text).then((value) {
      setState(() {
        ACHTRESPONSE = value!.output.toString();
        print(ACHTRESPONSE);
      });
    })

        /// or value?.content?.parts?.last.text
        .catchError((e) => print(e));
  }

// AD
  void loadInterstitialAd() {
    startAppSdk.loadInterstitialAd().then((interstitialAd) {
      setState(() {
        this.interstitialAd = interstitialAd;
      });
    }).onError<StartAppException>((ex, stackTrace) {
      debugPrint("Error loading Interstitial ad: ${ex.message}");
    }).onError((error, stackTrace) {
      debugPrint("Error loading Interstitial ad: $error");
    });
  }
}
