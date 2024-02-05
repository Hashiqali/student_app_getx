import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_getx/db&getx/getx_service/getx_service.dart';
import 'package:student_getx/screens/add_student/add_student.dart';
import 'package:student_getx/screens/homescreen.dart';
import 'package:student_getx/screens/list_students/list_student.dart';

Future<void> main() async {
  Get.lazyPut(() => Studentcontoller());
  WidgetsFlutterBinding.ensureInitialized();
  await Get.find<Studentcontoller>().initializingdatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Student app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: const Homescreen(),
      defaultTransition: Transition.rightToLeftWithFade,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/home', page: () => const Homescreen()),
        GetPage(name: '/addstudent', page: () => Studentadd()),
        GetPage(name: '/liststudent', page: () => const Liststudent()),
      ],
    );
  }
}
