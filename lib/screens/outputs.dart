
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';
class outputs extends StatefulWidget {
  outputs(
      {required this.caloriesR,
      required this.carbR,
      required this.fatsR,
      required this.proteinFromR,
      required this.proteinToR,
      required this.waterR});

  late double caloriesR, carbR, fatsR, proteinFromR, proteinToR, waterR;

  @override
  _outputsState createState() {
    //caloriesR,carbR,fatsR,proteinToR,proteinFromR,waterR
    return new _outputsState(
        caloriesR: caloriesR,
        waterR: waterR,
        proteinFromR: proteinFromR,
        proteinToR: proteinToR,
        fatsR: fatsR,
        carbR: carbR);
  }
}

class _outputsState extends State<outputs> {
  late double caloriesR, carbR, fatsR, proteinFromR, proteinToR, waterR;

  _outputsState(
      {required this.caloriesR,
        required  this.fatsR,
        required this.proteinFromR,
        required  this.proteinToR,
        required  this.carbR,
        required  this.waterR});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: background,
      body: new Container(
        padding: new EdgeInsets.fromLTRB(screenWidth * 0.10,
            screenHeight * 0.06, screenWidth * 0.10, screenHeight * 0.10),
        width: screenWidth,
        height: screenHeight,
        child: new Center(child: LayoutBuilder(builder: (context, constrains) {
          double height = constrains.maxHeight;
          double width = constrains.maxWidth;
          return new Container(
            child: new Column(
              children: [
                Text(
                  "Now That's How Much\nYour Body Needs Daily" + '',
                  style: new TextStyle(
                      color: Colors.white, fontSize: ScreenUtil().setSp(20)),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                new Row(
                  children: [
                    new CircularPercentIndicator(
                      radius: ScreenUtil().setWidth(80),
                      progressColor: Color.fromARGB(255, 249, 140, 60),
                      lineWidth: ScreenUtil().setWidth(5),
                      center: Text(
                        '${fatsR.toStringAsFixed(2)}\ngram',textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(15)),
                      ),
                      footer: Text(
                        'Fats',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(20),
                            height: 2),
                      ),
                      percent: 1,
                      animation: true,
                      animationDuration: 1200,
                    ),
                    //********************************Fats***************************
                    SizedBox(
                      width: width * 0.408,
                    ),
                    new CircularPercentIndicator(
                      radius: ScreenUtil().setWidth(80),
                      progressColor: Color.fromARGB(255, 0, 185, 68),
                      lineWidth: ScreenUtil().setWidth(5),
                      center: Text(
                        '${((proteinFromR + proteinToR) / 2).toStringAsFixed(2)}\ngram',textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(15)),
                      ),
                      footer: Text(
                        'Proteins',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(20),
                            height: 2),
                      ),
                      percent: 1,
                      animation: true,
                      animationDuration: 1200,
                    )
                    //********************************Protein********************************
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(16),
                ),
                new CircularPercentIndicator(
                  radius: ScreenUtil().setWidth(80),
                  progressColor: Color.fromARGB(255, 179, 47, 47),
                  lineWidth: ScreenUtil().setWidth(5),
                  center: Text(
                    '${caloriesR.toStringAsFixed(2)}\ncalorie',textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontSize: ScreenUtil().setSp(15)),
                  ),
                  footer: Text(
                    'Calories',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(20),
                        height: 2),
                  ),
                  percent: 1,
                  animation: true,
                  animationDuration: 1200,
                ),
                //********************************calories********************************
                SizedBox(
                 
                  height: ScreenUtil().setHeight(16),
                ),
                new Row(
                  children: [
                    new CircularPercentIndicator(
                      radius: ScreenUtil().setWidth(80),
                      progressColor: Color.fromARGB(255, 0, 162, 255),
                      lineWidth: ScreenUtil().setWidth(5),
                      center: Text(
                        '${waterR.toStringAsFixed(2)}\nliter',textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(15)),
                      ),
                      footer: Text(
                        'Water',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(20),
                            height: 2),
                      ),
                      percent: 1,
                      animation: true,
                      animationDuration: 1200,
                    ),
                    //********************************water********************************
                    SizedBox(
                      width: width * 0.408,
                    ),
                    new CircularPercentIndicator(
                      radius: ScreenUtil().setWidth(80),
                      progressColor: Color.fromARGB(255, 113, 88, 179),
                      lineWidth: ScreenUtil().setWidth(5),
                      center: Text(
                        '${carbR.toStringAsFixed(2)}\ngram',textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(15)),
                      ),
                      footer: Text(
                        'Carb',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(20),
                            height: 2),
                      ),
                      percent: 1,
                      animation: true,
                      animationDuration: 1200,
                    )
                    //********************************carb********************************
                  ],
                )
              ],
            ),
          );
        })),
      ),
    );
  }
}
