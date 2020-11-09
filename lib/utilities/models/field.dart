class Field{
  final String name;
  int grade;

  Field({this.name, this.grade=1});

  void changeGrade(int value){
    grade=value;
  }
}

