import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BMI",
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: _homepage(),
    );
  }
}

class _homepage extends StatefulWidget {
  @override
  State<_homepage> createState() => homepageState();
}

class homepageState extends State<_homepage> {
  @override
  var wtC = TextEditingController();
  var htC = TextEditingController();
  var itC = TextEditingController();
  var result = "";
  var bgc;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text("Your BMI APP"),
      ),
      body: Container(
        color: bgc,
        child: Center(
          child: Container(
            width: 300,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("BMI",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w600)),
              SizedBox(
                height: 11,
              ),
              TextField(
                controller: wtC,
                decoration: InputDecoration(
                    label: Text("Enter your Weight in kg"),
                    prefixIcon: Icon(Icons.line_weight_outlined)),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(
                height: 11,
              ),
              TextField(
                controller: htC,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.height),
                  label: Text("Enter your Height in Feet"),
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(
                height: 11,
              ),
              TextField(
                controller: itC,
                decoration: InputDecoration(
                    label: Text("Enter your Height in Inch"),
                    prefixIcon: Icon(Icons.height)),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(
                height: 21,
              ),
              ElevatedButton(
                  onPressed: () {
                    var wt = wtC.text.toString();
                    var ht = htC.text.toString();
                    var inch = itC.text.toString();
                    if (wt != "" && ht != "" && inch != "") {
                      int w = int.parse(wt);
                      int h = int.parse(ht);
                      int i = int.parse(inch);

                      var ti = (h * 12) + i;
                      var tcm = ti * 2.54;
                      var tm = tcm / 100;

                      var bmi = w / (tm * tm);
                      var msg = "";
                      if (bmi > 25) {
                        msg = "You are OverWeight";
                        bgc = Colors.red.shade400;
                      } else if (bmi < 18) {
                        msg = "You are UnderWeight";
                        bgc = Colors.orange.shade300;
                      } else {
                        msg = "You are Healthy";
                        bgc = Colors.green.shade300;
                      }

                      result = " $msg \n Your BMI is ${bmi.toStringAsFixed(2)}";

                      setState(() {});
                    } else {
                      result = "Please fill all the required blanks";
                      setState(() {});
                    }
                  },
                  child: Text(
                    "Submit",
                  )),
              SizedBox(
                height: 11,
              ),
              Text(
                result,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
