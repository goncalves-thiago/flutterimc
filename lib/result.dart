import 'package:flutter/material.dart';
import 'info.dart';

class result extends StatelessWidget {

  final double imc;
  final double height;
  final double weight;
  final String gender;
  String status = "";
  double colorMale = 1;
  double colorFemale = 1;

  result({super.key, required this.imc, required this.gender, required this.weight, required this.height});

  @override
  Widget build(BuildContext context) {
    if(gender == "male"){
      colorFemale = 0.3;
    }   
    else {
      colorMale = 0.3;
    }


    if(imc < 18.5) {
      status = "Underweight";
    }
    else if(imc < 25) {
      status = "Normal";
    }
    else if(imc < 30) {
      status = "Overweight";
    }
    else {
      status = "Obesity";
    }


    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Body'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "BMI Calculator",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.info),
                  onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => info(),
                        )
                    )
                  },
                ),
            ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 30, bottom: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Opacity(
                        opacity: colorMale,
                        child: const CircleAvatar(
                          radius: 60,
                          backgroundImage: AssetImage('./assets/male.jpg'),
                          backgroundColor: Colors.transparent,
                        ),
                      ),

                      Opacity(
                        opacity: colorMale,
                        child: const Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text("Male"),
                          ),
                        ),
                      ),
                    ],
                  )
                ),

                Container(
                  padding: const EdgeInsets.only(top: 30, bottom: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Opacity(
                        opacity: colorFemale,
                        child: const CircleAvatar(
                          radius: 60,
                          backgroundImage: AssetImage('./assets/female.jpg'),
                          backgroundColor: Colors.transparent,
                        ),
                      ),

                      Opacity(
                        opacity: colorFemale,
                        child: const Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text("Female"),
                          ),
                        ),
                      ),
                    ],
                  )
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Row(children: [
                        Text("Your weight "),
                        Text("(kg)", style: TextStyle(fontWeight: FontWeight.bold)),
                      ],),
                       SizedBox(
                        width: 45,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            weight.toStringAsFixed(0),
                            style: const TextStyle(fontSize: 25, color: Colors.black),
                          ),
                        )
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Row(children: [
                        Text("Your height "),
                        Text("(cm)", style: TextStyle(fontWeight: FontWeight.bold),),
                      ],),
                      
                      SizedBox(
                        width: 45,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                          height.toStringAsFixed(0),
                          style: const TextStyle(fontSize: 25, color: Colors.black)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Container(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Your BMI"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: Text(
                        imc.toStringAsFixed(1),
                        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        status,
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                    ],
                  ),
                ],
              )
            ),

            Container(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => {Navigator.pop(context)},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.blue,
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: const Size(290, 60)
                    ),
                    child: const Text(
                      "Calculate BMI again",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                  ),
                ],
              ),
            ),
          ]
        ),
      )
    );
  }
}