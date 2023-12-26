import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stepn/forms/data/CarData.dart';
import 'package:stepn/forms/data/formsContollers.dart';


class RepairForm extends StatefulWidget {
  const RepairForm({super.key});

  @override
  State<RepairForm> createState() => _RepairFormState();
}

class _RepairFormState extends State<RepairForm> {
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('صلحلي', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,fontFamily: 'Roboto')),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Image(image :AssetImage('assets/salah.png'),width: 200,height: 200,),
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
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      myAlert();
                    },
                    child: const Text('صورة العربية'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //if image not null show the image
                  //if image null show text
                  if(CarData.carPhoto!=null)
                    Padding(
                      padding: const EdgeInsets.only(right: 100),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          //to show image, you type like this.
                          File(CarData.carPhoto!.path),
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width-300,
                          height: MediaQuery.of(context).size.width-300,
                        ),
                      ),
                    )
                ],
              ),
              const SizedBox(height: 20,),
              const ListTile(title: Text("طريقة الدفع :"),
                  subtitle: Text("الدفع هيكون مع المندوب اللي هيجيلك من فريقنا")
              ),
              RadioListTile(toggleable: true,title: const Text("فيزا"),value: false, groupValue: CarData.isCashPayment, onChanged: (value){
                setState(() {
                  CarData.isCashPayment=value!;
                });
              }),
              RadioListTile(toggleable: true,title: const Text("كاش"),value: true, groupValue: CarData.isCashPayment, onChanged: (value){
                setState(() {
                  CarData.isCashPayment=value!;
                });
              }),
              const SizedBox(height: 25),
              ElevatedButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.amber,
                    padding: const EdgeInsets.symmetric(horizontal:170,vertical: 15),
                    disabledBackgroundColor: Colors.grey,
                  ),
                  child: const Text("تمام",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
              ),
            ],
          ),
        ),
      ),
    );
  }
  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      CarData.carPhoto = img;
    });
  }

  //show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: AlertDialog(
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              title: const Text('تحب تفتح الكاميرا ولا تجيب الصورة من معرض الصور ؟'),
              content: SizedBox(
                height: MediaQuery.of(context).size.height / 6,
                child: Column(
                  children: [
                    ElevatedButton(
                      //if user click this button, user can upload image from gallery
                      onPressed: () {
                        Navigator.pop(context);
                        getImage(ImageSource.gallery);
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.image),
                          Text('من معرض الصور'),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      //if user click this button. user can upload image from camera
                      onPressed: () {
                        Navigator.pop(context);
                        getImage(ImageSource.camera);
                      },
                      child: const Row(
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
        });
  }
}

