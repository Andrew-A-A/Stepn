import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stepn/Welcome_screen.dart';
import 'package:stepn/themes/darkTheme.dart';
import 'package:stepn/themes/lightTheme.dart';
import 'MapScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Check if location permission is granted
  Future<bool> isLocationPermissionGranted() async {
    var status = await Permission.location.status;
    return status == PermissionStatus.granted;
  }

  var isLocation = await isLocationPermissionGranted();

  // Run the appropriate app based on location permission status
  runApp(isLocation ? const App() : const PermissionApp());
}

// App that runs when location permission is granted
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme(),
        darkTheme: darkTheme(),
        home: const MapScreen(),
      ),
    );
  }
}

// App that runs when location permission is not granted
class PermissionApp extends StatelessWidget {
  const PermissionApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme(),
        darkTheme: darkTheme(),
        home: const WelcomeScreen(),
      ),
    );
  }
}
