import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app_project/db/quizdata_db.dart';
import 'package:quiz_app_project/views/score_page.dart';
import 'package:lottie/lottie.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool ifcorrect = false;
  int queNo = 0;
  int? value;
  int score = 0;
  int? ans;
  int queCount = 0;
  int dura = 10;
  final CountDownController _controller = CountDownController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/image/26539478_7234229.jpg'),
                fit: BoxFit.cover)),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //question
              children: [
                CircularCountDownTimer(
                  controller: _controller,
                  width: 90,
                  height: 90,
                  duration: dura,
                  initialDuration: 0,
                  fillColor: Colors.brown,
                  ringColor: Colors.white,
                  backgroundColor: Colors.grey[400],
                  backgroundGradient: const LinearGradient(
                    colors: [Colors.red, Colors.green],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                  textStyle: GoogleFonts.sofiaSans(
                    fontSize: 27,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                  autoStart: true,
                  onComplete: () {
                    _controller.restart();
                    if (queNo > 9) {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return ScorePage(score: score);
                        },
                      ));
                    }
                  },
                  onStart: () {
                    value = 5;
                    queNo++;
                    ifcorrect = false;
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 360,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Questions No:-${queNo + 1}',
                          style: GoogleFonts.sofiaSans(
                            fontSize: 27,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          QuizDb.quizData[queNo]['question'],
                          textAlign: TextAlign.left,
                          style: GoogleFonts.sofiaSans(
                            fontSize: 27,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //answer
                SizedBox(
                  height: 400,
                  child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 7),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              value = index;
                              value == QuizDb.quizData[queNo]['answer']
                                  ? score++
                                  : print('hi');
                            });
                          },
                          child: Container(
                            width: 360,
                            height: 70,
                            decoration: BoxDecoration(
                              color: value == index
                                  ? value == QuizDb.quizData[queNo]['answer']
                                      ? Colors.green
                                      : Colors.red
                                  : const Color.fromARGB(230, 189, 189, 189),
                              borderRadius: BorderRadius.circular(17),
                            ),
                            child: Center(
                              child: Text(
                                QuizDb.quizData[queNo]['options'][index],
                                style: GoogleFonts.sofiaSans(
                                  fontSize: 27,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Positioned(
              top: 300,
              height: 230,
              child: value == QuizDb.quizData[queNo]['answer']
                  ? LottieBuilder.asset(
                      'assets/lottie_animation/animation_lnpxnr4u.json')
                  : const Text(''),
            ),
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          value = 5;
          queCount++;
          setState(() {});
          if (queCount > 9) {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return ScorePage(
                  score: score,
                );
              },
            ));
          }

          _controller.restart();
        },
        child: Container(
          height: 50,
          color: const Color.fromARGB(255, 102, 182, 247),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Next'),
              Icon(Icons.arrow_forward_sharp),
            ],
          ),
        ),
      ),
    );
  }
}
