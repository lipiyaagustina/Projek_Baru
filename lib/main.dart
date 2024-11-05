import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:projek_baru/widget/takepicture_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  // Jalankan aplikasi setelah kamera pertama berhasil diinisialisasi.
  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: TakePictureScreen (camera: firstCamera),
      debugShowCheckedModeBanner: false,
    ),
  );
}