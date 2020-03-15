import 'package:flutter/foundation.dart';

class Document {
  final String title;
  final String userId;
  final String documentId;


  Document({
    @required this.userId,
    @required this.title,
    this.documentId,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'title': title,
    };
  }

  static Document fromMap(Map<String, dynamic> map, String documentId) {
    if (map == null) return null;

    return Document(
      title: map['title'],
      userId: map['userId'],
      documentId: documentId,
    );
  }
}
