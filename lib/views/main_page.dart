import 'package:flutter/material.dart';
import 'package:quiz_app_project/db/quizdata_db.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int queNo = 0;
  int? value;
  int score = 0;
  int? ans;
  int queCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/image/Android Large - 10.png'),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //question
            children: [
              Container(
                width: 360,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  children: [
                    Text(
                      'Questions',
                      style: TextStyle(fontSize: 27),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      QuizDb.quizData[queNo]['question'],
                      style: TextStyle(fontSize: 27),
                    ),
                  ],
                ),
              ),
              //answer
              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            value = index;
                            value == QuizDb.quizData[queNo]['answer'];
                            print(value);
                            //     ? score++
                            //     : print(value);
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
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(17),
                          ),
                          child: Center(
                            child: Text(
                              QuizDb.quizData[queNo]['options'][index],
                              style: const TextStyle(
                                fontSize: 23,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          setState(() {
            queNo++;
          });
        },
        child: Container(
          height: 50,
          color: const Color.fromARGB(255, 102, 182, 247),
          child: Row(
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
