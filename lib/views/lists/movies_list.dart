import 'package:cinetribe/models/item_model.dart';
import 'package:cinetribe/views/lists/item_card.dart';
import 'package:cinetribe/views/movies/movie_details.dart';
import 'package:cinetribe/views/movies/movies_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MoviesList extends StatefulWidget {
  const MoviesList(this.title, {Key? key}) : super(key: key);
  final String? title;

  @override
  State<MoviesList> createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  late Stream<QuerySnapshot> moviesStream;

  @override
  void initState() {
    super.initState();
    moviesStream = FirebaseFirestore.instance
        .collection("categories")
        .doc("movie")
        .collection("movies")
        .limit(5)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: moviesStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        List<Item> movies = snapshot.data!.docs.map((doc) {
          return Item.fromDocument(doc);
        }).toList();

        // Return an empty Container if no movie is present
        if (movies.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.black),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MoviesPage()));
                    },
                    child: const Text(
                      "See all",
                      style: TextStyle(color: Color.fromRGBO(151, 40, 47, 1)),
                    ))
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            SizedBox(
              height: 250,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (context, index) => ItemCard(movies[index], () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MovieDetails(movies[index])));
                }),
              ),
            ),
          ],
        );
      },
    );
  }
}
