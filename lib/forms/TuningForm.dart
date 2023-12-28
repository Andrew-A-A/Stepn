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
            key: tuningFormKey,
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
                      DropdownMenuItem(
                        alignment: AlignmentDirectional.centerStart,
                        child: SizedBox(
                          width: double.maxFinite,
                          child: StatefulBuilder(
                            builder:  (BuildContext context, StateSetter setState) {
                              return CheckboxListTile(

                                  controlAffinity: ListTileControlAffinity.leading,
                                  title: const Text("كيت"),
                                value: CarData.tuningItems.contains("كيت"),
                                onChanged: (value) {
                                  setState(() {
                                    if (CarData.tuningItems.contains("كيت")) {
                                      CarData.tuningItems.remove("كيت");
                                    } else {
                                      CarData.tuningItems.add("كيت");
                                    }
                                  });
                                },
                              );
                            }
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        alignment: AlignmentDirectional.centerStart,
                        child: SizedBox(
                          width: double.maxFinite,
                          child: StatefulBuilder(
                              builder:  (BuildContext context, StateSetter setState) {
                                return CheckboxListTile(

                                  controlAffinity: ListTileControlAffinity.leading,
                                  title: const Text("فونيس"),
                                  value: CarData.tuningItems.contains("فونيس"),
                                  onChanged: (value) {
                                    setState(() {
                                      if (CarData.tuningItems.contains("فونيس")) {
                                        CarData.tuningItems.remove("فونيس");
                                      } else {
                                        CarData.tuningItems.add("فونيس");
                                      }
                                    });
                                  },
                                );
                              }
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        alignment: AlignmentDirectional.centerStart,
                        child: SizedBox(
                          width: double.maxFinite,
                          child: StatefulBuilder(
                              builder:  (BuildContext context, StateSetter setState) {
                                return CheckboxListTile(

                                  controlAffinity: ListTileControlAffinity.leading,
                                  title: const Text("سكن"),
                                  value: CarData.tuningItems.contains("سكن"),
                                  onChanged: (value) {
                                    setState(() {
                                      if (CarData.tuningItems.contains("سكن")) {
                                        CarData.tuningItems.remove("سكن");
                                      } else {
                                        CarData.tuningItems.add("سكن");
                                      }
                                    });
                                  },
                                );
                              }
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        alignment: AlignmentDirectional.centerStart,
                        child: SizedBox(
                          width: double.maxFinite,
                          child: StatefulBuilder(
                              builder:  (BuildContext context, StateSetter setState) {
                                return CheckboxListTile(

                                  controlAffinity: ListTileControlAffinity.leading,
                                  title: const Text("دفيوزر"),
                                  value: CarData.tuningItems.contains("دفيوزر"),
                                  onChanged: (value) {
                                    setState(() {
                                      if (CarData.tuningItems.contains("دفيوزر")) {
                                        CarData.tuningItems.remove("دفيوزر");
                                      } else {
                                        CarData.tuningItems.add("دفيوزر");
                                      }
                                    });
                                  },
                                );
                              }
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        alignment: AlignmentDirectional.centerStart,
                        child: SizedBox(
                          width: double.maxFinite,
                          child: StatefulBuilder(
                              builder:  (BuildContext context, StateSetter setState) {
                                return CheckboxListTile(

                                  controlAffinity: ListTileControlAffinity.leading,
                                  title: const Text("ستيكر"),
                                  value: CarData.tuningItems.contains("ستيكر"),
                                  onChanged: (value) {
                                    setState(() {
                                      if (CarData.tuningItems.contains("ستيكر")) {
                                        CarData.tuningItems.remove("ستيكر");
                                      } else {
                                        CarData.tuningItems.add("ستيكر");
                                      }
                                    });
                                  },
                                );
                              }
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        alignment: AlignmentDirectional.centerStart,
                        child: SizedBox(
                          width: double.maxFinite,
                          child: StatefulBuilder(
                              builder:  (BuildContext context, StateSetter setState) {
                                return CheckboxListTile(

                                  controlAffinity: ListTileControlAffinity.leading,
                                  title: const Text("سبويلر"),
                                  value: CarData.tuningItems.contains("سبويلر"),
                                  onChanged: (value) {
                                    setState(() {
                                      if (CarData.tuningItems.contains("سبويلر")) {
                                        CarData.tuningItems.remove("سبويلر");
                                      } else {
                                        CarData.tuningItems.add("سبويلر");
                                      }
                                    });
                                  },
                                );
                              }
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        alignment: AlignmentDirectional.centerStart,
                        child: SizedBox(
                          width: double.maxFinite,
                          child: StatefulBuilder(
                              builder:  (BuildContext context, StateSetter setState) {
                                return CheckboxListTile(

                                  controlAffinity: ListTileControlAffinity.leading,
                                  title: const Text("اوت ليت"),
                                  value: CarData.tuningItems.contains("اوت ليت"),
                                  onChanged: (value) {
                                    setState(() {
                                      if (CarData.tuningItems.contains("اوت ليت")) {
                                        CarData.tuningItems.remove("اوت ليت");
                                      } else {
                                        CarData.tuningItems.add("اوت ليت");
                                      }
                                    });
                                  },
                                );
                              }
                          ),
                        ),
                      ),




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
                      DropdownMenuItem(
                        alignment: AlignmentDirectional.centerStart,
                        child: SizedBox(
                          width: double.maxFinite,
                          child: StatefulBuilder(
                              builder:  (BuildContext context, StateSetter setState) {
                                return CheckboxListTile(

                                  controlAffinity: ListTileControlAffinity.leading,
                                  title: const Text("اير"),
                                  value: CarData.tuningItems.contains("اير"),
                                  onChanged: (value) {
                                    setState(() {
                                      if (CarData.tuningItems.contains("اير")) {
                                        CarData.tuningItems.remove("اير");
                                      } else {
                                        CarData.tuningItems.add("اير");
                                      }
                                    });
                                  },
                                );
                              }
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        alignment: AlignmentDirectional.centerStart,
                        child: SizedBox(
                          width: double.maxFinite,
                          child: StatefulBuilder(
                              builder:  (BuildContext context, StateSetter setState) {
                                return CheckboxListTile(

                                  controlAffinity: ListTileControlAffinity.leading,
                                  title: const Text("كويلات"),
                                  value: CarData.tuningItems.contains("كويلات"),
                                  onChanged: (value) {
                                    setState(() {
                                      if (CarData.tuningItems.contains("كويلات")) {
                                        CarData.tuningItems.remove("كويلات");
                                      } else {
                                        CarData.tuningItems.add("كويلات");
                                      }
                                    });
                                  },
                                );
                              }
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        alignment: AlignmentDirectional.centerStart,
                        child: SizedBox(
                          width: double.maxFinite,
                          child: StatefulBuilder(
                              builder:  (BuildContext context, StateSetter setState) {
                                return CheckboxListTile(

                                  controlAffinity: ListTileControlAffinity.leading,
                                  title: const Text("تهبيط و تعليا"),
                                  value: CarData.tuningItems.contains("تهبيط و تعليا"),
                                  onChanged: (value) {
                                    setState(() {
                                      if (CarData.tuningItems.contains("تهبيط و تعليا")) {
                                        CarData.tuningItems.remove("تهبيط و تعليا");
                                      } else {
                                        CarData.tuningItems.add("تهبيط و تعليا");
                                      }
                                    });
                                  },
                                );
                              }
                          ),
                        ),
                      ),


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
                        child: SizedBox(
                          width: double.maxFinite,
                          child: StatefulBuilder(
                              builder:  (BuildContext context, StateSetter setState) {
                                return CheckboxListTile(

                                  controlAffinity: ListTileControlAffinity.leading,
                                  title: const Text("ستريت بايب"),
                                  value: CarData.tuningItems.contains("ستريت بايب"),
                                  onChanged: (value) {
                                    setState(() {
                                      if (CarData.tuningItems.contains("ستريت بايب")) {
                                        CarData.tuningItems.remove("ستريت بايب");
                                      } else {
                                        CarData.tuningItems.add("ستريت بايب");
                                      }
                                    });
                                  },
                                );
                              }
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        alignment: AlignmentDirectional.centerStart,
                        child: SizedBox(
                          width: double.maxFinite,
                          child: StatefulBuilder(
                              builder:  (BuildContext context, StateSetter setState) {
                                return CheckboxListTile(

                                  controlAffinity: ListTileControlAffinity.leading,
                                  title: const Text("داون بايب"),
                                  value: CarData.tuningItems.contains("داون بايب"),
                                  onChanged: (value) {
                                    setState(() {
                                      if (CarData.tuningItems.contains("داون بايب")) {
                                        CarData.tuningItems.remove("داون بايب");
                                      } else {
                                        CarData.tuningItems.add("داون بايب");
                                      }
                                    });
                                  },
                                );
                              }
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        alignment: AlignmentDirectional.centerStart,
                        child: SizedBox(
                          width: double.maxFinite,
                          child: StatefulBuilder(
                              builder:  (BuildContext context, StateSetter setState) {
                                return CheckboxListTile(

                                  controlAffinity: ListTileControlAffinity.leading,
                                  title: const Text("ديڤل"),
                                  value: CarData.tuningItems.contains("ديڤل"),
                                  onChanged: (value) {
                                    setState(() {
                                      if (CarData.tuningItems.contains("ديڤل")) {
                                        CarData.tuningItems.remove("ديڤل");
                                      } else {
                                        CarData.tuningItems.add("ديڤل");
                                      }
                                    });
                                  },
                                );
                              }
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        alignment: AlignmentDirectional.centerStart,
                        child: SizedBox(
                          width: double.maxFinite,
                          child: StatefulBuilder(
                              builder:  (BuildContext context, StateSetter setState) {
                                return CheckboxListTile(

                                  controlAffinity: ListTileControlAffinity.leading,
                                  title: const Text("علب بيثة"),
                                  value: CarData.tuningItems.contains("علب بيثة"),
                                  onChanged: (value) {
                                    setState(() {
                                      if (CarData.tuningItems.contains("علب بيثة")) {
                                        CarData.tuningItems.remove("علب بيثة");
                                      } else {
                                        CarData.tuningItems.add("علب بيثة");
                                      }
                                    });
                                  },
                                );
                              }
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        alignment: AlignmentDirectional.centerStart,
                        child: SizedBox(
                          width: double.maxFinite,
                          child: StatefulBuilder(
                              builder:  (BuildContext context, StateSetter setState) {
                                return CheckboxListTile(

                                  controlAffinity: ListTileControlAffinity.leading,
                                  title: const Text("فيل كراكلز"),
                                  value: CarData.tuningItems.contains("فيل كراكلز"),
                                  onChanged: (value) {
                                    setState(() {
                                      if (CarData.tuningItems.contains("فيل كراكلز")) {
                                        CarData.tuningItems.remove("فيل كراكلز");
                                      } else {
                                        CarData.tuningItems.add("فيل كراكلز");
                                      }
                                    });
                                  },
                                );
                              }
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        alignment: AlignmentDirectional.centerStart,
                        child: SizedBox(
                          width: double.maxFinite,
                          child: StatefulBuilder(
                              builder:  (BuildContext context, StateSetter setState) {
                                return CheckboxListTile(

                                  controlAffinity: ListTileControlAffinity.leading,
                                  title: const Text("باك فير"),
                                  value: CarData.tuningItems.contains("باك فير"),
                                  onChanged: (value) {
                                    setState(() {
                                      if (CarData.tuningItems.contains("باك فير")) {
                                        CarData.tuningItems.remove("باك فير");
                                      } else {
                                        CarData.tuningItems.add("باك فير");
                                      }
                                    });
                                  },
                                );
                              }
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        alignment: AlignmentDirectional.centerStart,
                        child: SizedBox(
                          width: double.maxFinite,
                          child: StatefulBuilder(
                              builder:  (BuildContext context, StateSetter setState) {
                                return CheckboxListTile(

                                  controlAffinity: ListTileControlAffinity.leading,
                                  title: const Text("علب فالف ترونيك"),
                                  value: CarData.tuningItems.contains("علب فالف ترونيك"),
                                  onChanged: (value) {
                                    setState(() {
                                      if (CarData.tuningItems.contains("علب فالف ترونيك")) {
                                        CarData.tuningItems.remove("علب فالف ترونيك");
                                      } else {
                                        CarData.tuningItems.add("علب فالف ترونيك");
                                      }
                                    });
                                  },
                                );
                              }
                          ),
                        ),
                      ),


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
                              Text("ابديت اينچين"),
                            ],
                          )),
                      DropdownMenuItem(
                        alignment: AlignmentDirectional.centerStart,
                        child: SizedBox(
                          width: double.maxFinite,
                          child: StatefulBuilder(
                              builder:  (BuildContext context, StateSetter setState) {
                                return CheckboxListTile(

                                  controlAffinity: ListTileControlAffinity.leading,
                                  title: const Text("سيستم كامل"),
                                  value: CarData.tuningItems.contains("سيستم كامل"),
                                  onChanged: (value) {
                                    setState(() {
                                      if (CarData.tuningItems.contains("سيستم كامل")) {
                                        CarData.tuningItems.remove("سيستم كامل");
                                      } else {
                                        CarData.tuningItems.add("سيستم كامل");
                                      }
                                    });
                                  },
                                );
                              }
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        alignment: AlignmentDirectional.centerStart,
                        child: SizedBox(
                          width: double.maxFinite,
                          child: StatefulBuilder(
                              builder:  (BuildContext context, StateSetter setState) {
                                return CheckboxListTile(

                                  controlAffinity: ListTileControlAffinity.leading,
                                  title: const Text("تيربو"),
                                  value: CarData.tuningItems.contains("تيربو"),
                                  onChanged: (value) {
                                    setState(() {
                                      if (CarData.tuningItems.contains("تيربو")) {
                                        CarData.tuningItems.remove("تيربو");
                                      } else {
                                        CarData.tuningItems.add("تيربو");
                                      }
                                    });
                                  },
                                );
                              }
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        alignment: AlignmentDirectional.centerStart,
                        child: SizedBox(
                          width: double.maxFinite,
                          child: StatefulBuilder(
                              builder:  (BuildContext context, StateSetter setState) {
                                return CheckboxListTile(

                                  controlAffinity: ListTileControlAffinity.leading,
                                  title: const Text("ستيدچ"),
                                  value: CarData.tuningItems.contains("ستيدچ"),
                                  onChanged: (value) {
                                    setState(() {
                                      if (CarData.tuningItems.contains("ستيدچ")) {
                                        CarData.tuningItems.remove("ستيدچ");
                                      } else {
                                        CarData.tuningItems.add("ستيدچ");
                                      }
                                    });
                                  },
                                );
                              }
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        alignment: AlignmentDirectional.centerStart,
                        child: SizedBox(
                          width: double.maxFinite,
                          child: StatefulBuilder(
                              builder:  (BuildContext context, StateSetter setState) {
                                return CheckboxListTile(

                                  controlAffinity: ListTileControlAffinity.leading,
                                  title: const Text("هدر"),
                                  value: CarData.tuningItems.contains("هدر"),
                                  onChanged: (value) {
                                    setState(() {
                                      if (CarData.tuningItems.contains("هدر")) {
                                        CarData.tuningItems.remove("هدر");
                                      } else {
                                        CarData.tuningItems.add("هدر");
                                      }
                                    });
                                  },
                                );
                              }
                          ),
                        ),
                      ),
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
                      buildDropdownMenuItem("مط"),
                      buildDropdownMenuItem("ميتالك"),
                      buildDropdownMenuItem("سكن"),
                      buildDropdownMenuItem("كربون فيبر"),


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
                      myAlert();
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
