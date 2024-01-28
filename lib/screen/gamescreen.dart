import 'package:flutter/material.dart';

String alphabet = "abcdefghijklmnopqrstuvwxyz";

class gamescreen extends StatefulWidget {
  gamescreen(
      {super.key, required this.index, required this.word, required this.hint});
  int index;
  String word;
  String hint;
  @override
  State<gamescreen> createState() =>
      _gamescreenState(index: index, hint: hint, word: word);
}

class _gamescreenState extends State<gamescreen> {
  _gamescreenState(
      {required this.index, required this.word, required this.hint});
  List<String> guessedword = [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    int i;
    for (i = 0; i < word.length; i++) {
      guessedword[i] = "-";
    }
    for (int j = i; j < guessedword.length; j++) {
      guessedword[j] = "";
    }
  }

  String correctans = '';
  bool showhint = false;
  int index;
  String word;
  String hint;
  String display="";

  int iscorrect(var a) {
    for (int i = 0; i < word.length; i++) {
      if (word[i] == a) {
        return i;
      }
    }
    return -1;
  }

  int i = 0;
  bool rightword() {
    for (int i = 0; i < word.length; i++) {
      if (word[i] != guessedword[i]) {
        return false;
      }
    }
    return true;
  }

  void submit(var input) {
    if (iscorrect(input) != -1) {
      setState(() {
        guessedword[iscorrect(input)] = input;
        if (rightword()) {
          setState(() {
            i = 7;display="you won";
          });
        }
      });
    } else {
      setState(
        () {
          i++;
          if (i == 4) {
            correctans = "correct answer: $word";
            i = 4;
            display="you lose";
            return;
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.fill,
              height: double.infinity,
            ),
            SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Image.asset('assets/images/$i.png', height: 170),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            showhint = true;
                          });
                        },
                        icon: Icon(
                          Icons.lightbulb,
                          color: Colors.yellow,
                          size: 30,
                        ),
                      ),
                      showhint
                          ? Text(
                              softWrap: true,
                              hint,
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            )
                          : Text('')
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    correctans,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 80),
                    child: Container(
                      height: 70,
                      child: Expanded(
                        child: ListView.builder(
                            itemBuilder: (context, index) {
                              return Text(
                                guessedword[index].toString(),
                                style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.white,
                                ),
                              );
                            },
                            scrollDirection: Axis.horizontal,
                            itemCount: guessedword.length),
                      ),
                    ),
                  ),
                  Text(display,style: TextStyle(color: Colors.white,fontSize: 25),),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 6,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                i == 4 ? null : submit(alphabet[index]);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 2),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    alphabet[index],
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: alphabet.length),
                    ),
                  ),SizedBox(height: 20,)
                ],

              ),
            ),

          ],
        ),
      ),
    );
  }
}
