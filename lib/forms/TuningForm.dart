import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stepn/forms/data/CarData.dart';
import 'package:stepn/forms/data/formsContollers.dart';

import '../Done_screen.dart';

bool x=true;



class TuningForm extends StatefulWidget{
  const TuningForm({super.key});

  @override
  State<TuningForm> createState() => _TuningFormState();
  State<TuningForm> itemSelectedState() => _TuningFormState();
}

class _TuningFormState extends State<TuningForm> {
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('عدلٍي', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,fontFamily: 'Roboto')),
        ),
        body: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                const Image(image :AssetImage('assets/tuning.png'),width: 200,height: 200,),
                const ListTile(title: Text("تحب تعدل اية ؟", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontFamily: 'Roboto')),
                    subtitle: Text("تقدر تختار اكتر من تعديل")
                ),
                SizedBox(
                  width: double.maxFinite,
                  child:
                    CheckboxListTile(title: const Text("تعديل AMG"),
                        value: CarData.tuningItems.contains("تعديل AMG"), onChanged: (value){
                      setState(() {
                          if(CarData.tuningItems.contains("تعديل AMG")){
                            CarData.tuningItems.remove("تعديل AMG");
                          }
                          else{
                            CarData.tuningItems.add("تعديل AMG");
                          }
                        });

                 })

                ),
                SizedBox(
                  width: double.maxFinite,
                  child:
                    CheckboxListTile(title: const Text("جنوط"),value: CarData.tuningItems.contains("جنوط"), onChanged: (value){
                        setState(() {
                          if(CarData.tuningItems.contains("جنوط")){
                            CarData.tuningItems.remove("جنوط");
                          }
                          else{
                            CarData.tuningItems.add("جنوط");
                          }
                        });

                 })

                ),
                SizedBox(
                    width: double.maxFinite,
                    child:
                    CheckboxListTile(title: const Text("تعديل M"),
                        value: CarData.tuningItems.contains("تعديل M"), onChanged: (value){
                      setState(() {
                        if(CarData.tuningItems.contains("تعديل M")){
                          CarData.tuningItems.remove("تعديل M");
                        }
                        else{
                          CarData.tuningItems.add("تعديل M");
                        }
                      });

                    })

                ),
                SizedBox(
                    width: double.maxFinite,
                    child:
                    CheckboxListTile(title: const Text("برمجة"),
                        value: CarData.tuningItems.contains("برمجة"), onChanged: (value){
                      setState(() {
                        if(CarData.tuningItems.contains("برمجة")){
                          CarData.tuningItems.remove("برمجة");
                        }
                        else{
                          CarData.tuningItems.add("برمجة");
                        }
                      });

                    })

                ),
                SizedBox(
                    width: double.maxFinite,
                    child:
                    CheckboxListTile(title: const Text("كراسي"),
                        value: CarData.tuningItems.contains("كراسي"), onChanged: (value){
                          setState(() {
                            if(CarData.tuningItems.contains("كراسي")){
                              CarData.tuningItems.remove("كراسي");
                            }
                            else{
                              CarData.tuningItems.add("كراسي");
                            }
                          });

                        })

                ),
                // Body List
                Container(
                  width: double.infinity,
                  padding:  const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                  child: DropdownButton(
                    isExpanded: true,
                    isDense: false,
                    onChanged:(value){

                    },
                    icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                    value: "البودي (Body)",
                    alignment: AlignmentDirectional.centerEnd,
                    items:  [
                      const DropdownMenuItem(
                        alignment: AlignmentDirectional.centerStart,
                          value: "البودي (Body)",child: Row(
                        textDirection: TextDirection.rtl,
                            children: [
                              Text("البودي (Body)"),
                            ],
                          )),
                    
                      buildDropdownMenuItem("(kit)""كيت"),
                      buildDropdownMenuItem("فونيس"),
                      buildDropdownMenuItem("(Skin)""سكن"),
                      buildDropdownMenuItem("دفيوزر"),
                      buildDropdownMenuItem("(Sticker)""ستيكر"),
                      buildDropdownMenuItem("(Spoiler) سبويلر"),
                      buildDropdownMenuItem("(Outlet)""اوت ليت")
                    ],
                  ),
                ),
                // Asha List
                Container(
                  width: double.infinity,
                  padding:  const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                  child: DropdownButton(
                    isExpanded: true,
                    isDense: false,
                    icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                    value: "عفشة",
                    alignment: AlignmentDirectional.centerEnd,
                    items:  [
                      const DropdownMenuItem(
                        alignment: AlignmentDirectional.centerStart,
                          value: "عفشة",child: Row(
                        textDirection: TextDirection.rtl,
                            children: [
                              Text("عفشة"),
                            ],
                          )),
                      buildDropdownMenuItem( "(Air)""اير"),
                      buildDropdownMenuItem("كويلات"),
                      buildDropdownMenuItem("تهبيط و تعليا")
                    ], onChanged: (value) {  },
                  ),
                ),
                // Exhaust list
                Container(
                  width: double.infinity,
                  padding:  const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                  child: DropdownButton(
                    isExpanded: true,
                    isDense: false,
                    icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                    value: "ايجزوست (Exhaust)",
                    alignment: AlignmentDirectional.centerEnd,
                    items:  [
                      const DropdownMenuItem(
                        alignment: AlignmentDirectional.centerStart,
                          value: "ايجزوست (Exhaust)",child: Row(
                        textDirection: TextDirection.rtl,
                            children: [
                              Text("ايجزوست (Exhaust)"),
                            ],
                          )),
                      buildDropdownMenuItem("(Straight pipe)" "ستريت بايب"),
                      buildDropdownMenuItem("(Downpipe) داون بايب"),
                      buildDropdownMenuItem("ديڤل"),
                      buildDropdownMenuItem("علب بيئة"),
                      buildDropdownMenuItem("فيل كراكلز"),
                      buildDropdownMenuItem("(Backfire) باك فاير"),
                      buildDropdownMenuItem("(Valvtronic) علب فالف ترونيك")
                    ], onChanged: (value) {  },
                  ),
                ),

                // Update engine list
                Container(
                  width: double.infinity,
                  padding:  const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                  child: DropdownButton(
                    isExpanded: true,
                    isDense: false,
                    icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                    value: "ابديت اينچين",
                    alignment: AlignmentDirectional.centerEnd,
                    items:  [
                      const DropdownMenuItem(
                        alignment: AlignmentDirectional.centerStart,
                          value: "ابديت اينچين",child: Row(
                        textDirection: TextDirection.rtl,
                            children: [
                              Text("ابديت اينچين (Update Engine)"),
                            ],
                          )),
                      buildDropdownMenuItem("سيستم كامل"),
                      buildDropdownMenuItem("تيربو"),
                      buildDropdownMenuItem("هدر"),
                      buildDropdownMenuItem("كولر"),
                      buildDropdownMenuItem("فلتر")
                    ], onChanged: (value) {  },
                  ),
                ),
                // Accessors
                Container(
                  width: double.infinity,
                  padding:  const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                  child: DropdownButton(
                    isExpanded: true,
                    isDense: false,
                    icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                    value: "اكسسوارات",
                    alignment: AlignmentDirectional.centerEnd,
                    items:  [
                      const DropdownMenuItem(
                        alignment: AlignmentDirectional.centerStart,
                          value: "اكسسوارات",child: Row(
                        textDirection: TextDirection.rtl,
                            children: [
                              Text("اكسسوارات"),
                            ],
                          )),
                      buildDropdownMenuItem("فرش"),
                      buildDropdownMenuItem("فامية"),
                      buildDropdownMenuItem("لدجات مطاط"),
                      buildDropdownMenuItem("اتيريرليت"),
                      buildDropdownMenuItem("شاشة (عادية)"),
                      buildDropdownMenuItem("شاشة (ابل كادليس)"),
                      buildDropdownMenuItem("دوسات"),
                      buildDropdownMenuItem("كڤر طاره"),
                      buildDropdownMenuItem("شمسيات"),
                      buildDropdownMenuItem("مفاتيح"),


                    ], onChanged: (value) {  },
                  ),
                ),
                // Brakes
                Container(
                  width: double.infinity,
                  padding:  const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                  child: DropdownButton(
                    isExpanded: true,
                    isDense: false,
                    icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                    value: "بريكات (Brakes)",
                    alignment: AlignmentDirectional.centerEnd,
                    items:  [
                      const DropdownMenuItem(
                        alignment: AlignmentDirectional.centerStart,
                          value: "بريكات (Brakes)",child: Row(
                        textDirection: TextDirection.rtl,
                            children: [
                              Text("بريكات (Brakes)"),
                            ],
                          )),
                      buildDropdownMenuItem("كليبرات"),
                      buildDropdownMenuItem("ديسكات")

                    ], onChanged: (value) {  },
                  ),
                ),
                // Sound system
                Container(
                  width: double.infinity,
                  padding:  const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                  child: DropdownButton(
                    isExpanded: true,
                    isDense: false,
                    icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                    value: "ساوند سيستم (Sound System)",
                    alignment: AlignmentDirectional.centerEnd,
                    items:  [
                      const DropdownMenuItem(
                        alignment: AlignmentDirectional.centerStart,
                          value: "ساوند سيستم (Sound System)",child: Row(
                        textDirection: TextDirection.rtl,
                            children: [
                              Text("ساوند سيستم (Sound System)"),
                            ],
                          )),
                      buildDropdownMenuItem("سماعات"),
                      buildDropdownMenuItem("بزوكة"),
                      buildDropdownMenuItem("صب هوفر"),

                    ], onChanged: (value) {  },
                  ),
                ),
                // Tyre
                Container(
                  width: double.infinity,
                  padding:  const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                  child: DropdownButton(
                    isExpanded: true,
                    isDense: false,
                    icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                    value: "تعديل طارة",
                    alignment: AlignmentDirectional.centerEnd,
                    items:  [
                      const DropdownMenuItem(
                        alignment: AlignmentDirectional.centerStart,
                          value: "تعديل طارة",child: Row(
                        textDirection: TextDirection.rtl,
                            children: [
                              Text("تعديل طارة"),
                            ],
                          )),
                      buildDropdownMenuItem("شارب D"),
                      buildDropdownMenuItem("مالتي فانكشن")


                    ], onChanged: (value) {  },
                  ),
                ),
                // Color
                Container(
                  width: double.infinity,
                  padding:  const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                  child: DropdownButton(
                    isExpanded: true,
                    isDense: false,
                    icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                    value: "تغيير لون",
                    alignment: AlignmentDirectional.centerEnd,
                    items:  [
                      const DropdownMenuItem(
                        alignment: AlignmentDirectional.centerStart,
                          value: "تغيير لون",child: Row(
                        textDirection: TextDirection.rtl,
                            children: [
                              Text("تغيير لون"),
                            ],
                          )),
                      buildDropdownMenuItem("(Matte) مط"),
                      buildDropdownMenuItem("(Metallic) ميتالك"),
                      buildDropdownMenuItem("(Skin) سكن"),
                      buildDropdownMenuItem("(Carbon fiber) كربون فيبر"),


                    ], onChanged: (value) {  },
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
                ElevatedButton(
                  onPressed: () {
                    if(CarData.carPhoto.length==6){
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const Directionality(
                                textDirection: TextDirection.rtl,
                                child:AlertDialog(icon: Icon(Icons.error_outline),title: Text("الحد الأقصي للصور ٦"),
                                  content: Text("تقدر تدوس علي اي صورة من اللي موجودين علشان تمسحها"),)
                            );});
                    }
                    else {
                      selectImageSourceDialog();
                    }
                  },
                  child: const Text('صورة العربية'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                    children: [const SizedBox(width: 10,),for(int i=0; i<CarData.carPhoto.length;i++)
                      Padding(
                        padding:  const EdgeInsets.only(right: 9.0),
                        child: GestureDetector(
                          onTap:() {
                            setState(() {
                              CarData.carPhoto.remove(CarData.carPhoto[i]);
                            });
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              //to show image, you type like this.
                              File(CarData.carPhoto[i].path),
                              fit: BoxFit.cover,
                              width: 55,
                              height: 55,
                            ),
                          ),
                        ),
                      ),
                    ]
                ),
                const SizedBox(height: 20,),
                const ListTile(title: Text("طريقة الدفع :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontFamily: 'Roboto')),
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
                    onPressed: () {
                      if(CarData.tuningItems.isEmpty){
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('من فضلك أختار الحاجات اللي حابب تعدلها'),
                              duration: Duration(seconds: 3),
                            ),
                        );
                        return;
                      }
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) =>  const DoneScreen())
                        );

                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal:170,vertical: 15),
                    ),
                    child: const Text("تمام",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<dynamic> buildDropdownMenuItem(String itemName) {
    return DropdownMenuItem(
                      alignment: AlignmentDirectional.centerStart,
                      child: SizedBox(
                        width: double.maxFinite,
                        child: StatefulBuilder(
                            builder:  (BuildContext context, StateSetter setState) {
                              return CheckboxListTile(

                                controlAffinity: ListTileControlAffinity.leading,
                                title:  Text(itemName),
                                value: CarData.tuningItems.contains(itemName),
                                onChanged: (value) {
                                  setState(() {
                                    if (CarData.tuningItems.contains(itemName)) {
                                      CarData.tuningItems.remove(itemName);
                                    } else {
                                      CarData.tuningItems.add(itemName);
                                    }
                                  });
                                },
                              );
                            }
                        ),
                      ),
                    );
  }
  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      if (img!=null) {
        CarData.carPhoto.add(img);
      }
    });
  }

  //show popup dialog
  void selectImageSourceDialog() {
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
