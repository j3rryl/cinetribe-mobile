import 'package:cloud_firestore/cloud_firestore.dart';

class FactionItem {
  final String? id;
  final String name;
  final String description;
  final String imageUrl;

  FactionItem(
    this.id,
    this.name,
    this.description,
    this.imageUrl,
  );

  // Factory constructor to create an Item from a Firestore document
  factory FactionItem.fromDocument(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return FactionItem(
      data['id'],
      data['name'],
      data['description'],
      data['imageUrl'],
    );
  }
  // Method to convert an Item to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
    };
  }
}
