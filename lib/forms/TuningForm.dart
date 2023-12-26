
import 'package:flutter/material.dart';

bool x=true;



class TuningForm extends StatelessWidget{
  const TuningForm({super.key});

  @override
  Widget build(BuildContext context) {

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body:
        Center(
          child: DropdownButton(
            items: [
              DropdownMenuItem(value: x,child: Text("test")),
              DropdownMenuItem(value: false ,child: Text("test2")),
              DropdownMenuItem(value: false ,child: Text("test2")),
            ], onChanged: (value) {  },
              ),
        )
      ),
    );
  }

}