import 'package:flutter/material.dart';
import 'package:stepn/forms/CarCareForm.dart';
import 'package:stepn/forms/DiagnosisForm.dart';
import 'package:stepn/forms/HelpForm.dart';
import 'package:stepn/forms/LicenseForm.dart';
import 'package:stepn/forms/RepairForm.dart';
import 'package:stepn/forms/TuningForm.dart';
import 'package:stepn/forms/data/UserData.dart';
import 'package:stepn/forms/data/formsContollers.dart';

import 'data/Services.dart';
var signupFormKey = GlobalKey<FormState>();
class UserInfoForm extends StatelessWidget{
  static const userIcon=AssetImage('assets/user.webp');
   const UserInfoForm({super.key});
  @override
  Widget build(BuildContext context) {
   return  Directionality(
     textDirection: TextDirection.rtl,
     child: Scaffold(
       resizeToAvoidBottomInset: true,
       appBar: AppBar(
         title:
         const Text("بيانات المستخدم",
             style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,fontFamily: 'Roboto')
         ),
       ),
       body: SingleChildScrollView(
         child: Column(
           children: [
             Form(
               key: signupFormKey,
               child: Column(
                 children:[
                  const Image(image :userIcon,width: 150,height: 150,),
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
                       textInputAction: TextInputAction.next,
                       enableSuggestions: true,
                       validator: (value) {
                         if (value!.isEmpty) {
                           return "من فضلك اكتب رقم تليفونك";
                         }
                         return null;
                       },
                       decoration:  const InputDecoration(
                           border: OutlineInputBorder(),
                           labelText: "رقم التليفون",
                           prefixIcon: Icon(Icons.phone),
                       ),
                     ),
                   ),


                   //Manufacturer text box
                   Padding(
                     padding:  const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                     child: TextFormField(
                       keyboardType: TextInputType.text,
                       controller: FormsControllers.manufactureController,
                       textInputAction: TextInputAction.next,
                       enableSuggestions: true,
                       validator: (value) {
                         if (value!.isEmpty) {
                           return "من فضلك اكتب نوع عربيتك";
                         }
                         return null;
                         //  return null;
                       },
                       decoration:  const InputDecoration(
                           border: OutlineInputBorder(),
                           labelText: "نوع العربية",
                           prefixIcon: Icon(Icons.factory),
                       ),
                     ),
                   ),


                   //Model text box
                   Padding(
                     padding:  const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                     child: TextFormField(
                       keyboardType: TextInputType.text,
                       controller: FormsControllers.modelController,
                       textInputAction: TextInputAction.next,
                       enableSuggestions: true,
                       validator: (value) {
                         if (value!.isEmpty) {
                           return "من فضلك اكتب موديل عربيتك";
                         }
                         return null;
                       },
                       decoration:  const InputDecoration(
                           border: OutlineInputBorder(),
                           labelText: "الموديل",
                           prefixIcon: Icon(Icons.car_repair),
                       ),
                     ),
                   ),



                   //Year text box
                   Padding(
                     padding:  const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                     child: TextFormField(
                       keyboardType: TextInputType.datetime,
                       controller: FormsControllers.yearController,
                       textInputAction: TextInputAction.next,
                       enableSuggestions: true,
                       decoration:  const InputDecoration(
                           border: OutlineInputBorder(),
                           labelText: "السنة",
                           prefixIcon: Icon(Icons.date_range),
                       ),
                     ),
                   ),
                 ],
               ),
             ),

             //Next button
             ElevatedButton(
                 onPressed: () {
                   if(signupFormKey.currentState!.validate()) {
                     switch (UserData.serviceType){
                     case Services.CARE: {
                       Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) =>  const CareForm())
                       );
                     } break;
                     case Services.DIAGNOSIS: {
                       Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) =>  const DiagnosisForm())
                       );

                     } break;
                     case Services.REPAIR: {
                       Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) =>  const RepairForm())
                       );

                     } break;
                     case Services.HELP: {
                       Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) =>  const HelpForm())
                       );

                     } break;
                     case Services.TUNNING: {
                       Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) =>  const TuningForm())
                       );
                     } break;
                     case Services.LICENSE: {
                       Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) =>  const LicenseForm())
                       );

                     } break;
                   }
                   }


                 },
                 style: TextButton.styleFrom(
                     padding: const EdgeInsets.symmetric(horizontal:170,vertical: 15),
                     disabledBackgroundColor: Colors.grey
                 ),
                 child: const Text("التالي",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
             ),
             const SizedBox(height: 20),
           ],
         ),
       ),
     ),
   );
  }
}
