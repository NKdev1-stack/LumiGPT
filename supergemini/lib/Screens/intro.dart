import 'package:flutter/material.dart';
import 'package:LumiAI/Utils/random.dart';

class INTRORM extends StatelessWidget {
  const INTRORM({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Image.network(
          "https://res.cloudinary.com/dghloo9lv/image/upload/v1707580687/LUMI_AI_ko6wek.png",
          height: 90,
          width: 90,
        ),
        SizedBox(
          height: 14,
        ),
        Text(
          "Get Answers of Your Questions",
          style: TextStyle(color: Colors.white),
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 140),
            child: Center(
                child: Divider(
              color: Colors.grey.shade900,
              thickness: 1,
            ))),
        SizedBox(
          height: 15,
        ),
        Text(
          "Step 1",
          style: TextStyle(color: Colors.amber),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Enter Your Query And Click on Send Button",
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Step 2",
          style: TextStyle(color: Colors.amber),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Tap the Prompts To Copy",
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RandomBox(
              label: "General",
              iconData: Icons.generating_tokens_outlined,
            ),
            RandomBox(
              label: "Coding",
              iconData: Icons.wordpress_outlined,
            ),
            RandomBox(
              label: "Work",
              iconData: Icons.work,
            ),
            RandomBox(
              label: "Explore",
              iconData: Icons.explore,
            )
          ],
        ),
        SizedBox(
          height: 13,
        ),
        Text(
          "NK DEV 2024 Copyright",
          style: TextStyle(color: Colors.white),
        ),
      ]),
    );
  }
}
