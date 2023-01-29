import 'dart:html';

import 'package:logger/logger.dart';

import '../../app/model/message_model.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import '../native/fetch.dart';
import '../native/native.dart';

class Server {
  final String _url = 'http://127.0.0.1:8092/';
  final Map<String, String> _headers = {'content-type': 'application/json'};
  Future<void> postMessage(MessageModel message) async {
    String body = convert.json.encode(message.toJson());
    print('post body $body');
    try {
      //await http.post(Uri.parse('${_url}'), body: body, headers: _headers);
      final param = FetchParam(method: 'POST', body: body);
      log(param);
      await fetch('${_url}', param);
      print('posted success');
    } catch (e) {
      print('post error $e');
    }
  }
}
