import 'package:app_materials/camera.dart';
import 'package:app_materials/geolocator.dart';
import 'package:app_materials/permission.dart';
import 'package:app_materials/take_picture.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

List<CameraDescription> cameras = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras(); // Initialize cameras
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Méthode pour gérer l'action de la caméra
  void _openCamera() {
    // Logique pour ouvrir la caméra (à implémenter)
    debugPrint("CAMERA button pressed");

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CameraExampleHome()),
    );
  }

  // Méthode pour gérer l'action de la localisation
  void _getLocation() {
    // Logique pour obtenir la localisation (à implémenter)
    debugPrint("LOCATION button pressed");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GeolocatorExamplePage()),
    );
  }

  void _pictureAction() {
    // Logique pour l'action supplémentaire (à implémenter)
    debugPrint("AUTRE button pressed");
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => TakePictureScreen(camera: cameras.last)),
    );
  }

  // Méthode pour l'autre action
  void _otherAction() {
    // Logique pour l'action supplémentaire (à implémenter)
    debugPrint("AUTRE button pressed");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PermissionHandlerScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _openCamera,
              child: const Text('CAMERA'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pictureAction,
              child: const Text('PICTURE'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getLocation,
              child: const Text('LOCATION'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _otherAction,
              child: const Text('PERMISSIONS'),
            ),
          ],
        ),
      ),
    );
  }
}
