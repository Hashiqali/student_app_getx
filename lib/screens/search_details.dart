import 'dart:io';
import 'package:flutter/material.dart';
import 'package:student_getx/db&getx/model/db_model.dart';

class Details extends StatelessWidget {
  final Studentmodel studentdetails;
  const Details({super.key, required this.studentdetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade500,
        title: const Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(right: 60),
            child: Text(
              'Details',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            CircleAvatar(
              radius: 40,
              backgroundImage: FileImage(File(studentdetails.image)),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Name :${studentdetails.name}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Age :${studentdetails.age}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Phone no :${studentdetails.phone}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Place :${studentdetails.place}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
