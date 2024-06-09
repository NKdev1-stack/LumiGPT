import 'package:flutter/material.dart';
class RandomBox extends StatelessWidget {
  String label;
  IconData iconData;
   RandomBox({super.key,
  required this.label,
  required this.iconData
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.of(context).size.height *.06,
      width: MediaQuery.of(context).size.width *.22,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.amber)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData,color: Colors.white,),
          Text("$label",style: TextStyle(color: Colors.white),)
      ],),
    );
  }
}