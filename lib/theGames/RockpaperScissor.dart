import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class RockPaperPage extends StatefulWidget {
  const RockPaperPage({super.key});

  @override
  State<RockPaperPage> createState() => _RockPaperPageState();
}

class _RockPaperPageState extends State<RockPaperPage> {
  @override
  IconData? iconInuser = null;
  IconData? iconInAI = null;
  List<IconData?> iconINAilist = [
    FontAwesomeIcons.handFist,
    Icons.description,
    CupertinoIcons.scissors
  ];
  bool forai = false;
  bool foruser = false;
  int AiScore = 0;
  int userScore = 0;
  var theChoice;
  bool started = false;
  int timeleft = 3;
  Timer? countdownTimer;
  void Randompicker () {
     final random = Random();
     iconInAI = iconINAilist[random.nextInt(iconINAilist.length)];

  }
  void dsThereAWinner() {
    if (userScore == 5){
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("You Win!"),
            content: Text("Congratulations, you reached 5 points first!"),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      userScore = 0;
      AiScore = 0;
      iconInuser = null;
      iconInAI = null;
    } else if (AiScore == 5) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("AI Wins!"),
            content: Text("The AI reached 5 points first. Better luck next time!"),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      userScore = 0;
      AiScore = 0;
      iconInuser = null;
      iconInAI = null;
    }
  }
  void scoreCalculator() {
    // Tie
    if (iconInuser == iconInAI) {
      return;
    }
    // User winning cases
    bool userWins =
        (iconInuser == FontAwesomeIcons.handFist && iconInAI == CupertinoIcons.scissors) || // Rock beats Scissors
            (iconInuser == Icons.description && iconInAI == FontAwesomeIcons.handFist) ||        // Paper beats Rock
            (iconInuser == CupertinoIcons.scissors && iconInAI == Icons.description);           // Scissors beats Paper

    if (userWins) {
      userScore++;
    } else {
      AiScore++;
    }
  }

  countAgain () {
    setState(() {
      started = false;
      timeleft = 3;
    });
  }
void StartTimer() {
  countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
    setState(() {
      if (timeleft > 0) {
        timeleft--;
      }
      else {
        setState(() {
          Randompicker();
          scoreCalculator();
          dsThereAWinner();
          started = false;
        });
        countdownTimer?.cancel();
      }
    });
  });
}

void dispose() {
  countdownTimer?.cancel();
  super.dispose();
}
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 50,
        title: const Text("Rock Paper Scissor "),
        centerTitle: true,


      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(10),
          child: Row(
            spacing: 5,
            children: [
              Text('you: '),
              Container(
                color: Colors.lightBlueAccent,
                    height: 17,
                    width: 30,
                child: Center(
                  child: Text(userScore.toString() , style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold
                  ),),
                ),
              ),
              Text('AI: '),
              Container(
                color: Colors.redAccent,
                height: 17,
                width: 30,
                child: Center(
                  child: Text(AiScore.toString() , style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold
                  ),),
                ),
              )
            ],

          )
          ),
          Padding(
              padding: EdgeInsets.only(top: 50),

              child: started ? Text(
                timeleft.toString(),
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold
                ),
              ):ElevatedButton(onPressed: () {
                setState(() {
                  started = true;
                  timeleft = 3;
                });
                StartTimer();
              }, child: Text('start'))
          ),
           Padding(padding: EdgeInsets.only(top: 50),
             child: Row(
               spacing: 50,
               children: [
                 Container(
                   margin: EdgeInsets.only(left: 50),
                   height: 100,
                   width:100,
                   color: Colors.blue,
                   child: Center(
                      child: Icon(
                        iconInuser,
                        size: 50,
                        color: Colors.white,),
                   ),
                 ),

                 Container(
                   margin: EdgeInsets.only(left: 50),
                   height: 100,
                   width:100,
                   color: Colors.red,
                   child: Center(
                     child: Icon(
                       iconInAI,
                       size: 50,
                       color: Colors.white,),
                   ),
                 ),
               ],
             )

           ),
          Padding(padding: EdgeInsets.only (top: 10 , left: 10, right: 10),
               child: GestureDetector(
                 onTap: () {
                   setState(() {
                     iconInuser = CupertinoIcons.scissors;
                     theChoice = 'Sicssor';
                     print(theChoice);
                   });
                 },
                 child: Container(
    height: 300,
    width: 400,
    decoration: BoxDecoration(
    color: Colors.greenAccent,
    borderRadius: BorderRadius.circular(20)
    ),
    child: Stack(
    //mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Positioned(
    left: 190,
    top: 0,
    child: GestureDetector(
      onTap: (){
        setState(() {
          iconInuser = Icons.description;
          theChoice = 'paper';
        });
        print(theChoice);
      },
       child:  Container(
          color: Colors.yellow,
          width: 201,
          height: 150,
          child: Center(
            child: Icon(
              Icons.description,
              size: 50,
              color: Colors.black,),
          ),
        )
    )

    ),
    Positioned(
    left: 0,
    child: GestureDetector(
      onTap: () {
         setState(() {
            iconInuser = FontAwesomeIcons.handFist;
           theChoice = 'rock';
         });
         print(theChoice);
      },
      child: Container(
        color: Colors.green,
        width: 190,
        height: 150,
        child: Center(
          child: Icon(
            FontAwesomeIcons.handFist,
            size: 50,
            color: Colors.black,),
        ),
      ),
    )

    ),
    Positioned(
    top: 200,
    left: 150,
    child: Icon(
    CupertinoIcons.scissors,
    size: 50,
    color: Colors.black,)
    )

    ],
    ),
    ),
               ),

               )
        ],
      ),
    );
  }
}
