double exercise_5(double x, double y) {
  if (y == 0) {
    throw Exception('Division by zero');
  }
  return x / y;
}

void main() {
  print("======================= HomeWork =======================");
  print("======================= Exercise 5 =======================");
  try {
    double result = exercise_5(10, 0);
    print("ผลลัพธ์: $result");
  } catch (e) {
    print("มีข้อผิดพลาด $e");
  }
}
