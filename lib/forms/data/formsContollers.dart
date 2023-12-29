import 'package:flutter/cupertino.dart';

class FormsControllers{
 // User form controllers
 static TextEditingController nameController=TextEditingController();
 static TextEditingController phoneController=TextEditingController();
 static TextEditingController modelController=TextEditingController();
 static TextEditingController yearController=TextEditingController();
 static TextEditingController manufactureController=TextEditingController();

 //Car care form controllers
 static TextEditingController kilosController=TextEditingController();
 static TextEditingController descriptionController=TextEditingController();

 // Clear forms data
static void clearForm(){
  nameController.clear();
  phoneController.clear();
  modelController.clear();
  yearController.clear();
  manufactureController.clear();
  kilosController.clear();
  descriptionController.clear();
 }
}