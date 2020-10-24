// async generator
Stream<int> asyncNaturalsTo(int n) async* {
  var k = 0;

  while (k < n) {
    yield k++;
  }
}

// recursive sync generator
Iterable<int> naturalsDownFrom(int n) sync* {
  if (n > 0) {
    yield n;
    yield* naturalsDownFrom(n - 1);
  }
}

Future<void> main() async {
  var n = 5;

  await for (var num in asyncNaturalsTo(n)) {
    print(num);
  }

  print('*****');

  for (var num in naturalsDownFrom(n)) {
    print(num);
  }
}
