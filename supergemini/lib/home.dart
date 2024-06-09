import 'dart:io';

import 'package:flutter/material.dart';

import 'package:LumiAI/Screens/menue.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "LumiAI (Beta)",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        actions: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          helpNotice();
                        },
                        icon: Icon(
                          Icons.help_sharp,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: InkWell(
                          onTap: () {
                            setState(() {});

                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Only For Premium User")));
                          },
                          child: Icon(
                            Icons.record_voice_over,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Container(color: Colors.black, child: MENUERM()),
    );
  }

  Future<void> helpNotice() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(child: Text("Info")),
            content: Text("Lumi AI (Beta) - AI powered by Google Gemini 2024"),
          );
        });
  }
}
