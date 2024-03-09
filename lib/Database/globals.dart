// globals.dart
library my_flutter_globals;

int _globalLevel = 1;

void setGlobalLevel(int newValue) {
  _globalLevel = newValue;
}

int getGlobalLevel() {
  return _globalLevel;
}
