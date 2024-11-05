
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class TakePictureScreen extends StatefulWidget{
  const TakePictureScreen ({
    super.key,
    required this.camera
  });

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
  }

  class TakePictureScreenState extends State<TakePictureScreen> {
    late CameraController _controller;
    late Future<void> _intializeControllerFuture;

    @override
    void initState() {
      super.initState();
      _controller = CameraController(
        widget.camera,
        ResolutionPreset.high,
      );
      _intializeControllerFuture = _controller.initialize();
    }
    @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar:  AppBar( title: const Text('lipiya agustina - 362358302049')),
      body: FutureBuilder<void> (
        future: _intializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done){
            return CameraPreview(_controller);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
        ),
        floatingActionButton: 
        FloatingActionButton(
          onPressed: () async{
          try{
            await _intializeControllerFuture;
            final image = await _controller.takePicture();
            //Navigator.pop(context,image.path);
          } catch(e) {
            print(e);
          }
          },
          child: const Icon(Icons.camera_alt),
        ),
    );
  }
  }
