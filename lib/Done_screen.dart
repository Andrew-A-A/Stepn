import 'package:flutter/material.dart';
import 'package:stepn/MapScreen.dart';

import 'forms/data/formsContollers.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Clear form after sending request to API
    FormsControllers.clearForm();

    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage("assets/done_icon.webp"),height: 300,width: 300,),
            const Text("طلبك وصلنا, هنتواصل معاك في أسرع وقت",style: TextStyle(fontSize: 20),),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const MapScreen()),
                    (Route<dynamic> route) => false,
              );
            }, child: const Text("القائمة الرئيسية"))
          ],
        ),
      ),
    );
  }
}
