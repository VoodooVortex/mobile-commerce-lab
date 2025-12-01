class Person {
  String name;
  Person(this.name);

  void introduce() {
    print("สวัสดี ฉันชื่อ$name");
  }
}

class Student extends Person {
  String grade;
  Student(String name, this.grade) : super(name);

  void study() {
    print("ฉันเรียนอยู่ชั้น $grade");
  }
}

void main() {
  print("======================= HomeWork =======================");
  print("======================= Exercise 6 =======================");
  Student student = Student("เมย์", "ม.5");

  student.introduce();
  student.study();
}
