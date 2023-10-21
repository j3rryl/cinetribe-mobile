import 'package:cinetribe/models/faction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cinetribe/models/item_model.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails(this.item, {Key? key}) : super(key: key);
  final Item item;
  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  late Stream<QuerySnapshot> factionsStream;

  @override
  void initState() {
    super.initState();
    factionsStream = FirebaseFirestore.instance
        .collection("categories")
        .doc("movie")
        .collection("movies")
        .doc(widget.item.uid)
        .collection("factions")
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.pink),
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(
          widget.item.name!,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 300.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    image: DecorationImage(
                        image: NetworkImage(widget.item.imageUrl!),
                        fit: BoxFit.cover)),
                child: Stack(
                  children: [
                    const Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.favorite_outline, color: Colors.pink),
                      ),
                    ),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.all(
                                8.0), // Adjust padding as needed
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(8.0), // Rounded corners
                              color: Colors.red.shade50, // Background color
                            ),
                            child: Text(
                              widget.item.genre!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13.0,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                widget.item.description!,
                textAlign: TextAlign.start,
                style: const TextStyle(
                    fontSize: 14.0, letterSpacing: 0.8, color: Colors.teal),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                "Factions",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.8),
              ),
              const SizedBox(
                height: 10,
              ),
              StreamBuilder<QuerySnapshot>(
                stream: factionsStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  // If there's an error fetching the data
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }

                  // While the data is loading
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  List<FactionItem> factions = snapshot.data!.docs.map((doc) {
                    return FactionItem.fromDocument(doc);
                  }).toList();

                  // Now, build the GridView using the list of images
                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: factions.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 10,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(factions[index].imageUrl),
                                  fit: BoxFit.cover)),
                          child: Stack(
                            children: [
                              Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(
                                          8.0), // Adjust padding as needed
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            8.0), // Rounded corners
                                        color: Colors
                                            .red.shade50, // Background color
                                      ),
                                      child: Text(
                                        factions[index].name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13.0,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      );
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
