import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app_project/db/quizdata_db.dart';
import 'package:quiz_app_project/views/main_page.dart';

class ScorePage extends StatelessWidget {
  ScorePage({super.key, required this.score});

  final int score;

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
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(22),
                      child: Container(
                        width: 300,
                        height: 400,
                        color: const Color.fromARGB(255, 69, 146, 72),
                        child: Column(
                          children: [
                            Text(
                              'Score',
                              style: GoogleFonts.sofiaSans(
                                color: Colors.lime,
                                fontSize: 53,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Divider(
                              thickness: 2,
                              endIndent: 20,
                              indent: 20,
                              height: 30,
                            ),
                            Text(
                              'Total Point :-$score',
                              style: GoogleFonts.sofiaSans(
                                color: Colors.orangeAccent,
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Total Point Lose:-${(QuizDb.quizData.length) - score}',
                              style: GoogleFonts.sofiaSans(
                                color: Colors.lightBlueAccent,
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              'OverAll',
                              style: GoogleFonts.sofiaSans(
                                color: Colors.lime,
                                fontSize: 43,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Divider(
                              thickness: 2,
                              endIndent: 20,
                              indent: 20,
                              height: 40,
                            ),
                            Text(
                              (score < 7)
                                  ? (score < 5)
                                      ? 'Need to Improve😅'
                                      : 'Average👍'
                                  : 'Good😎',
                              style: GoogleFonts.sofiaSans(
                                fontSize: 32,
                                color: (score < 7)
                                    ? (score < 5)
                                        ? Colors.red
                                        : Colors.limeAccent
                                    : const Color.fromARGB(255, 57, 255, 63),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 330, top: 30),
              child: IconButton(
                  onPressed: () {
                    print('hi');
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const MainPage();
                      },
                    ));
                  },
                  icon: const Icon(
                    Icons.restart_alt_outlined,
                    size: 62,
                    color: Colors.black,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
