import 'dart:ui';
import 'package:flutter/material.dart';

class Charakter{
  final String name;
  final String imagePath;
  final String description;
  final List<Color> colors;
  Charakter({required this.name,required this.imagePath,required this.description,required this.colors});
}
List charakters=[
  Charakter(
    name: 'Kevin',
    imagePath: 'assets/images/Kevin_minions.png',
    description: 'Kevin loves to make fun of and tease people or Minions,'
        ' shown when he made fun of Jerry and teased him for being a coward.'
        ' He likes playing golf polo and cricket. Kevin has a sense of humor, '
        'shown when he thought it was hilarious to see Tom turn into a mutant purple minion, '
        'but then immediately showed a cautious side when he realized that he was next to be a victim. '
        'In the film Minions, he is the protagonist and leader of the trio in search of a new master. '
        'He truly cares about the well-being of the Minion tribe (which is dependent on them having a proper master). ',
    colors: [Colors.orange.shade200,Colors.deepOrange.shade400]
  ),
  Charakter(
      name: 'Agnes',
      imagePath: 'assets/images/Agnes_gru.png',
      description: 'Agnes is a little girl with dark brown eyes. Her long black hair is tied in an upwards ponytail with a bright red scrunchie. '
          'Most of the time, Agnes wears steel blue overalls over a yellow and brown striped t-shirt, '
          'and white sneakers with yellow socks. She also wears a white ballet outfit like Edith and Margo (at the ballet recital). '
          'For pajamas, Agnes wears a long blue nightshirt covered with teddy bears and polar bear slippers; her hair stays the same. '
          'On her birthday, Agnes is wearing a dress that resembles a princess riding a unicorn. The colors are similar to her regular outfit. '
          'She also wears a blue princess hat on her head.'
      ,colors: [Colors.pink.shade200,Colors.redAccent.shade400]
  )
];
