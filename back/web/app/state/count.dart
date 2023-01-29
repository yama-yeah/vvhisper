// singleton
class TrafficCountState {
  static final TrafficCountState _singleton = TrafficCountState._internal();

  factory TrafficCountState() {
    return _singleton;
  }

  TrafficCountState._internal();

  int count = 0;

  void increment() {
    count++;
  }

  void reset() {
    count = 0;
  }
}
