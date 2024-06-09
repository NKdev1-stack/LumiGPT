import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatsR extends StatelessWidget {
  String UCHT;
  var ACHT = "Generating Response!";
  ChatsR({super.key, required this.UCHT, required this.ACHT});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  "https://res.cloudinary.com/dghloo9lv/image/upload/v1707579764/man_4140057_pbnqhh.png",
                  height: 50,
                  width: 50,
                ),
                SizedBox(
                  width: 14,
                ),
                SingleChildScrollView(
                  child: InkWell(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: UCHT)).then((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Message Copied!")));
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade700),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "$UCHT",
                          style: TextStyle(color: Colors.grey.shade100),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 8,
              ),
              InkWell(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: ACHT)).then((_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Message Copied!")));
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade700),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "$ACHT",
                      style: TextStyle(color: Colors.grey.shade100),
                    ),
                  )),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Image.network(
                "https://res.cloudinary.com/dghloo9lv/image/upload/v1707580687/LUMI_AI_ko6wek.png",
                height: 53,
                width: 53,
              ),
            ],
          )
        ],
      ),
    );
  }
}
