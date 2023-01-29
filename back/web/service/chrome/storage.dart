import 'package:js/js.dart';

@JS('chrome.storage.local.set')
external dynamic set(AppStorage value);

@JS('chrome.storage.local.get')
external dynamic get(List<dynamic> keys);

@JS()
@anonymous
class AppStorage {
  external List<dynamic> get urls;
  external factory AppStorage({List<dynamic> urls});
}
