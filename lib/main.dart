import 'dart:math';

import 'package:flutter/material.dart';

 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
     title: 'Omni Calculator',
     home: Home(),
    );
  }}
   class Home extends StatefulWidget{
     @override
     HomeState createState() => HomeState();
   }
     class HomeState extends State<Home>{
       final ageController = TextEditingController();
       final heightController = TextEditingController();
       final weightController = TextEditingController();
       final waistCController = TextEditingController();

       double absi;
       String message = 'Enter Your Informations';

       void calculate(){
         final double age = double.parse(ageController.value.text);
         final double height = double.tryParse(heightController.value.text);
         final double weight = double.tryParse(weightController.value.text);
         final double waistC = double.tryParse(waistCController.value.text);

        if (height<=0 || weight <=0){
          setState(() {
            message = 'Your height and weight only positive numbers';
          });
          return;
  
       }setState((){
         double bmi = weight / (height * height);
         double bmis = pow(bmi, 2 / 3);
         double heights = pow(height, 1 / 2);
         absi = waistC / (bmis * heights);
       });
     }
      @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Center(
          child: Container(
            width: 320,
            child: Card(
              color: Colors.white,
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(labelText: 'Age (years old)'),
                      controller: ageController,
                    ),
                    TextField(
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(labelText: 'Height (m)'),
                      controller: heightController,
                    ),
                    TextField(
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(labelText: 'Weight (kg)'),
                      controller: weightController,
                    ),
                    TextField(
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      decoration:
                          InputDecoration(labelText: 'Waist Circumference (m)'),
                      controller: waistCController,
                    ),
                    ElevatedButton(
                      onPressed: calculate,
                      child: Text('Calculate'),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Text(
                        absi == null ? 'No Result' : absi.toStringAsFixed(4),
                        style: TextStyle(fontSize: 50),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Text(
                        message,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
