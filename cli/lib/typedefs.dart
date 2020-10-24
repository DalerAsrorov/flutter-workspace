typedef Compare<T> = int Function(T a, T b);

int sort(int a, int b) => a - b;

void main() {
  print(sort is Compare<int>);
}
