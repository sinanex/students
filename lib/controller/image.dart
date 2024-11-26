import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class imageProvider extends ChangeNotifier{
  File? image;
  void getImage()async{
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);
    image = File(img!.path);
    notifyListeners();
  }
}