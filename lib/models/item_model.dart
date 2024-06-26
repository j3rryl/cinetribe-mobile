import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  String? uid;
  String? name;
  String? genre;
  String? description;
  String? imageUrl;

  Item(
    this.uid,
    this.name,
    this.genre,
    this.description,
    this.imageUrl,
  );

  // Factory constructor to create an Item from a Firestore document
  factory Item.fromDocument(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Item(
      data['uid'],
      data['name'],
      data['genre'],
      data['description'],
      data['imageUrl'],
    );
  }
  // Method to convert an Item to a Map
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'genre': genre,
      'description': description,
      'imageUrl': imageUrl,
    };
  }
}
