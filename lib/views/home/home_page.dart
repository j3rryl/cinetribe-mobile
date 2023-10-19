import 'package:cinetribe/views/lists/movies_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            // leading: Icon(Icons.menu),
            actions: [
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.logout),
                color: Colors.black,
                onPressed: logout,
              ),
              const SizedBox(width: 14),
            ],
            expandedHeight: 225,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.pink,
              ),
              title: const Text("C I N E T R I B E"),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  MoviesList("Movies"),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
