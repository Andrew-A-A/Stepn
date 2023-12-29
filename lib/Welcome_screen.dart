import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stepn/MapScreen.dart';

// Helper class to handle location permission
class LocationPermissionHandler {
  static Future<bool> requestLocationPermission() async {
    // Check if the location permission is already granted
    var status = await Permission.location.status;
    if (status == PermissionStatus.granted) {
      return true; // Permission already granted
    }

    // If the permission has been denied or restricted, request it
    if (status.isDenied || status.isRestricted) {
      status = await Permission.location.request();
    }

    // Return true if the permission is granted after requesting, otherwise return false
    return status == PermissionStatus.granted;
  }
}

// Welcome screen widget
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('أهلا بيك في تطبيق استبن',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontFamily: 'Roboto')),
        ),
        body: Builder(
          builder: (context) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage("assets/welcome_icon.webp"),
                width: 300,
                height: 300,
              ),
              const Text(
                "أهلا بيك في تطبيق أستبن ، بنقدملك خدمات متكاملة لعربيتك وحل مشاكلها.و علشان نقدر نساعدك محتاجين تسمحلنا نعرف مكانك.",
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10)),
                onPressed: () async {
                  // Request location permission
                  bool isPermissionGranted =
                  await LocationPermissionHandler.requestLocationPermission();

                  if (isPermissionGranted) {
                    // If permission is granted, navigate to the home screen
                    navigateHome();
                  } else {
                    // If permission is denied, show a snack bar
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('تم رفض إذن الموقع'),
                        duration: Duration(seconds: 3),
                      ),
                    );
                  }
                },
                child: const Text(
                  'السماح بالوصول للموقع',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to navigate to the home screen
  void navigateHome() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const MapScreen()));
  }
}
