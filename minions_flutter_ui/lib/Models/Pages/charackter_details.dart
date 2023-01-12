import 'package:flutter/material.dart';
import 'package:minions_flutter_ui/app_theme.dart';

import '../charakter.dart';

class CharackterDetails extends StatefulWidget {
  Charakter charakter;

  CharackterDetails({Key? key, required this.charakter}) : super(key: key);

  @override
  State<CharackterDetails> createState() => _CharackterDetailsState();
}

class _CharackterDetailsState extends State<CharackterDetails> {
  @override
  Widget build(BuildContext context) {
    final screenWith = MediaQuery.of(context).size.width;
    final screenHeigh = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Hero(
            tag: "background-${widget.charakter.name}",
            child: DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: widget.charakter.colors,
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft))),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 16),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                    iconSize: 40,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Hero(
                    tag: "image-${widget.charakter.name}",
                    child: Image.asset(
                      widget.charakter.imagePath,
                      height: screenHeigh * 0.45,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWith * 0.1,
                      vertical: screenHeigh * 0.01),
                  child: Hero(
                      tag: "name-${widget.charakter.name}",
                      child:
                          Text(widget.charakter.name, style: AppTheme.heading)),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: screenWith * 0.05,
                      left: screenWith * 0.05,
                      bottom: screenWith * 0.2),
                  child: Text(
                    widget.charakter.description,
                    style: AppTheme.subHeading,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
