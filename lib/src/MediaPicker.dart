import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class MediaPicker extends StatefulWidget {
  MediaPicker({Key? key}) : super(key: key);

  final ImagePicker _picker = ImagePicker();

  @override
  State<MediaPicker> createState() => _MediaPickerState();
}

class _MediaPickerState extends State<MediaPicker> {

  XFile? selectedMedia;

  @override
  Widget build(BuildContext context) {

   Image? imageData;
   if ((selectedMedia == null)) {
     imageData = null;
   } else {
     imageData = Image.file(
     File(selectedMedia!.path,)
     );
   }

    return Container(
      child: Column(
        children: [
          (imageData != null) ? Container(child: imageData, height: 300, width:  300,) : Container(),
          ElevatedButton(onPressed: selectImage, child: Text("Select Image"))
        ],
      ),
    );
  }

  Future<void> selectImage() async {
    selectedMedia = await widget._picker.pickImage(source: ImageSource.gallery);
    setState(() {

    });
  }

}
