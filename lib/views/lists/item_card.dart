import 'package:cinetribe/models/item_model.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
  const ItemCard(this.item, this.onTap, {Key? key}) : super(key: key);
  final Item item;
  final Function()? onTap;
  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(right: 10),
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.circular(8.0),
      // ),
      child: InkWell(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 150.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.grey.shade200,
                    image: DecorationImage(
                        image: NetworkImage(widget.item.imageUrl!),
                        fit: BoxFit.cover)),
                child: Stack(
                  children: [
                    // Align(
                    //   alignment: Alignment.topRight,
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: Icon(
                    //       (widget.item.liked ?? false)
                    //           ? Icons.bookmark
                    //           : Icons.bookmark_outline,
                    //       color: (widget.item.liked ?? false)
                    //           ? Colors.pink
                    //           : Colors.pink,
                    //     ),
                    //   ),
                    // ),
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
                              widget.item.name!,
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
            ],
          ),
        ),
      ),
    );
  }
}
