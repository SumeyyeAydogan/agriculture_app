import 'dart:async';
import 'dart:convert';
import 'package:agriculture_app/features/model/chat/message_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:xml2json/xml2json.dart';

import 'dart:async';
import 'dart:convert';
import 'package:agriculture_app/features/model/chat/message_model.dart';
import 'package:http/http.dart' as http;

class ChattingManager {
  static ChattingManager? _instance;
  static ChattingManager get instance {
    _instance ??= ChattingManager._init();
    return _instance!;
  }

  static final Uri _baseUri = Uri.parse("https://chc0y79xc0.execute-api.eu-west-1.amazonaws.com/Prod/chat_gpt");

  ChattingManager._init();

  Future<String?> askQuestionToGpt({required String question}) async {
    String message = question;

    // İsteği yaparken parametreleri direkt olarak Uri'ye ekleyebilirsin
    Uri requestUri = _baseUri.replace(queryParameters: {'message': message});

    // Auth header'ını ayarla
    String authToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1lcnRlbWlyQHN1ZmxlLmlvIiwiZmlyc3RfbmFtZSI6Ik1lcnQgRW1pciIsImxhc3RfbmFtZSI6IktheWEiLCJleHAiOjE3MDQ5MTQzMjF9.QBL2rryDqywF2h4lT4pDCybMIXTppKS1HaNoA3WjT1E"; //Xml2Json forConversion = Xml2Json();

    // İstek gönder
    Response webReply = await http.get(
      requestUri,
      headers: {
        "Authorization": authToken,
        // İhtiyaç duyulan diğer header'ları buraya ekle
      },
    );
    Map<String, dynamic> data = jsonDecode(webReply.body);
    String value = data["message"];
    return value;
  }
}
