class Vector {
  final int x, y;

  Vector(this.x, this.y);

  Vector operator +(Vector v) => Vector(x + v.x, y + v.y);
  Vector operator -(Vector v) => Vector(x - v.x, y - v.y);

  @override
  bool operator ==(Object obj) => obj is Vector && x == obj.x && y == obj.y;

  @override
  int get hashCode => x.hashCode ^ y.hashCode;
}

void main() {
  final v = Vector(2, 3);
  final w = Vector(2, 2);
  final z = Vector(4, 5);
  final q = Vector(2, 3);

  print(v + w == Vector(4, 5));
  print(v - w == Vector(0, 1));
  print(v + w == z);
  print(v == q);

  print(v.hashCode);
  print(w.hashCode);
  print(z.hashCode);
  print(q.hashCode);
}
