
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fitnessCalculator/screens/outputs.dart';
import 'home.dart';

import 'package:auto_size_text/auto_size_text.dart';

class Inputs extends StatefulWidget {
  @override
  _inputState createState() {
    return new _inputState();
  }
}

class _inputState extends State {



  _showAlertDialog(String tilte, String content) {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: new Text(tilte),
              content: new Text(content),
              actions: <Widget>[
                ElevatedButton(
                  child: Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }

  
  //styles


  TextStyle labelTextStyle =new TextStyle(
      color: Colors.white,
      fontSize: ScreenUtil().setSp(18));
  
  TextStyle _hintStyle=new TextStyle(
      color: Colors.white24,
      fontSize: ScreenUtil().setSp(15));

//controllers of text fields
  final age = TextEditingController();
  final uheight = TextEditingController();
  final weight = TextEditingController();

//init values of menus
  var selectedActivity = 1.55;
  var cal_gender_difference = -5.0;

//lists of items of menus
  //Gender items list
  List<DropdownMenuItem<double>> genders = [
    DropdownMenuItem(
      child: new Text('Male'),
      value: -5.0,
    ),
    DropdownMenuItem(
      child: new Text('Female'),
      value: 161.0,
    ),
  ];

  // activity levels
  List<DropdownMenuItem<double>> activityLevels = [
    DropdownMenuItem(child: new Text('Low'), value: 1.2),
    DropdownMenuItem(
      child: new Text('Neutral'),
      value: 1.55,
    ),
    DropdownMenuItem(
      child: new Text('High'),
      value: 1.725,
    ),
    DropdownMenuItem(
      child: new AutoSizeText('very high'),
      value: 1.9,
    ),
  ];

//results
  late double calories;
  late double carb;
  late double water;
  late double proteinFrom;
  late double proteinTo;
  late double fats;

  //calculates
  void calculate() {
    setState(() {
      calories = (((10 * double.parse(weight.text)) +
              (6.25 * double.parse(uheight.text)) -
              (5 * double.parse(age.text)) -
              cal_gender_difference) *
          selectedActivity);
      /////
      fats = calories / 45;
      /////
      carb = (calories * .5) / 4;
      /////
      proteinFrom = 2.2 * (double.parse(weight.text));
      /////
      proteinTo = 0.8 * (double.parse(weight.text));
      /////
      water = ((double.parse(weight.text) / 0.4536) * (2 / 3)) * 0.0295735296;
    });
  }

  void pushResults() {
    setState(() {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => new outputs(
                  caloriesR: calories,
                  waterR: water,
                  proteinFromR: proteinFrom,
                  proteinToR: proteinTo,
                  fatsR: fats,
                  carbR: carb)));
    });
  }

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final node = FocusScope.of(context);
    return Scaffold(

        resizeToAvoidBottomInset: false,
        body: Container(
          color: background,
          width: screenWidth,
          height: screenHeight,
          padding: new EdgeInsets.fromLTRB(screenWidth * 0.05,
              screenHeight * 0.08, screenWidth * 0.05, screenHeight * 0.05),
          child: Center(
            child: LayoutBuilder(
              builder: (context, constrains) {
                double height = constrains.maxHeight;
                double width = constrains.maxWidth;
                return new Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      Text(
                        ' Fill in the following information',
                        style: new TextStyle(
                            fontSize: ScreenUtil().setSp(20),
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      new TextField(
                        //Age
                        style: new TextStyle(color: Colors.white),
                        controller: age,
                          autofocus: false,
                          onEditingComplete: () => node.nextFocus(),
                        textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                        maxLength: 2,
                        decoration: new InputDecoration(
                            labelText: 'Age',
                            hintText: 'Enter your age',
                            hintStyle: _hintStyle,
                            labelStyle: labelTextStyle,
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Colors.white))),
                      ),
                      //Age
                      SizedBox(
                        height: height * 0.01,
                      ),
                      new TextField(
                        controller: uheight,
                        autofocus: false,
                          onEditingComplete: () => node.nextFocus(),
                        textInputAction: TextInputAction.next,

                        style: new TextStyle(color: Colors.white),
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                        decoration: new InputDecoration(
                            labelText: 'Height',
                            hintText: 'Height (cm)',
                            hintStyle: _hintStyle,
                            labelStyle:labelTextStyle,
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Colors.white))),
                      ),
                      //height
                      SizedBox(
                        height: height * 0.01,
                      ),
                      new TextField(
                        style: new TextStyle(color: Colors.white),
                        controller: weight,
                        autofocus: false,

                onSubmitted: (_) => node.unfocus()
,
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                        decoration: new InputDecoration(
                            labelText: 'Weight',
                            hintText: 'Weight(KG)',
                            hintStyle: _hintStyle,
                            labelStyle: labelTextStyle,
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Colors.white))),
                      ),
                      //weight
                      SizedBox(
                        height: height * 0.05,
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            textDirection: TextDirection.ltr,
                            children: [
                              Text(
                                'Gender',
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(18),
                                    color: Colors.white),
                                textAlign: TextAlign.left,
                                textDirection: TextDirection.ltr,
                              ),
                              new DropdownButton(
                                hint: AutoSizeText(
                                  'Gender',
                                  style: TextStyle(color: Colors.blueAccent),
                                ),
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: ScreenUtil().setSp(18)),
                                focusColor: Colors.red,
                                items: genders,
                                value: cal_gender_difference,
                                onChanged: (newValue) {
                                  setState(() {
                                    cal_gender_difference = newValue as double;
                                  });
                                },
                              )
                            ],
                          ),
                          SizedBox(
                            width: width * 0.25,
                          ),
                          new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            textDirection: TextDirection.ltr,
                            children: [
                              Text(
                                'Daily Activity Level',
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(18),
                                  color: Colors.white,
                                ),
                                textDirection: TextDirection.ltr,
                              ),
                              new DropdownButton(
                                hint: AutoSizeText(
                                  'Daily Activity',
                                  style: TextStyle(color: Colors.blueAccent),
                                ),
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: ScreenUtil().setSp(18)),
                                focusColor: Colors.red,
                                items: activityLevels,
                                value: selectedActivity,
                                onChanged: (newvalue) {
                                  setState(() {
                                    selectedActivity = newvalue as double;
                                  });
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.10,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(onPrimary: Colors.blue,  shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(58),
                              bottomRight: Radius.circular(58)),
                        )),

                          onPressed: () {

                            //validation
                            if (age.text.isEmpty ||
                                uheight.text.isEmpty ||
                                weight.text.isEmpty) {
                              _showAlertDialog("Alert",
                                  "Please Fill In All Required Information");
                            } else if (cal_gender_difference == null) {
                              _showAlertDialog(
                                  "Alert", "Please Select Your Gender");
                            } else if (selectedActivity == null) {
                              _showAlertDialog("Alert",
                                  "Please Select Your Daily Activity Level");
                            } else {
                              calculate();
                              pushResults();
                            }
                          },
                          //() {Navigator.of(context).pushNamed('/outputs');}
                          child: Text(
                            'Get Results',
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(25),
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          )),
                    ]));
              },
            ),
          ),
        ));
  }


}
/* calories = (((10 * double.parse(weight.text)) +
                                  (6.25 * double.parse(uheight.text)) -
                                  (5 * double.parse(age.text)) -
                                  cal_gender_difference) * SelectedActivity);
                              fats=calories/45;
                              carb=(calories*.5)/4;
                              proteinFrom=2.2*(double.parse(weight.text));
                              proteinTo=0.8*(double.parse(weight.text));*/
