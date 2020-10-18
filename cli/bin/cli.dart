import 'package:cli/cli.dart' as cli;

void main(List<String> arguments) {
  var result = cli.calculate();

  assert(result == 21);
  print('Hello world: ${result}!');

  var list;
  const constantList = [1, 2, 3, 4, 5];

  list = [0, ...?list];
  print(list);

  var listOfStrings = [
    '#0',
    for (var i in constantList)
      if (i <= 3) '#$i'
  ];

  print(listOfStrings);
}
