import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_getx/screens/edit_student/edit_controll.dart';
import 'package:student_getx/db&getx/getx_service/getx_service.dart';
import 'package:student_getx/db&getx/model/db_model.dart';

import 'package:student_getx/screens/snackbar&functions/snackbar&functions.dart';

import '../edit_student/edit_student.dart';

// ignore: must_be_immutable
class GridviewWidget extends StatelessWidget {
  GridviewWidget(
      {super.key, required this.controller, required this.reversedList});
  List<Studentmodel> reversedList;
  Studentcontoller controller;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: reversedList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemBuilder: (ctx, index) {
          final data = reversedList[index];
          return Card(
              color: Colors.amber.shade500,
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: FileImage(File(data.image)),
                          ),
                          PopupMenuButton(onSelected: (value) {
                            if (value == 'edit') {
                              Get.lazyPut(() => Editcontroll(student: data));

                              Get.to(() => Updatepage());
                            }

                            if (value == 'delete') {
                              Get.defaultDialog(
                                  title: 'Alert',
                                  titleStyle: const TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w400),
                                  content: const Text(
                                    'Do you want to delete ?',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  backgroundColor: Colors.amber.shade500,
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: const Text('No',
                                            style: TextStyle(
                                                color: Colors.black))),
                                    TextButton(
                                        onPressed: () async {
                                          await controller
                                              .deletestudent(data.id!);
                                          Get.back();
                                          snackbar(
                                              'Successfully Deleted ${data.name}');
                                        },
                                        child: const Text(
                                          'Yes',
                                          style: TextStyle(color: Colors.black),
                                        )),
                                  ]);
                            }
                          }, itemBuilder: (context) {
                            return [
                              const PopupMenuItem(
                                value: 'edit',
                                textStyle: TextStyle(color: Colors.black),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.edit,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text('Edit'),
                                    )
                                  ],
                                ),
                              ),
                              const PopupMenuItem(
                                value: 'delete',
                                textStyle: TextStyle(color: Colors.black),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.delete,
                                      color: Color.fromARGB(255, 253, 17, 0),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text('Delete'),
                                    )
                                  ],
                                ),
                              )
                            ];
                          })
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Name : ${data.name}',
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Age : ${data.age}',
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Phone : ${data.phone}',
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Place : ${data.place}',
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    ]),
              ));
        });
  }
}
