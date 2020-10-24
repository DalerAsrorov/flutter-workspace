class Person {
  String firstName;

  Person.fromJson(Map data) {
    print('in Person');
  }
}

class Employee extends Person {
  Employee.fromJson(Map data) : super.fromJson(data) {
    print('in Employee');
  }
}

main() {
  var emp = Employee.fromJson({});

  if (emp is Person) {
    emp.firstName = 'Bob';
  }

  print(emp.firstName);
}
