

import 'screens/home.dart';
import 'screens/inputs.dart';
import 'screens/outputs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
void main(){
  runApp(fitnessCalculator());

}
class fitnessCalculator extends StatelessWidget{

  @override
  Widget build(BuildContext context) {


    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);



      return ScreenUtilInit(
        designSize: Size(360, 690),
        builder: () => MaterialApp(

          debugShowCheckedModeBanner: false,
          title: 'Flutter_ScreenUtil',
          routes:<String,WidgetBuilder>{

            //all screens
            '/home':(BuildContext context)=>new Home(),
            '/inputs':(BuildContext context)=>new Inputs(),
            '/outputs':(BuildContext context)=>new outputs(caloriesR: 0,carbR: 0,fatsR: 0,proteinFromR: 0,proteinToR: 0,waterR: 0),


          } ,
          theme: ThemeData(
            primarySwatch: Colors.blue,

          ),
          home: Home(),
        ),
      );
    }
  }

