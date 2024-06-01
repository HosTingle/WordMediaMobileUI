import 'package:flutter/material.dart';
import 'package:wordmedia/base/color_data.dart';
import 'package:wordmedia/base/resizer/fetch_pixels.dart';
import 'package:flip_card/flip_card.dart';
import '../../models/word_model.dart';
import '../../provider/reels_provider.dart';
import 'package:provider/provider.dart';
class WordReelScreen extends StatefulWidget {
  const WordReelScreen({super.key});

  @override
  State<WordReelScreen> createState() => _WordReelScreenState();
}

class _WordReelScreenState extends State<WordReelScreen> {
  bool dondumu=false;
  bool flipto=true;
  List<Word> wordList=[];
  @override
  void initState() {
    super.initState();

  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    wordList=Provider.of<ReelsProvider>(context, listen: true).words!;
  }
  @override
  Widget build(BuildContext context) {
    PageController controller=PageController(initialPage: 0);
    if(wordList.isEmpty){
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    else{
      return Scaffold(
        body: Container(
          color: blueColor,
          child: PageView.builder(
            scrollDirection: Axis.vertical,
            physics: dondumu ? AlwaysScrollableScrollPhysics() : NeverScrollableScrollPhysics(),
            itemCount: wordList.length,
            controller: controller,
            onPageChanged: (_){
              setState(() {
                dondumu=false;
                flipto=true;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return WordPage(
                colora: index.isEven ? Colors.white : Colors.blue,
                firstword: wordList[index].word,
                secondword: wordList[index].wordtranslate,
                sentence: wordList[index].sentence,
                flipto: flipto,
                flip: (status) {
                  setState(() {
                    flipto=false;
                    dondumu = true;
                  });
                },
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

  const WordPage({
    Key? key,
    required this.colora,
    required this.firstword,
    required this.secondword,
    required this.flip,
    required this.flipto, this.sentence
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
              Text(firstword!, style: Theme.of(context).textTheme.headline1,textAlign: TextAlign.center,),
            ],
          ),
        ),
        back: Container(
          color: colora,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(secondword!, style: Theme.of(context).textTheme.headline1,textAlign: TextAlign.center,),
              Text(sentence != null ? sentence! :" ",textAlign: TextAlign.center,),
            ],
          ),
        ),
      ),
    );
  }
}
