import 'package:flutter/material.dart';

class FandomPage extends StatefulWidget {
  const FandomPage({super.key});

  @override
  State<FandomPage> createState() => _FandomPageState();
}

class _FandomPageState extends State<FandomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fandom"),
      ),
    );
  }
}
