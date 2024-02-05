import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_getx/screens/edit_student/edit_controll.dart';
import 'package:student_getx/db&getx/getx_service/image_picker.dart';
import 'package:student_getx/textfield_widget/textform_field.dart';
import '../../db&getx/getx_service/getx_service.dart';

// ignore: must_be_immutable
class Updatepage extends StatelessWidget {
  Updatepage({super.key, this.studentdetails});
  Editcontroll? studentdetails;

  Editcontroll editcontroller = Get.put(Editcontroll());
  Imagecontroller imageController = Imagecontroller();
  Studentcontoller student = Studentcontoller();

  final GlobalKey<FormState> keybottom = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Update Student',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
          ),
          backgroundColor: Colors.amber.shade500,
        ),
        body: TextFieldWidget(
          formkey: keybottom,
          agecontroller: editcontroller.agecontroller.value,
          imageController: imageController,
          namecontroller: editcontroller.namecontroller.value,
          phonecontroller: editcontroller.phonecontroller.value,
          placecontroller: editcontroller.placecontroller.value,
          size: size,
          isfromedit: true,
          editcontroller: editcontroller,
        ));
  }
}
