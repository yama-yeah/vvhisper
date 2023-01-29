import 'package:js/js.dart';

import 'filter.dart';

@JS("chrome.webRequest.onBeforeRequest.addListener")
external void addRequestListener(dynamic callback, URLS urls);

@JS()
@anonymous
class Request {
  external String get url;
  external String get method;
  external factory Request({String url, String method});
}
