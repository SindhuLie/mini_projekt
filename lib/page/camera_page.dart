import 'package:flutter/material.dart';
import 'package:mini_projekt/constant/constant.dart';
import 'package:camera/camera.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' show join;
import 'dart:typed_data';
import 'dart:io';

class CameraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CAMERA", style: kGreenAppBarTextStyle,),
      ),
      body: CameraBody(),
    );
  }
}

class CameraBody extends StatefulWidget {
  @override
  _CameraBodyState createState() => _CameraBodyState();
}

class _CameraBodyState extends State<CameraBody> {
  CameraController cameraController = CameraController(CameraDescription(), ResolutionPreset.high);
  List<CameraDescription> cameras;
  Future<void> _initializeControllerFuture;

  Future init() async{
    cameras = await availableCameras();
    cameraController = CameraController(
      cameras[0],
      ResolutionPreset.veryHigh,
    );
    _initializeControllerFuture = cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  Future getPicture() async{
    try{
      await _initializeControllerFuture;
      final path = join(
        (await getTemporaryDirectory()).path,
        '${DateTime.now()}.png',
      );
      await cameraController.takePicture(path);
    }catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Expanded(
            child: AspectRatio(
              aspectRatio: cameraController.value.aspectRatio,
              child: CameraPreview(cameraController),
            ),
          ),
          Container(
            height: 128,
            child: FlatButton(
                onPressed: (){
                  getPicture();
                },
                child: Icon(Icons.camera,color: Colors.green,),
            ),
          ),
        ],
      ),
    );
  }
}
