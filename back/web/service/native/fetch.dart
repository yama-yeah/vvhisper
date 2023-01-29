import 'package:js/js.dart';

@JS("fetch")
external Future<dynamic> fetch(String url, FetchParam param);

@JS()
@anonymous
class FetchParam {
  external String get method;
  external String get body;
  external factory FetchParam({String method, String body});
}
