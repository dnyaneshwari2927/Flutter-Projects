
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizApp() ,
    );
  }
}
        class QuizApp extends StatefulWidget{
          const QuizApp({super.key});

          @override
          State createState() => _QuizAppState();
        }
        class _QuizAppState extends State{
          List<Map> allQuestions =[
            {
              "questions":"who is the founder of Microsoft?",
              "options":["Steve Jobs","Bill Gates","Lary Page","Elon Musk"],
              "correctAnswer":1
            },{
              "questions":"who is the founder of Google?",
              "options":["Steve Jobs","Bill Gates","Lary Page","Elon Musk"],
              "correctAnswer":2
            },{
              "questions":"who is the founder of SpaceX?",
              "options":["Steve Jobs","Bill Gates","Lary Page","Elon Musk"],
              "correctAnswer":3
            },{
              "questions":"who is the founder of Apple?",
              "options":["Steve Jobs","Bill Gates","Lary Page","Elon Musk"],
              "correctAnswer":0
            },{
              "questions":"who is the founder of Microsoft?",
              "options":["Steve Jobs","Mark Zuckerberg","Lary Page","Elon Musk"],
              "correctAnswer":1
            },
          ];
        int currentQuestionIndex = 0;
        int selectedAnswerIndex = -1;
        int ansscore = 0;
        WidgetStateProperty<Color?> checkAnswer(int answerindex){
          if(selectedAnswerIndex != -1){
            if(answerindex == allQuestions[currentQuestionIndex]["correctAnswer"]){
              if(selectedAnswerIndex == allQuestions[currentQuestionIndex]["correctAnswer"]){
                    ansscore++;
                     return const WidgetStatePropertyAll(Colors.green);
                  }else{
              
                     return const WidgetStatePropertyAll(Colors.green);
                  }
            }
            else if(selectedAnswerIndex ==  answerindex){
              return const WidgetStatePropertyAll(Colors.red);
            }else{
              return const WidgetStatePropertyAll(null);
            }
            }else{
              return const WidgetStatePropertyAll(null);
            }
          }
        bool questionPage = true;

        @override
        Widget build(BuildContext context){
          return isQuestionScreen();
        }
        Scaffold isQuestionScreen(){
          if(questionPage == true){
            return Scaffold(
              backgroundColor: const Color.fromARGB(255, 93, 145, 185),
            appBar: AppBar(
              title : const Text(
                "Quiz App",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Colors.amber,
                ),
              ),
              centerTitle: true,
              backgroundColor:const  Color.fromARGB(255, 14, 33, 177),
            ),
            body: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 130,
                    ),
                
                Text(
                  "Question : ${currentQuestionIndex + 1}/${allQuestions.length}",
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700
                  ),
                ),
              ],
              ),
              const SizedBox(
                height:50,
              ),
              SizedBox(
                width: 380,
                height: 50,
                child: Text(
                  allQuestions[currentQuestionIndex]["questions"],
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54,
                  ),
                ),
              ),
              const SizedBox(
                height:50,
              ),
              SizedBox(
                width: 380,
                height: 50,
                child: ElevatedButton(
                  style:  ButtonStyle(
                    backgroundColor: checkAnswer(0),
                  ),
                  onPressed: (){
                    if (selectedAnswerIndex == -1){
                      selectedAnswerIndex = 0;
                      setState(() {
                        
                      });
                    }
                  },
                  child: Text(
                    allQuestions[currentQuestionIndex]['options'][0],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
            ),
            const SizedBox(
                height:50,
              ),
              SizedBox(
                width: 380,
                height: 50,
                child: ElevatedButton(
                  style:  ButtonStyle(
                    backgroundColor: checkAnswer(1),
                  ),
                  onPressed: (){
                    if (selectedAnswerIndex == -1){
                      selectedAnswerIndex = 1;
                      setState(() {
                        
                      });
                    }
                  },
                  child: Text(
                    allQuestions[currentQuestionIndex]['options'][1],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
            ),
            const SizedBox(
                height:50,
              ),
              SizedBox(
                width: 380,
                height: 50,
                child: ElevatedButton(
                   style:  ButtonStyle(
                    backgroundColor: checkAnswer(2),
                  ),
                  onPressed: (){
                    if (selectedAnswerIndex == -1){
                      selectedAnswerIndex = 2;
                      setState(() {
                        
                      });
                    }
                  },
                  child: Text(
                    allQuestions[currentQuestionIndex]['options'][2],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
            ),
            const SizedBox(
                height:50,
              ),
              SizedBox(
                width: 380,
                height: 50,
                child: ElevatedButton(
                  style:  ButtonStyle(
                    backgroundColor: checkAnswer(3),
                  ),
                  onPressed: (){
                    if (selectedAnswerIndex == -1){
                      selectedAnswerIndex = 3;
                      setState(() {
                        
                      });
                    }
                  },
                  child: Text(
                    allQuestions[currentQuestionIndex]['options'][3],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
            ),
           ]
          ),
          floatingActionButton:FloatingActionButton(
            onPressed: () {
              if(selectedAnswerIndex != -1){
                if(currentQuestionIndex<allQuestions.length-1){
                  
                  currentQuestionIndex++;
                }else{
                  questionPage = false;
                }
              
                selectedAnswerIndex = -1;
                setState(() {});
              }
          },
            backgroundColor:const Color.fromARGB(255, 14, 33, 177),
            child: const Icon(
              Icons.forward,
              color: Colors.orangeAccent,
            ),
          ) ,
          );
        }else{
          return Scaffold(
             backgroundColor:const Color.fromARGB(255, 93, 145, 185),
            appBar: AppBar(
              title: const Text(
                "Quiz Result",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(255, 4, 230, 151),
                ),
              ),
              centerTitle: true,
              backgroundColor:const Color.fromARGB(255, 14, 33, 177),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network("https://tse4.mm.bing.net/th?id=OIP.2hn0DR3jaX06-3Ha2r7M4wHaI5&pid=Api&P=0&h=180"),
                  const SizedBox(height : 30),
                  const Text(
                    "CONGRATULATIONS",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                  "Score : $ansscore/${allQuestions.length}",
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700
                  ),
                ),
                  
                ],
              ),
              
            ),
            floatingActionButton:FloatingActionButton(
            onPressed: () {
                 currentQuestionIndex = 0;
                 selectedAnswerIndex = -1;
                 ansscore = 0;
                  questionPage = true;
                
              
                setState(() {});
              
          },
            backgroundColor:const Color.fromARGB(255, 14, 33, 177),
            child: const Text("reset",
            style: TextStyle(
              color: Colors.amber,
              fontSize: 12,
              fontWeight: FontWeight.w500
            ),
            ),
          ) 
          );
        }
        }
        }
