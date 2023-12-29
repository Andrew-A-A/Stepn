import 'package:flutter/material.dart';

import '../Done_screen.dart';
import 'data/formsContollers.dart';
var diagnosisFormKey = GlobalKey<FormState>();
class DiagnosisForm extends StatelessWidget {
  const DiagnosisForm({super.key});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      // Set text direction
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // To resized with the keyboard
        resizeToAvoidBottomInset: true,
        // App bar
        appBar: AppBar(
          title:
          const Text("أكشفلي",
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,fontFamily: 'Roboto')
          ),
        ),

        body: SingleChildScrollView(
          // Main form column
          child: Column(
            children: [
              Form(
                key: diagnosisFormKey,
                child: Column(
                  children:[
                    const Image(image :AssetImage('assets/kashf.png'),width: 150,height: 150,),
                    //Name text box
                    Padding(
                      padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        controller: FormsControllers.nameController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "الأسم",
                            prefixIcon: Icon(Icons.account_circle)
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "من فضلك اكتب الاسم";
                          }
                          return null;
                          //  return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    //Phone text box
                    Padding(
                      padding:  const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: FormsControllers.phoneController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "من فضلك اكتب رقم التليفون";
                          }
                          return null;
                          //  return null;
                        },
                        textInputAction: TextInputAction.next,
                        enableSuggestions: true,
                        decoration:  const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "رقم التليفون",
                          prefixIcon: Icon(Icons.phone),
                        ),
                      ),
                    ),


                    //Model text box
                    Padding(
                      padding:  const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: FormsControllers.manufactureController,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "من فضلك اكتب نوع العربية";
                          }
                          return null;
                          //  return null;
                        },
                        enableSuggestions: true,
                        decoration:  const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "نوع العربية",
                          prefixIcon: Icon(Icons.factory),
                        ),
                      ),
                    ),
                    // Car state description text box
                    Padding(
                      padding:  const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 20,
                        controller: FormsControllers.descriptionController,
                        decoration:  const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "وصف حالة العربية ",
                          prefixIcon: Icon(Icons.notes),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //Next button
              ElevatedButton(
                  onPressed: (){
                    // Validate input data
                    if(diagnosisFormKey.currentState!.validate()){
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) =>  const DoneScreen())
                      );
                    }
                  },
                  style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal:170,vertical: 15),
                  ),
                  child: const Text("تمام",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
