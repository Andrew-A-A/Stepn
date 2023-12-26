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

class MapScreenState extends State<MapScreen> {
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
    _loadMapStyles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 120.0),
        child: FloatingActionButton.extended(
          onPressed: _currentLocation,
          label: const Text('مكاني'),
          icon: const Icon(Icons.location_on),
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
                  SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    scrollDirection: Axis.horizontal,
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        ElevatedButton(
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
                              //   Icon(:),
                              Text('الحقني')
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Handle button click
                            UserData.serviceType=Services.CARE;
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  const UserInfoForm())
                            );
                          },
                          child: const Text('صيانة'),
                        ),  ElevatedButton(
                          onPressed: () {
                            // Handle button click
                            UserData.serviceType=Services.TUNNING;
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  const UserInfoForm())
                            );
                          },
                          child: const Text('تعديل'),
                        ),  ElevatedButton(
                          onPressed: () {
                            UserData.serviceType=Services.REPAIR;
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  const UserInfoForm())
                            );
                          },
                          child: const Text('تصليح'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Handle button click
                            UserData.serviceType=Services.DIAGNOSIS;
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  const DiagnosisForm())
                            );
                          },
                          child: const Text('كشف'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Handle button click
                            UserData.serviceType=Services.LICENSE;
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  const LicenseForm())
                            );
                          },
                          child: const Text('ترخيص'),
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