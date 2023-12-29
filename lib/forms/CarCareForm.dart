// ignore_for_file: unused_import, use_key_in_widget_constructors, unused_local_variable, prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use, sized_box_for_whitespace, avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stepn/forms/data/CarData.dart';
import 'package:stepn/forms/data/formsContollers.dart';

import '../Done_screen.dart';

// Global key for the care form
var careFormKey = GlobalKey<FormState>();

class CareForm extends StatefulWidget {
  const CareForm({super.key});

  @override
  State<CareForm> createState() => _CareFormState();
}

class _CareFormState extends State<CareForm> {

  final ImagePicker picker = ImagePicker();

  // Function to get an image from either the camera or gallery
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      if (img != null) {
        CarData.carPhoto.add(img);
      }
    });
  }

  // Function to show a dialog for selecting image source
  void selectImageSourceDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('تحب تفتح الكاميرا ولا تجيب الصورة من معرض الصور ؟'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('من معرض الصور'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('افتح الكاميرا'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('صيانة', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, fontFamily: 'Roboto')),
        ),
        body: SingleChildScrollView(
          // Main form column
          child: Column(
            children: [
              const Image(image: AssetImage('assets/siana.png'), width: 200, height: 200,),
              Form(
                key: careFormKey,
                // Car kilometers number
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "من فضلك دخل عداد العربية الحالي";
                      }
                      return null;
                    },
                    controller: FormsControllers.kilosController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "عداد",
                      prefixIcon: Icon(Icons.speed_rounded),
                    ),
                  ),
                ),
              ),
              // Car state description
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 20,
                  controller: FormsControllers.descriptionController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "وصف حالة العربية دلوقتي (اختياري)",
                    prefixIcon: Icon(Icons.notes),
                  ),
                ),
              ),
              // Add image button
              ElevatedButton(
                onPressed: () {
                  if (CarData.carPhoto.length == 6) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Directionality(
                          textDirection: TextDirection.rtl,
                          child: AlertDialog(
                            icon: Icon(Icons.error_outline),
                            title: Text("الحد الأقصي للصور ٦"),
                            content: Text("تقدر تدوس علي اي صورة من اللي موجودين علشان تمسحها"),
                          ),
                        );
                      },
                    );
                  } else {
                    selectImageSourceDialog();
                  }
                },
                child: Text('صورة العربية'),
              ),
              // Space
              SizedBox(
                height: 10,
              ),
              // Loaded images preview
              Row(
                children: [
                  SizedBox(width: 10,),
                  for (int i = 0; i < CarData.carPhoto.length; i++)
                    Padding(
                      padding: EdgeInsets.only(right: 9.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            CarData.carPhoto.remove(CarData.carPhoto[i]);
                          });
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            File(CarData.carPhoto[i].path),
                            fit: BoxFit.cover,
                            width: 55,
                            height: 55,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              // Space
              SizedBox(height: 20,),
              // Title of payment methods
              ListTile(
                title: Text("طريقة الدفع :"),
                subtitle: Text("الدفع هيكون مع المندوب اللي هيجيلك من فريقنا"),
              ),
              // Payment method visa
              RadioListTile(
                toggleable: true,
                title: Text("فيزا"),
                value: false,
                groupValue: CarData.isCashPayment,
                onChanged: (value) {
                  setState(() {
                    CarData.isCashPayment = value!;
                  });
                },
              ),
              // Payment method cash
              RadioListTile(
                toggleable: true,
                title: Text("كاش"),
                value: true,
                groupValue: CarData.isCashPayment,
                onChanged: (value) {
                  setState(() {
                    CarData.isCashPayment = value!;
                  });
                },
              ),
              // Space
              SizedBox(height: 25),
              // Finish button
              ElevatedButton(
                onPressed: () {
                  if (careFormKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const DoneScreen()),
                    );
                  }
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 170, vertical: 15),
                ),
                child: const Text("تمام", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
