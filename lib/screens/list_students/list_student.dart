import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_getx/db&getx/getx_service/getx_service.dart';
import 'package:student_getx/db&getx/model/db_model.dart';
import 'package:student_getx/screens/list_students/grid_view.dart';
import 'package:student_getx/screens/list_students/list.dart';

Studentcontoller gridcontroller = Studentcontoller();

class Liststudent extends StatelessWidget {
  const Liststudent({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Studentcontoller(),
        builder: (controller) {
          final values = controller.students;
          List<Studentmodel> reversedList = values.reversed.toList();
          return Obx(() => gridcontroller.isgrid.value == false
              ? GridviewWidget(
                  controller: controller, reversedList: reversedList)
              : Listviewmodel(
                  controller: controller, reversedList: reversedList));
        });
  }
}
