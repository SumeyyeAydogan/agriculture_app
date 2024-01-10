import 'package:uuid/uuid.dart';
//part 'note_model.g.dart';

class Note {
  final String id;

  String title;

  String content;

  final DateTime? createdAt;

  Note(
      {required this.id,
      required this.title,
      required this.content,
      required this.createdAt,});

  factory Note.create({required String title, required String content}) {
    return Note(
        id: const Uuid().v1(), title: title, content: content, createdAt: DateTime.now(),);
  }
  //factory ile constractor döndürdük, name ve createdAt parametreleri ben gönderiyorum, idsini paket oluşturuyor
}

