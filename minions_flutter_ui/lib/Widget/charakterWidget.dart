import 'package:flutter/material.dart';
import 'package:minions_flutter_ui/Models/charakter.dart';
import 'package:minions_flutter_ui/app_theme.dart';

import '../Models/Pages/charackter_details.dart';

class CharacterWidget extends StatelessWidget {
  final Charakter charakterr;
  final PageController pageController;
  final int currentPage;

  const CharacterWidget({Key? key,required this.charakterr,required this.pageController,required this.currentPage }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWith = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 350),
            pageBuilder: (context, _, __) => CharackterDetails(
              charakter: charakterr,
            ),
          ),
        );
      },
      child: AnimatedBuilder(
        animation: pageController,
        builder: (context, child) {
          double value=0;
          if(pageController.position.haveDimensions){
            value=pageController.page! - currentPage;
            value=(1-(value.abs() * 0.6 )).clamp(0.0, 1.0);

          }
          return Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: ClipPath(
                  clipper: CharacterCardBackgroundClipper(),
                  child: Hero(
                    tag: "background-${charakterr.name}",
                    child: Container(
                      height: screenHeight * 0.6,
                      width: 0.9 * screenWith,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: charakterr.colors,
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0, -0.5),
                child: Hero(
                  tag: "image-${charakterr.name}",
                  child: Image.asset(
                    charakterr.imagePath,
                    height: screenHeight * 0.55 * value,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 0.1 * screenWith, bottom: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                          tag: "name-${charakterr.name}",
                          child: Text(charakterr.name, style: AppTheme.heading)),
                      Text('Top to read more', style: AppTheme.subHeading)
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class CharacterCardBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path clippedPath = Path();
    double curveDistance = 40;

    clippedPath.moveTo(0, size.height * 0.4);
    clippedPath.lineTo(0, size.height - curveDistance);
    clippedPath.quadraticBezierTo(
        1, size.height - 1, 0 + curveDistance, size.height);
    clippedPath.lineTo(size.width - curveDistance, size.height);
    clippedPath.quadraticBezierTo(size.width + 1, size.height - 1, size.width,
        size.height - curveDistance);
    clippedPath.lineTo(size.width, 0 + curveDistance);
    clippedPath.quadraticBezierTo(size.width - 1, 0,
        size.width - curveDistance - 5, 0 + curveDistance / 3);
    clippedPath.lineTo(curveDistance, size.height * 0.29);
    clippedPath.quadraticBezierTo(
        1, (size.height * 0.30) + 10, 0, size.height * 0.4);
    return clippedPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
