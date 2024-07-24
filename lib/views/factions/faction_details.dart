import 'package:cinetribe/models/faction_model.dart';
import 'package:flutter/material.dart';

class FactionDetails extends StatefulWidget {
  const FactionDetails(this.item, {Key? key}) : super(key: key);
  final FactionItem item;
  @override
  State<FactionDetails> createState() => _FactionDetailsState();
}

class _FactionDetailsState extends State<FactionDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.pink),
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(
          widget.item.name,
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
                        image: NetworkImage(widget.item.imageUrl),
                        fit: BoxFit.cover)),
                child: const Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.favorite_outline, color: Colors.pink),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                widget.item.description,
                textAlign: TextAlign.start,
                style: const TextStyle(
                    fontSize: 14.0, letterSpacing: 0.8, color: Colors.teal),
              ),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
