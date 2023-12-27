import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stepn/forms/data/CarData.dart';
import 'package:stepn/forms/data/formsContollers.dart';

bool x=true;


var tuningFormKey = GlobalKey<FormState>();
class TuningForm extends StatefulWidget{
  const TuningForm({super.key});

  @override
  State<TuningForm> createState() => _TuningFormState();
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
            key: tuningFormKey,
            child: Column(
              children: [
                const Image(image :AssetImage('assets/tuning.png'),width: 200,height: 200,),
                const ListTile(title: Text("تحب تعدل اية ؟", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontFamily: 'Roboto')),
                    subtitle: Text("تقدر تختار اكتر من تعديل")
                ),
                Container(
                  width: double.infinity,
                  padding:  const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                  child: DropdownButton(
                    isExpanded: true,
                    isDense: false,
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
                      DropdownMenuItem(

                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("كيت"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("فرش"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("سكن"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("دفيوزر"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("ستيكر"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("سبويلر"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("اوت ليت"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),


                    ], onChanged: (value) {  },
                  ),
                ),
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    const Text("جنوط"),
                    Checkbox(value: true, onChanged: (value){})
                  ],
                ),
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
                      DropdownMenuItem(

                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("كيت"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("فرش"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("سكن"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("دفيوزر"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("ستيكر"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("سبويلر"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("اوت ليت"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),


                    ], onChanged: (value) {  },
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding:  const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                  child: DropdownButton(
                    isExpanded: true,
                    isDense: false,
                    icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                    value: "ايجزوست",
                    alignment: AlignmentDirectional.centerEnd,
                    items:  [
                      const DropdownMenuItem(
                        alignment: AlignmentDirectional.centerStart,
                          value: "ايجزوست",child: Row(
                        textDirection: TextDirection.rtl,
                            children: [
                              Text("ايجزوست"),
                            ],
                          )),
                      DropdownMenuItem(

                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("كيت"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("فرش"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("سكن"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("دفيوزر"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("ستيكر"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("سبويلر"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("اوت ليت"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),


                    ], onChanged: (value) {  },
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding:  const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                  child: DropdownButton(
                    isExpanded: true,
                    isDense: false,
                    icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                    value: "ابديت",
                    alignment: AlignmentDirectional.centerEnd,
                    items:  [
                      const DropdownMenuItem(
                        alignment: AlignmentDirectional.centerStart,
                          value: "ابديت",child: Row(
                        textDirection: TextDirection.rtl,
                            children: [
                              Text("ابديت"),
                            ],
                          )),
                      DropdownMenuItem(

                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("كيت"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("فرش"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("سكن"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("دفيوزر"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("ستيكر"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("سبويلر"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("اوت ليت"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),


                    ], onChanged: (value) {  },
                  ),
                ),
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    const Text("برمجة"),
                    Checkbox(value: true, onChanged: (value){})
                  ],
                ),
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
                      DropdownMenuItem(

                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("كيت"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("فرش"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("سكن"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("دفيوزر"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("ستيكر"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("سبويلر"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("اوت ليت"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),


                    ], onChanged: (value) {  },
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding:  const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                  child: DropdownButton(
                    isExpanded: true,
                    isDense: false,
                    icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                    value: "بريكات",
                    alignment: AlignmentDirectional.centerEnd,
                    items:  [
                      const DropdownMenuItem(
                        alignment: AlignmentDirectional.centerStart,
                          value: "بريكات",child: Row(
                        textDirection: TextDirection.rtl,
                            children: [
                              Text("بريكات"),
                            ],
                          )),
                      DropdownMenuItem(

                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("كيت"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("فرش"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("سكن"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("دفيوزر"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("ستيكر"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("سبويلر"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("اوت ليت"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),


                    ], onChanged: (value) {  },
                  ),
                ),
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    const Text("تعديل M"),
                    Checkbox(value: true, onChanged: (value){})
                  ],
                ),
                Container(
                  width: double.infinity,
                  padding:  const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                  child: DropdownButton(
                    isExpanded: true,
                    isDense: false,
                    icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                    value: "ساوند سيستم",
                    alignment: AlignmentDirectional.centerEnd,
                    items:  [
                      const DropdownMenuItem(
                        alignment: AlignmentDirectional.centerStart,
                          value: "ساوند سيستم",child: Row(
                        textDirection: TextDirection.rtl,
                            children: [
                              Text("ساوند سيستم"),
                            ],
                          )),
                      DropdownMenuItem(

                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("كيت"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("فرش"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("سكن"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("دفيوزر"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("ستيكر"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("سبويلر"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("اوت ليت"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),


                    ], onChanged: (value) {  },
                  ),
                ),
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
                      DropdownMenuItem(

                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("كيت"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("فرش"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("سكن"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("دفيوزر"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("ستيكر"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("سبويلر"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("اوت ليت"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),


                    ], onChanged: (value) {  },
                  ),
                ),
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
                      DropdownMenuItem(

                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("كيت"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("فرش"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("سكن"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("دفيوزر"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("ستيكر"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("سبويلر"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            textDirection: TextDirection.rtl,
                        children: [
                          const Text("اوت ليت"),
                          Checkbox(value: true, onChanged: (value){})
                        ],
                      )),


                    ], onChanged: (value) {  },
                  ),
                ),
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    const Text("تعديل AMG"),
                    Checkbox(value: true, onChanged: (value){})
                  ],
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
                      tuningFormKey.currentState!.validate();
                    },
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
