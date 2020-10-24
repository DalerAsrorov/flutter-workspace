import 'dart:convert';
import 'dart:math';

class Point {
  // the keyword ~final~ makes sure the
  // class members are initialized
  final num x;
  final num y;
  final num distanceFromOrigin;

  // constructor
  Point(x, y)
      : x = x,
        y = y,
        distanceFromOrigin = sqrt(x * x + y * y);

  // A named constructor with the ~initializer list~
  // The key component here is the ':' (column) after
  // which class members are initialized here.
  Point.fromJson(Map<String, dynamic> json)
      : x = json['x'],
        y = json['y'],
        distanceFromOrigin =
            sqrt(json['x'] * json['x'] + json['y'] * json['y']);

  // Redirecting constructor
  Point.alongXAxis(num x) : this(x, 0);

  // convert the class instance to JSON
  Map<String, dynamic> toJson() =>
      {'x': x, 'y': y, 'distance': distanceFromOrigin};

  // instance method
  double distanceTo(Point other) {
    var dx = x - other.x;
    var dy = y - other.y;

    return sqrt(dx * dx + dy * dy);
  }
}

class ImmutablePoint {
  static final ImmutablePoint origin = const ImmutablePoint(0, 0);

  final num x, y;

  const ImmutablePoint(this.x, this.y);
}

void main() {
  var p1 = Point.fromJson({'x': 12.5, 'y': 5.3});
  var p2 = Point.alongXAxis(p1.x * 2);

  print(p1.toJson());
  print(jsonEncode(p1));
  print(p2.toJson());
  print('Distance from p2 to p1 is ${p2.distanceTo(p1)}');
}
