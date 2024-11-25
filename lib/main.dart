import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'info.dart';
import 'result.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "BMI Calculator",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String gender = "male";
  double colorMale = 1;
  double colorFemale = 0.3;
  double weight = 80;
  double height = 175;
  double imc = 0;

  void calcularImc() {
    if ((weight == 0) || (height == 0)) {
      return;
    } else {
      imc = weight / ((height/100) * (height/100));
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => result(imc: imc, gender: gender, weight: weight, height: height),
        )
      );      
    }     
  }

  @override
  Widget build(BuildContext context) {
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
                GestureDetector(
                  onTap: () => setState(() {
                    gender = "male";
                    colorMale = 1;
                    colorFemale = 0.3;
                  }),
                  child: Container(
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
                ),

                GestureDetector(
                  onTap: () => setState(() {
                    gender = "female";
                    colorFemale = 1;
                    colorMale = 0.3;
                  }),
                  child: Container(
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
                )
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
                        child: TextField(
                          style: const TextStyle(
                            fontSize: 25,
                          ),
                          decoration:  const InputDecoration(
                            border: InputBorder.none,
                            hintText: '80',
                            hintStyle: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                            )
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(3),
                          ],
                          onChanged: (value) {
                            setState(() {
                              weight = double.parse(value);
                            });                            
                          },                          
                        ),
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
                        child: TextField(
                          style: const TextStyle(
                            fontSize: 25,
                          ),
                          decoration:  const InputDecoration(
                            border: InputBorder.none,
                            hintText: '175',
                            hintStyle: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                            )
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(3),
                          ],
                          onChanged: (value) {
                            setState(() {
                              height = double.parse(value);
                            });                            
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            Container(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => {
                      calcularImc()

                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: const Size(290, 60)
                    ),
                    child: const Text("Calculate your BMI"),
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