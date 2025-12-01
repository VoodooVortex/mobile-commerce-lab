import 'exercise_1.dart';
import 'exercise_2.dart';
import 'exercise_3.dart';
import 'exercise_4.dart';
import 'exercise_5.dart';
import 'exercise_6.dart';
import 'exercise_7.dart';

void main() {
  // num myNumber = 1;
  // myNumber = 3.14;
  // // Raw String
  // print(r"MyNumber:\n ${mynumber}");
  print("======================= HomeWork =======================");
  print("======================= Exercise 1 =======================");
  exercise_1(20);

  print("\n======================= Exercise 2 =======================");
  exercise_2(20);

  print("\n======================= Exercise 3 =======================");
  exercise_3(10);

  print("\n======================= Exercise 4 =======================");
  print(isEven(10));

  print("\n======================= Exercise 5 =======================");
  try {
    double result = exercise_5(10, 0);
    print("ผลลัพธ์: $result");
  } catch (e) {
    print("มีข้อผิดพลาด $e");
  }

  print("\n======================= Exercise 6 =======================");
  Student student = Student("ต้นน้ำ", "อ.1");

  student.introduce();
  student.study();

  print("\n======================= Exercise 7 =======================");
  Shape rec = Rectangle();
  Shape tri = Triangle();
  Shape cir = Circle();

  rec.draw();
  tri.draw();
  cir.draw();
}
