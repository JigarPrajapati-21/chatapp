import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class ImagePickerController extends GetxController {
  final ImagePicker _picker = ImagePicker();

  File? _imageFile;

  final RxnString imageUrl = RxnString();

  // Pick image and upload to Cloudinary
  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      _imageFile = File(image.path);
      final uploadedUrl = await _uploadImageToCloud();
      if (uploadedUrl != null) {
        imageUrl.value = uploadedUrl;
      }
    } else {
      print("No image selected.");
    }
  }

  // Upload image to Cloudinary
  Future<String?> _uploadImageToCloud() async {
    if (_imageFile == null) return null;

    final url = Uri.parse("https://api.cloudinary.com/v1_1/dig6jbzmj/image/upload");

    final request = http.MultipartRequest('POST', url)
      ..fields['upload_preset'] = "test_1_cloudinary"
      ..files.add(await http.MultipartFile.fromPath('file', _imageFile!.path));

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseData = await response.stream.bytesToString();
      final jsonMap = jsonDecode(responseData);
      final uploadedUrl = jsonMap['secure_url'];
      print("Upload successful! Image URL: $uploadedUrl");
      return uploadedUrl;
    } else {
      print("Upload failed. Status code: ${response.statusCode}");
      return null;
    }
  }
}
