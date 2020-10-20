import 'package:cli/cli.dart' as cli;
import 'package:cli/Spacecraft.dart';
import 'package:cli/async.dart' as async_funcs;

Future<void> main(List<String> arguments) async {
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

  // sets
  Set<String> names = {};
  // var names = <String>{}; // works too

  names.add('Daler');
  names.add('John');
  names.add('Robert');

  var moreNames = <String>{};
  moreNames.addAll(names);
  moreNames.add('Leo');

  print("$names $moreNames");

  // maps
  var gifts = Map();
  gifts['first'] = 'partdige';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'goldern rings';

  print(gifts.length == 3);
  print(gifts);

  var saying = cli.say('Daler', 'what\'s up man?', 'iphone');
  print(saying);

  cli.enableFlags(bold: true, hidden: true);

  var voyager = Spacecraft('Voyager', DateTime(1977, 9, 5));
  voyager.describe();

  var voyager3 = Spacecraft.unlaunched('Voyager III');
  voyager3.describe();

  print(await async_funcs.createOrderMessage());
}
