import 'package:flutter/material.dart';

class info extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Body")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "BMI Categories",
                        style: TextStyle(fontWeight: FontWeight.bold)
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 25),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Less than 18.5",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
                            ),
                          ],
                        ),
                  
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "you're underweight.",
                              style: TextStyle(fontSize: 20),
                            ),                              
                          ],
                        ),
                      ],
                    )
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 25),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "18.5 to 24.9",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
                            ),
                          ],
                        ),
                  
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "you're normal.",
                              style: TextStyle(fontSize: 20),
                            ),                              
                          ],
                        ),
                      ],
                    )
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 25),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "25 to 29.9",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
                            ),
                          ],
                        ),
                  
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "you're overweight.",
                              style: TextStyle(fontSize: 20),
                            ),                              
                          ],
                        ),
                      ],
                    )
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 25),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "30 or more",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
                            ),
                          ],
                        ),
                  
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "obesity.",
                              style: TextStyle(fontSize: 20),
                            ),                              
                          ],
                        ),
                      ],
                    )
                  ),

                ],
              )
            )
          ],
        ),
      ),
    );
  }
}