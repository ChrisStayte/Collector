import 'package:auto_size_text/auto_size_text.dart';
import 'package:collector/global/Global.dart';
import 'package:collector/models/item.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  const ItemCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 135,
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Global.colors.darkIconColor,
                ),
                // child: Image.file(
                //   File(item.photoPath),
                //   fit: BoxFit.cover,
                // ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: SizedBox(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        item.title,
                        maxLines: 2,
                        maxFontSize: 24,
                        minFontSize: 12,
                        style: TextStyle(
                            color: Global.colors.darkIconColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      Text(
                        item.dateTime.toString(),
                        style: TextStyle(
                          fontSize: 14,
                          color: Global.colors.darkIconColor,
                        ),
                      ),
                      Text(
                        '${item.latitude.toStringAsFixed(4)}, ${item.longitude.toStringAsFixed(4)}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Global.colors.darkIconColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}