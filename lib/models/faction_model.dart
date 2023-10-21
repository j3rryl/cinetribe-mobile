import 'package:cloud_firestore/cloud_firestore.dart';

class FactionItem {
  final String? id;
  final String? parentId;
  final String name;
  final String description;
  final String imageUrl;

  FactionItem(
    this.id,
    this.parentId,
    this.name,
    this.description,
    this.imageUrl,
  );

  // Factory constructor to create an Item from a Firestore document
  factory FactionItem.fromDocument(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return FactionItem(
      data['id'],
      data['parentId'],
      data['name'],
      data['description'],
      data['imageUrl'],
    );
  }
  // Method to convert an Item to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'parentId': parentId,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
    };
  }
}
