import 'package:cinetribe/models/item_model.dart';
import 'package:cinetribe/views/lists/item_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  late Stream<QuerySnapshot> moviesStream;

  @override
  void initState() {
    super.initState();
    moviesStream = FirebaseFirestore.instance.collection('movies').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: StreamBuilder<QuerySnapshot>(
          stream: moviesStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            List<Item> movies = snapshot.data!.docs.map((doc) {
              return Item.fromDocument(doc);
            }).toList();

            return ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ItemCard(movies[index], () {
                        // Your navigation logic here
                      }),
                    ));
          }),
    );
  }
}
