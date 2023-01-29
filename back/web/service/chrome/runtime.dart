import 'package:js/js.dart';

@JS("chrome.runtime.sendMessage")
external void sendMessage(dynamic message);
