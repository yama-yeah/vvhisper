@JS()

import 'app/app.dart';
import 'service/chrome/chrome.dart';

import 'package:js/js.dart';

void main() {
  final _onBeforeRequestCallback = allowInterop(requestCallback);
  final _onBeforeNavigationCallback = allowInterop(navigationCallback);
  addRequestListener(
      _onBeforeRequestCallback, URLS(urls: ['https://hope.fun.ac.jp/*']));
  addNavigationListener(
      _onBeforeNavigationCallback, URLS(urls: ['https://hope.fun.ac.jp/*']));
}
