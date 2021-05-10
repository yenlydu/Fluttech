import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

//File Includ

class ImagePickerManager {
  Future<File> pickImageFromGallery(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imageCache.clear();
      Directory tempDir = await getApplicationDocumentsDirectory();
      String path = tempDir.path;

      final File file = await File(pickedFile.path).copy('$path/picked');

      return file;
    }
    return null;
  }

  Future<File> pickImageFromCamera(BuildContext context) async {
    final picker = ImagePicker();

    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      File file = File(pickedFile.path);
      return file;
    }
    return null;
  }
}
