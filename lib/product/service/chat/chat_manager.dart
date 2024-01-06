import 'dart:async';
import 'dart:convert';
import 'package:agriculture_app/features/model/chat/message_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:xml2json/xml2json.dart';

class ChatManager {
  static ChatManager? _instance;
  static ChatManager get instance {
    _instance ??= ChatManager._init();
    return _instance!;
  }

  Uri get _baseUri =>
      Uri.parse("");

  ChatManager._init();

  Future<String?> askQuestionToGpt({required MessageModel model}) async {
    Xml2Json forConversion = Xml2Json();
    String answer = "";
    Response webReply = await http.post(
      _baseUri,
      headers: {
      },
      body: utf8.encode(answer),
    );

    forConversion.parse(webReply.body);
    String jsonString = forConversion.toParker();
    Map mainData = (jsonDecode(jsonString) as Map);
    dynamic dataSent = mainData[":"][":"]
        [""][""];

    return dataSent.toString();
  }
}
