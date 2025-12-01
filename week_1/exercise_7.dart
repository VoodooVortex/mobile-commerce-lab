class Shape {
  void draw() {
    print('วาดรูปรูปทรง');
  }
}

class Rectangle extends Shape {
  @override
  void draw() {
    print('วาดรูปสี่เหลี่ยม');
  }
}

class Triangle extends Shape {
  @override
  void draw() {
    print("วาดรูปสามเหลี่ยม");
  }
}

class Circle extends Shape {
  @override
  void draw() {
    print("วาดรูปวงกลม");
  }
}

void main() {
  print("======================= HomeWork =======================");
  print("======================= Exercise 7 =======================");
  Shape rec = Rectangle();
  Shape tri = Triangle();
  Shape cir = Circle();

  rec.draw();
  tri.draw();
  cir.draw();
}
