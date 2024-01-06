import 'package:uuid/uuid.dart';

class Task  {
  final String id;

  String name;

  final DateTime? createdAt;

  bool isCompleted;

  Task(
      {required this.id,
      required this.name,
      required this.createdAt,
      required this.isCompleted});

  factory Task.create({required String name, required DateTime? createdAt}) {
    return Task(
        id: const Uuid().v1(), name: name, createdAt: createdAt, isCompleted: false);
  }
  //factory ile constractor döndürdük, name ve createdAt parametreleri ben gönderiyorum, idsini paket oluşturuyor
}

