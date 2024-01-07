import 'dart:async';
import 'dart:convert';
import 'package:agriculture_app/features/model/chat/message_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:xml2json/xml2json.dart';

class ChatHistoryManager {
  static ChatHistoryManager? _instance;
  static ChatHistoryManager get instance {
    _instance ??= ChatHistoryManager._init();
    return _instance!;
  }

  Uri get _baseUri => Uri.parse("");

  ChatHistoryManager._init();

  Future<List<MessageModel>> fetchMessagesFromDB({required MessageModel model}) async {
    Xml2Json forConversion = Xml2Json();
    String answer = "";
    Response webReply = await http.post(
      _baseUri,
      headers: {},
      body: utf8.encode(answer),
    );

    forConversion.parse(webReply.body);
    String jsonString = forConversion.toParker();
    Map mainData = (jsonDecode(jsonString) as Map);
    dynamic dataSent = mainData[":"][":"][""][""];

    return dataSent;
  }
}
