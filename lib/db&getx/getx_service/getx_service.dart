import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:student_getx/db&getx/model/db_model.dart';

class Studentcontoller extends GetxController {
  RxBool isgrid = false.obs;
  RxList<Studentmodel> students = <Studentmodel>[].obs;
  late Database _db;

  Future<void> initializingdatabase() async {
    _db = await openDatabase('student.db', version: 1,
        onCreate: (Database db, int version) {
      db.execute('''CREATE TABLE student(
          id INTEGER PRIMARY KEY,
          name TEXT,
          age TEXT,
          phone TEXT,
          place TEXT,
          image TEXT
          )''');
    });
  }

  Future<void> addstudent1(Studentmodel value) async {
    await _db.execute(
        'INSERT INTO student(name,age,phone,place,image)VALUES(?,?,?,?,?)',
        [value.name, value.age, value.phone, value.place, value.image]);

    getallstudent();
  }

  Future<void> getallstudent() async {
    final values = await _db.rawQuery('SELECT * FROM student');
    print(values);
    students.clear();
    for (var map in values) {
      final student = Studentmodel.fromMap(map);
      students.add(student);
    }

    update();
  }

  Future<void> deletestudent(int id) async {
    await _db.delete("student", where: "id=?", whereArgs: [id]);
    getallstudent();
  }

  Future<void> updatestudent(int id, String name, String age, String phone,
      String place, String image) async {
    final data = {
      'name': name,
      'age': age,
      'phone': phone,
      'place': place,
      'image': image,
    };
    await _db.update('student', data, where: 'id=?', whereArgs: [id]);
    print('updated');
  }
}
