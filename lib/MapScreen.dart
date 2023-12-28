import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:stepn/forms/DiagnosisForm.dart';
import 'package:stepn/forms/HelpForm.dart';
import 'package:stepn/forms/LicenseForm.dart';
import 'package:stepn/forms/UserInfoForm.dart';
import 'package:stepn/forms/data/UserData.dart';
import 'forms/data/Services.dart';
import 'main.dart';

class MapScreenState extends State<MapScreen> with WidgetsBindingObserver {
  late GoogleMapController mapController;
  late String _darkMapStyle;
  late String _lightMapStyle;
  String selectedService="";
  Future _loadMapStyles() async {
    _darkMapStyle = await rootBundle.loadString('assets/json/dark_mode_style.json');
    _lightMapStyle =await rootBundle.loadString('assets/json/light_mode_style.json');
    await rootBundle.loadString('assets/map_styles/light.json');
  }
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _loadMapStyles();
  }
  @override
  void didChangePlatformBrightness() {
    setState(() {
      _setMapStyle();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
  Future _setMapStyle() async {

    final theme = WidgetsBinding.instance.platformDispatcher.platformBrightness;
    if (theme == Brightness.dark) {
      mapController.setMapStyle(_darkMapStyle);
    } else {
      mapController.setMapStyle(_lightMapStyle);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 200.0),
        child: FloatingActionButton(
          onPressed: _currentLocation,
          child: const Icon(Icons.my_location_rounded),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              myLocationEnabled: true,
             myLocationButtonEnabled: false,
             mapType: MapType.normal,
              compassEnabled: true,
              zoomControlsEnabled: false,
              onMapCreated: (controller) {
                setState(() {
                  mapController = controller;
                  final theme = WidgetsBinding.instance.platformDispatcher.platformBrightness;

                  if (theme == Brightness.dark) {
                    controller.setMapStyle(_darkMapStyle);
                  } else {
                    controller.setMapStyle(_lightMapStyle);
                  }
                });
              },
              initialCameraPosition: const CameraPosition(
                target: LatLng(27.505136, 30.755189),
                //27.505136, 30.755189
                zoom: 7.0,
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                children: [
                  const Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "نقدر نساعدك ازاي النهاردة ؟",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 27),
                    ),

                  ),
                  const SizedBox(height: 20,),
                  SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    scrollDirection: Axis.horizontal,
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        ElevatedButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 12,horizontal: 27)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              )
                            )
                          ),
                          onPressed: () {
                            // Handle button click
                            UserData.serviceType=Services.HELP;
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  const HelpForm())
                            );
                          },
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Image(image: AssetImage("assets/helpIcon.png"),width: 60,height: 60,),
                                  Text('الحقني',style:TextStyle(fontSize: 15,fontFamily: 'Roboto')),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 20,),
                        ElevatedButton(
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 12,horizontal: 27)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  )
                              )
                          ),
                          onPressed: () {
                            // Handle button click
                            UserData.serviceType=Services.CARE;
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  const UserInfoForm())
                            );
                          },
                          child:  const Column(
                            children: [
                              Image(image: AssetImage("assets/siana_icon.png"),width:60 ,height: 60 ,),
                              Text('صيانة'),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20,),
                        ElevatedButton(
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 12,horizontal: 27)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  )
                              )
                          ),
                          onPressed: () {
                            // Handle button click
                            UserData.serviceType=Services.TUNNING;
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  const UserInfoForm())
                            );
                          },
                          child: const Column(
                            children: [
                              Image(image: AssetImage("assets/tunnig_icon.png"),height: 60,width: 60,),
                              Text('تعديل'),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20,),
                        ElevatedButton(
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 12,horizontal: 27)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  )
                              )
                          ),
                          onPressed: () {
                            UserData.serviceType=Services.REPAIR;
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  const UserInfoForm())
                            );
                          },
                          child: const Column(
                            children: [
                              Image(image: AssetImage("assets/repair_icon.png"),height: 60,width: 60,),
                              Text('تصليح'),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20,),
                        ElevatedButton(
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 12,horizontal: 27)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  )
                              )
                          ),
                          onPressed: () {
                            // Handle button click
                            UserData.serviceType=Services.DIAGNOSIS;
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  const DiagnosisForm())
                            );
                          },
                          child: const Column(
                            children: [
                              Image(image: AssetImage('assets/diagnosis_icon.png'),width: 60,height: 60,),
                              Text('كشف'),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20,),
                        ElevatedButton(
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 12,horizontal: 27)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  )
                              )
                          ),
                          onPressed: () {
                            // Handle button click
                            UserData.serviceType=Services.LICENSE;
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  const LicenseForm())
                            );
                          },
                          child: const Column(
                            children: [
                              Image(image: AssetImage("assets/license_icon.png"),width: 60,height: 60,),
                              Text('ترخيص'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ]
            ),
          ),
        ],
      ),
    );
  }
  void _currentLocation() async {
    var location = Location();
    try {
      UserData.currentLocation = await location.getLocation();
    } on Exception {
      UserData.currentLocation = null;
    }
    if(UserData.currentLocation!=null) {

      mapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(UserData.currentLocation!.latitude!, UserData.currentLocation!.longitude!),
        zoom: 17.0,
      ),
    ));
    }
  }
}