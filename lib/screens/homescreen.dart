import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_getx/db&getx/getx_service/getx_service.dart';
import 'package:student_getx/screens/list_students/list_student.dart';
import 'package:student_getx/screens/search_screen.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<Studentcontoller>().getallstudent();
    return Scaffold(
        appBar: AppBar(
          leading: Obx(
            () => IconButton(
                onPressed: () {
                  gridcontroller.isgrid.value = !gridcontroller.isgrid.value;
                },
                icon: Icon(gridcontroller.isgrid.value == true
                    ? Icons.grid_view_rounded
                    : Icons.list_alt_rounded)),
          ),
          automaticallyImplyLeading: false,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 60),
                child: Text(
                  'WELCOME',
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: Search(),
                    );
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  )),
            ),
          ],
          backgroundColor: Colors.amber.shade500,
        ),
        body: SafeArea(
            child: Column(
          children: [
            Flexible(flex: 8, child: Liststudent()),
            Flexible(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  color: Colors.amber.shade500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Get.toNamed('/addstudent');
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 0, 0, 0)),
                          child: const Text(
                            'Add student',
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                ))
          ],
        )));
  }
}
