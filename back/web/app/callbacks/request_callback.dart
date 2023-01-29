import 'package:js/js.dart';

import '../../service/chrome/chrome.dart';
import '../../service/native/native.dart';
import '../../service/server/server.dart';
import '../model/message_model.dart';
import '../state/count.dart';

void requestCallback(Request request) {
  //getかつurlにmp3が含まれている場合
  if (request.method == 'GET' && request.url.contains('mp3')) {
    TrafficCountState().increment();
    log(request);
    Server()
        .postMessage(MessageModel(
      url: request.url,
      type: MessageType.stable.name,
      id: TrafficCountState().count,
    ))
        .then((value) {
      print('posted');
    });
  }
}

@JS()
external set _onBeforeRequestCallback(void Function(Request request) f);

@JS()
external void onBeforeRequestCallback(Request request);
