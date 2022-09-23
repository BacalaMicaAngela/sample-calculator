import 'package:flutter/material.dart';
import 'buttonwid.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> button = [
    "C","DEL","/","*","7","8","9","-","4","5","6","+", "1", "2","3", ".","00","0","="
  ];

  void expression(){
    Parser p= Parser();
    Expression exp = p.parse(userInput);
    ContextModel cm = ContextModel();
    var evalue = exp.evaluate(EvaluationType.REAL, cm);
    userInput = evalue.toString();

  }

  isOperator(String x){
    if(x == "+" || x == "-" || x == "*" || x == "/" || x == "="){
      return true;
    }
    return false;
  }

  var userInput ="";
  var userOutput ="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 85.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Text(
                        userInput,
                        style: TextStyle(color: Colors.black, fontSize: 35),
                      ),
                    ),
                    Divider(
                      indent: 25,
                      endIndent: 25,
                      thickness: 4,
                      color: Colors.black87,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text(userOutput,style: TextStyle(
                          color: Colors.black,fontSize: 40
                      ),),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                width: 350,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemCount: button.length,
                  itemBuilder: (BuildContext context, int index) {
                    if(index == 0){
                      return ButtonWid(
                        onPressed: (){
                          setState(() {
                            userInput = "";
                          });
                        },
                        buttonColor: Colors.orangeAccent,
                        buttonText: button[index],
                        buttonTextColor: Colors.black87,
                      );
                    } else if(index == 1){
                      return ButtonWid(
                        onPressed: (){
                          setState(() {
                            userInput = userInput.substring(0,userInput.length - 1);
                          });
                        },
                        buttonColor: Colors.orangeAccent,
                        buttonText: button[index],
                        buttonTextColor: Colors.black87,
                      );
                    } else if(index == button.length - 1){
                      return ButtonWid(
                        onPressed: (){
                          setState(() {
                            expression();
                          });
                        },
                        buttonColor: Colors.lime,
                        buttonText: button[index],
                        buttonTextColor: Colors.black87,
                      );
                    } else {
                      return ButtonWid(
                        onPressed: (){
                          setState(() {
                            userInput = userInput + button[index];
                          });
                        },
                        buttonColor:  isOperator(button[index])
                            ? Colors.lime
                            : Colors.greenAccent,
                        buttonText: button[index],
                        buttonTextColor: Colors.black87,
                      );
                    }
                  },

                ),
              ),
            )
          ],
        ));
  }
}
