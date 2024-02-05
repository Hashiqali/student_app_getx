import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Imagecontroller extends GetxController {
  RxBool istrue = false.obs;
  Rx<File>? image1 = File('').obs;
  RxString? image = ''.obs;

  Future<void> fromgallery() async {
    final img1 = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (img1 != null) {
      image1?.value = File(img1.path);
      image?.value = image1!.value.path;
      istrue.value = true;
    }
    // ignore: use_build_context_synchronously
    Get.back();
  }

  Future<void> fromcamera() async {
    final img1 = await ImagePicker().pickImage(source: ImageSource.camera);

    if (img1 != null) {
      image1?.value = File(img1.path);
      image?.value = image1!.value.path;
      istrue.value = true;
    }
    // ignore: use_build_context_synchronously
    Get.back();
  }
}
