import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LicenseForm extends StatelessWidget{
  const LicenseForm({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:
        const Text("رخصلي",
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,fontFamily: 'Roboto')
        ),
      ),
    );
  }

}