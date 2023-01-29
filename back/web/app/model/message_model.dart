import 'package:js/js.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'message_model.freezed.dart';
part 'message_model.g.dart';

enum MessageType {
  clear,
  stable,
}

@freezed
class MessageModel with _$MessageModel {
  const factory MessageModel({
    required String url,
    required String type,
    required int id,
  }) = _MessageModel;
  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);
}
