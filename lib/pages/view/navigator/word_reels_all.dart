import 'package:flutter/material.dart';
import 'package:wordmedia/base/color_data.dart';
import 'package:wordmedia/base/resizer/fetch_pixels.dart';
import 'package:flip_card/flip_card.dart';
import '../../../models/word_model.dart';
import '../../../provider/reels_provider.dart';
import 'package:provider/provider.dart';

class WordReelAllScreen extends StatefulWidget {
  const WordReelAllScreen({super.key});

  @override
  State<WordReelAllScreen> createState() => _WordReelAllScreenState();
}

class _WordReelAllScreenState extends State<WordReelAllScreen> {
  bool dondumu = false;
  bool flipto = true;
  List<Word> wordList = [];
  PageController controller = PageController(initialPage: 0); // PageController'ı burada üye değişken olarak oluşturun

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    wordList = Provider.of<ReelsProvider>(context, listen: true).allwords!;
  }

  @override
  Widget build(BuildContext context) {
    if (wordList.isEmpty) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Scaffold(
        body: Container(
          color: blueColor,
          child: PageView.builder(
            scrollDirection: Axis.vertical,
            physics: dondumu
                ? AlwaysScrollableScrollPhysics()
                : NeverScrollableScrollPhysics(),
            itemCount: wordList.length,
            controller: controller,
            onPageChanged: (_) {
              setState(() {
                dondumu = false;
                flipto = true;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return WordPage(
                colora: blueColor,
                firstword: wordList[index].word,
                secondword: wordList[index].wordtranslate,
                sentence: wordList[index].sentence,
                flipto: flipto,
                flip: (status) {
                  setState(() {
                    flipto = false;
                    dondumu = true;
                  });
                },
                pageController: controller, // PageController'ı geçin
                currentIndex: index, // Mevcut sayfa indeksini geçin
              );
            },
          ),
        ),
      );
    }
  }
}

class WordPage extends StatelessWidget {
  final Color colora;
  final String? firstword;
  final String? secondword;
  final void Function(bool) flip;
  final bool flipto;
  final String? sentence;
  final PageController pageController; // PageController'ı alın
  final int currentIndex; // Mevcut sayfa indeksini alın

  const WordPage({
    Key? key,
    required this.colora,
    required this.firstword,
    required this.secondword,
    required this.flip,
    required this.flipto,
    required this.pageController, // PageController'ı constructor'a ekleyin
    required this.currentIndex, // Mevcut sayfa indeksini constructor'a ekleyin
    this.sentence,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colora,
      height: FetchPixels.height,
      width: FetchPixels.width,
      child: FlipCard(
        flipOnTouch: flipto,
        direction: FlipDirection.HORIZONTAL,
        side: CardSide.FRONT,
        speed: 1000,
        onFlipDone: flip,
        front: Container(
          color: colora,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                firstword!,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        back: Container(
          color: colora,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                secondword!,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              Text(
                sentence != null ? sentence! : " ",
                textAlign: TextAlign.center,
              ),
              IconButton(
                icon: Icon(Icons.add),
                iconSize: 50.0, // İkonun boyutunu ayarlar
                color: whiteGroundColor, // İkonun rengini ayarlar
                onPressed: () {
                  // Butona tıklandığında çalışacak kod
                  pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}