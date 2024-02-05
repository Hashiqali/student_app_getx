import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_getx/db&getx/getx_service/getx_service.dart';
import 'package:student_getx/db&getx/getx_service/image_picker.dart';
import 'package:student_getx/db&getx/model/db_model.dart';

snackbar(String text) {
  Get.snackbar(
    animationDuration: const Duration(microseconds: 300000),
    duration: const Duration(seconds: 1),
    'Notification',
    colorText: Colors.white,
    text,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: const Color.fromARGB(255, 73, 71, 71),
    margin: const EdgeInsets.all(50),
  );
}

pickimages(Imagecontroller imageController) {
  Get.defaultDialog(
      title: 'Alert',
      titleStyle: const TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
      backgroundColor: Colors.amber.shade500,
      content: const Text(
        'Photo options',
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              imageController.fromcamera();
            },
            child: const Text(
              'Camera',
              style: TextStyle(color: Colors.black),
            )),
        ElevatedButton(
          onPressed: () {
            imageController.fromgallery();
          },
          child: const Text(
            'Gallery',
            style: TextStyle(color: Colors.black),
          ),
        )
      ]);
}

Future<void> addstudent(
  namecontroller,
  agecontroller,
  phonecontroller,
  placecontroller,
  imagecontroller,
  formkey,
) async {
  final name = namecontroller.text.trim();
  final age = agecontroller.text.trim();
  final phone = phonecontroller.text.trim();
  final place = placecontroller.text.trim();

  if (formkey.currentState!.validate() &&
      imagecontroller.istrue.value != false) {
    final studentvalues = Studentmodel(
      name: name,
      age: age,
      phone: phone,
      place: place,
      image: imagecontroller.image!.value,
    );
    await Get.find<Studentcontoller>().addstudent1(studentvalues);
    namecontroller.text = '';
    agecontroller.text = '';
    phonecontroller.text = '';
    placecontroller.text = '';
    imagecontroller.istrue.value = false;
    Get.back();
    snackbar('Submitted');
  } else {
    snackbar('Please add your photo');
  }
}

Future<void> update(ctx, id, namecontroller, agecontroller, phonecontroller,
    placecontroller, keybottom, imageController, editcontroller) async {
  final name = namecontroller.text.trim();
  final age = agecontroller.text.trim();
  final phone = phonecontroller.text.trim();
  final place = placecontroller.text.trim();

  if (keybottom.currentState!.validate()) {
    await Get.find<Studentcontoller>().updatestudent(
      id,
      name,
      age,
      phone,
      place,
      imageController.istrue.value
          ? imageController.image!.value
          : editcontroller.image.value,
    );
    Get.back();
    editcontroller.namecontroller.value.text = '';
    editcontroller.agecontroller.value.text = '';
    editcontroller.phonecontroller.value.text = '';
    editcontroller.placecontroller.value.text = '';
    imageController.istrue.value = false;
    snackbar('Updated');
  }
}
