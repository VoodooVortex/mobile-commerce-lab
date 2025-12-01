void exercise_2(int temperature) {
  String tempToDay = switch (temperature) {
    <= 15 => 'หนาว',
    <= 25 => 'เย็น',
    <= 35 => 'ร้อน',
    _ => 'ร้อนมาก',
  };

  print("อากาศวันนี้ $tempToDay");
}

void main() {
  print("======================= HomeWork =======================");
  print("======================= Exercise 2 =======================");
  exercise_2(20);
}
