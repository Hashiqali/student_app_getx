import 'package:flutter/material.dart';
import 'package:student_getx/db&getx/getx_service/image_picker.dart';
import '../../textfield_widget/textform_field.dart';

// ignore: must_be_immutable
class Studentadd extends StatelessWidget {
  Studentadd({super.key});
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final namecontroller = TextEditingController();

  final agecontroller = TextEditingController();

  final phonecontroller = TextEditingController();

  final placecontroller = TextEditingController();
  Imagecontroller imageController = Imagecontroller();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Padding(
            padding: EdgeInsets.all(21),
            child: Text(
              'Please Enter Details',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
          ),
          backgroundColor: Colors.amber.shade500,
        ),
        body: TextFieldWidget(
          formkey: formkey,
          agecontroller: agecontroller,
          imageController: imageController,
          namecontroller: namecontroller,
          phonecontroller: phonecontroller,
          placecontroller: placecontroller,
          size: size,
          isfromedit: false,
        ));
  }
}
