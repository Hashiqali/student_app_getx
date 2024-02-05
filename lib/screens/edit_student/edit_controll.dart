import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../db&getx/model/db_model.dart';

class Editcontroll extends GetxController {
  Rx<TextEditingController> namecontroller = TextEditingController().obs;

  Rx<TextEditingController> agecontroller = TextEditingController().obs;

  Rx<TextEditingController> phonecontroller = TextEditingController().obs;

  Rx<TextEditingController> placecontroller = TextEditingController().obs;
  RxString image = ''.obs;

  RxInt id = 0.obs;

  Studentmodel? student;

  @override
  void onInit() {
    id.value = student!.id!;
    namecontroller.value.text = student!.name;
    agecontroller.value.text = student!.age;
    phonecontroller.value.text = student!.phone;
    placecontroller.value.text = student!.place;
    image.value = student?.image as String;
    super.onInit();
  }

  Editcontroll({this.student});
}
