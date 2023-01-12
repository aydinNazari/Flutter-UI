import 'package:flutter/material.dart';
import 'package:minions_flutter_ui/Models/charakter.dart';
import 'package:minions_flutter_ui/Widget/charakterWidget.dart';
import 'package:minions_flutter_ui/app_theme.dart';

class CharakterListingScreen extends StatefulWidget {
  const CharakterListingScreen({Key? key}) : super(key: key);

  @override
  State<CharakterListingScreen> createState() => _CharakterListingScreenState();
}

class _CharakterListingScreenState extends State<CharakterListingScreen> {
  late PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        viewportFraction: 1, initialPage: currentPage, keepPage: false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(
                Icons.search,
                color: Colors.black,
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 32, top: 8),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(text: 'Despicable me', style: AppTheme.display1),
                      TextSpan(text: '\n'),
                      TextSpan(text: 'Characters', style: AppTheme.display2)
                    ],
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  children: [
                    for(var i=0;i<charakters.length;i++)
                    CharacterWidget(charakterr: charakters[i],pageController: _pageController,currentPage: i)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
