import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stepn/forms/DiagnosisForm.dart';
import 'package:stepn/forms/HelpForm.dart';
import 'package:stepn/forms/LicenseForm.dart';
import 'package:stepn/forms/UserInfoForm.dart';
import 'package:stepn/forms/data/UserData.dart';
import 'forms/data/Services.dart';



class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _loadMapStyles();
  }

  late GoogleMapController mapController;
  late String _darkMapStyle;
  late String _lightMapStyle;
  String selectedService="";

  // Function load map themes
  Future _loadMapStyles() async {
    _darkMapStyle = await rootBundle.loadString('assets/json/dark_mode_style.json');
    _lightMapStyle =await rootBundle.loadString('assets/json/light_mode_style.json');
    await rootBundle.loadString('assets/map_styles/light.json');
  }


 // Change map theme when device theme is changed
  @override
  void didChangePlatformBrightness() {
    setState(() {
      _setMapStyle();
    });
  }

  // Remove the theme observer used by the map
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // Set the style of the map based on device theme
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
      // Floating button to get current location
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 200.0),
        child: FloatingActionButton(
          onPressed: _currentLocation,
          child: const Icon(Icons.my_location_rounded),
        ),
      ),
      // Main column of the app
      body: Column(
        children: [
          // Map view
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
          // Services buttons container
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                children: [
                  // Title text
                  const Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "نقدر نساعدك ازاي النهاردة ؟",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 27),
                    ),

                  ),
                  // Space between title and services list
                  const SizedBox(height: 20,),
                  // Services list
                  SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    scrollDirection: Axis.horizontal,
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Help me Service button
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
                            if(UserData.currentLocation == null){
                              showLocationRequestSnackBar();
                              return;
                            }
                            // Handle button click
                            UserData.serviceType=Services.HELP;
                            Navigator.push(
                                context,
                               PageTransition(child: const HelpForm(),
                                   type: PageTransitionType.bottomToTop,
                                   duration: const Duration(milliseconds: 500))
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Image(image: getIcon("helpIcon.png"),width: 60,height: 60,),
                                  const Text('الحقني',style:TextStyle(fontSize: 15,fontFamily: 'Roboto')),
                                ],
                              )
                            ],
                          ),
                        ),
                        // Space
                        const SizedBox(width: 20,),
                        // Car care service button
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
                            if(UserData.currentLocation == null){
                              showLocationRequestSnackBar();
                              return;
                            }
                            // Handle button click
                            UserData.serviceType=Services.CARE;
                            Navigator.push(
                                context,
                                PageTransition(child:const UserInfoForm(),
                                    type: PageTransitionType.bottomToTop,
                                    duration: const Duration(milliseconds: 500))
                            );
                          },
                          child:   Column(
                            children: [
                              Image(image: getIcon("siana_icon.png"),width:60 ,height: 60 ,),
                              const Text('صيانة'),
                            ],
                          ),
                        ),
                        // Space
                        const SizedBox(width: 20,),
                        // Tuning service button
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
                            if(UserData.currentLocation == null){
                              showLocationRequestSnackBar();
                              return;
                            }
                            // Handle button click
                            UserData.serviceType=Services.TUNNING;
                            Navigator.push(
                              context,
                                PageTransition(child:const UserInfoForm(),
                                    type: PageTransitionType.bottomToTop
                                    , duration: const Duration(milliseconds: 500))
                            );
                          },
                          child:  Column(
                            children: [
                              Image(image: getIcon("tunnig_icon.png"),height: 60,width: 60,),
                              const Text('تعديل'),
                            ],
                          ),
                        ),
                        // Space
                        const SizedBox(width: 20,),
                        // Fixing service button
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
                            if(UserData.currentLocation == null){
                              showLocationRequestSnackBar();
                              return;
                            }
                            UserData.serviceType=Services.REPAIR;
                            Navigator.push(
                                context,
                                PageTransition(child:const UserInfoForm(),
                                    type: PageTransitionType.bottomToTop,
                                    duration: const Duration(milliseconds: 500))
                            );
                          },
                          child:  Column(
                            children: [
                              Image(image: getIcon("repair_icon.png"),height: 60,width: 60,),
                              const Text('تصليح'),
                            ],
                          ),
                        ),
                        // Space
                        const SizedBox(width: 20,),
                        // Diagnosis service button
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
                            if(UserData.currentLocation == null){
                              showLocationRequestSnackBar();
                              return;
                            }
                            // Handle button click
                            UserData.serviceType=Services.DIAGNOSIS;
                            Navigator.push(
                                context,
                                PageTransition(child:const DiagnosisForm(),
                                    type: PageTransitionType.bottomToTop,
                                    duration: const Duration(milliseconds: 500))
                            );
                          },

                          child:  Column(

                            children: [

                              Image(image:getIcon("diagnosis_icon.png") ,width: 60,height: 60,),
                              const Text('كشف'),
                            ],
                          ),
                        ),
                        // Space
                        const SizedBox(width: 20,),
                        // Licensing service button
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
                            if(UserData.currentLocation == null){
                              showLocationRequestSnackBar();
                              return;
                            }
                            // Handle button click
                            UserData.serviceType=Services.LICENSE;
                            Navigator.push(
                                context,
                                PageTransition(child:const LicenseForm(),
                                    type: PageTransitionType.bottomToTop,
                                    duration: const Duration(milliseconds: 500))
                            );
                          },
                          child:  Column(
                            children: [
                              Image(image: getIcon("license_icon.png"),width: 60,height: 60,),
                              const Text('ترخيص'),
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
  // Get current location
  void _currentLocation() async {
    bool isConnected = await checkInternetConnection();
    // First check internet connection
    if (!isConnected) {
      // Show SnackBar if there is no internet connection
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.grey,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('حصل مشكلة في الاتصال ب الانترنت'),
              SizedBox(width: 10,),
              Icon(Icons.signal_wifi_connected_no_internet_4_outlined),
            ],
          ),
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    var location = Location();
    try {
      UserData.currentLocation = await location.getLocation();
    } on Exception {
      UserData.currentLocation = null;
    }
    // Move map view camera position to current location
    if (UserData.currentLocation != null) {
      mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 0,
          target: LatLng(UserData.currentLocation!.latitude!, UserData.currentLocation!.longitude!),
          zoom: 17.0,
        ),
      ));
    }
  }

  // Get icon image for assets folder based on device theme
  AssetImage getIcon(String name){
    AssetImage img;
    final theme = WidgetsBinding.instance.platformDispatcher.platformBrightness;
    if (theme == Brightness.dark) {
      img=AssetImage("assets/light/$name");
    } else {
      img=AssetImage("assets/$name") ;

    }
    return img;
  }

  // Check internet connection
  Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true; // Internet connection is available
    } else {
      return false; // No internet connection
    }
  }

  // Show snack bar asking user to click on 'Get my location' floating button
  void showLocationRequestSnackBar(){
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.grey,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('دوس علي زرار تحديد الموقع عشان نقدر نعرف مكانك'),
              SizedBox(width: 10,),
              Icon(Icons.my_location_sharp),
            ],
          ),
          duration: Duration(seconds: 3),
        )
    );
  }
}