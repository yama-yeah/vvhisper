import 'package:js/js.dart';

import '../../service/chrome/chrome.dart';
import '../../service/server/server.dart';
import '../model/message_model.dart';
import '../state/count.dart';

void navigationCallback(Object detail) {
  TrafficCountState().reset();
  //final message = MessageModel(url: '', type: MessageType.clear.name, id: 0);
  //Server().postMessage(message);
}

@JS()
external set _onBeforeNavigationCallback(void Function(Object detail) f);

@JS()
external void onBeforeNavigationCallback(Object detail);
