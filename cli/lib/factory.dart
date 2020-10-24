// Use the factory keyword when implementing a constructor that doesn’t
// always create a new instance of its class. For example, a factory constructor
// might return an instance from a cache, or it might return an instance of a subtype.
// Another use case for factory constructors is initializing a final variable using
// logic that can’t be handled in the initializer list.

// In the following example, the Logger factory constructor returns objects from a cache,
// and the Logger.fromJson factory constructor initializes a final variable from a JSON object.

class Logger {
  final String name;
  bool mute = false;

  // _cache is library-private, thanks to
  // the _ in front of its name.
  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }

  factory Logger.fromJson(Map<String, Object> json) {
    return Logger(json['name'].toString());
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) print('${name} said: ${msg}');
  }
}

main() {
  var logger = Logger('UI');
  logger.log('Button clicked');

  var loggerJson = Logger.fromJson({'name': 'FS'});
  loggerJson.log('Hahahaha');
}
