import 'package:meta/meta.dart';

int calculate() {
  return 6 * 7 ~/ 2;
}

String say(String from, String msg, [String device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }

  return result;
}

void enableFlags({bool bold = false, @required bool hidden}) {
  print('bold: $bold, hidden: $hidden');
}
