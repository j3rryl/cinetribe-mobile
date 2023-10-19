import 'package:cinetribe/views/fandom/fandom_view.dart';
import 'package:cinetribe/views/home/home_page.dart';
import 'package:cinetribe/views/profile/profile_view.dart';
import 'package:cinetribe/views/search/search_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SearchPage(),
    FandomPage(),
    ProfilePage(),
  ];
  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Container(
          color: const Color.fromRGBO(151, 40, 47, 1),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: GNav(
                gap: 8,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                padding: const EdgeInsets.all(16),
                backgroundColor: const Color.fromRGBO(151, 40, 47, 1),
                color: Colors.white,
                activeColor: const Color.fromRGBO(151, 40, 47, 1),
                tabBackgroundColor: Colors.grey.shade50,
                tabs: const [
                  GButton(icon: Icons.home, text: "Home"),
                  GButton(icon: Icons.search, text: "Search"),
                  GButton(icon: Icons.favorite_border, text: "Fandom"),
                  GButton(icon: Icons.person, text: "Profile"),
                ]),
          ),
        ));
  }
}
