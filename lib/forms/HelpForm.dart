import 'package:flutter/material.dart';

import 'data/formsContollers.dart';
var helpFormKey = GlobalKey<FormState>();
class HelpForm extends StatelessWidget {
  const HelpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title:
          const Text("الحقني",
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,fontFamily: 'Roboto')
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: helpFormKey,
                child: Column(
                  children:[
                    const Image(image :AssetImage('assets/help.png'),width: 150,height: 150,),
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "من فضلك اكتب رقم التليفون";
                          }
                          return null;
                          //  return null;
                        },
                        keyboardType: TextInputType.phone,
                        controller: FormsControllers.phoneController,
                        textInputAction: TextInputAction.next,
                        enableSuggestions: true,
                        decoration:  const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "رقم التليفون",
                          prefixIcon: Icon(Icons.phone),
                        ),
                      ),
                    ),

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
                    if(helpFormKey.currentState!.validate()){

                    }

                  },
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.amber,
                      padding: const EdgeInsets.symmetric(horizontal:170,vertical: 15),
                      disabledBackgroundColor: Colors.grey
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
