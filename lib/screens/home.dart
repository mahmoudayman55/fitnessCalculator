import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  @override
  _homeState createState() {
    return new _homeState();
  }
}


Color background = Color.fromARGB(255, 25, 22, 54);
Color myGreen = Color.fromARGB(255, 0, 185, 159);
class _homeState extends State {



  final ButtonStyle buttonStyle= ElevatedButton.styleFrom(primary:myGreen,  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(58),
        bottomRight: Radius.circular(58)),
  ));

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(


      body: new Container(
          width: screenWidth,
          height: screenHeight,
          color: background,
          alignment: Alignment.topCenter,
          child: Center(

            child: LayoutBuilder(
              builder: (context, constrains) {
                double height = constrains.maxHeight;
                double width = constrains.maxWidth;
                return new Column(

                  children: [SizedBox(height: height*0.25,),
                     FittedBox(child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          new Text(
                            'Fitness',maxLines: 1,
                            style: new TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              color: myGreen,
                              fontSize: ScreenUtil().setSp(38),
                            ),
                          ),
                          new Text('Calculator',maxLines: 1,
                              style: new TextStyle(

                                  color: Colors.white,
                                  fontSize: ScreenUtil().setSp(38),
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.bold))
                        ],
                      ),)
                    ,SizedBox(height: height*0.10,),
                     FittedBox(child: new Column(
                        children: [
                          FittedBox(child : new Text(
                            'The Easiest Way To Calculate\nYour Daily Body Needs\nOf Basic Nutrients',
                            style: new TextStyle(
                                color: Colors.white,
                                fontSize:ScreenUtil().setSp(22),
                                fontFamily: 'Roboto',
                                height: 1.6),
                            textAlign: TextAlign.center,
                          ))
                          ,
                          new AutoSizeText(
                            'For Free!',
                            style: new TextStyle(
                                color: myGreen,
                                fontSize: ScreenUtil().setSp(40),
                                height: 1.25,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),)
                    ,SizedBox(height: height*0.10,),
                 ButtonTheme(
                        child: new ElevatedButton(
                          style: buttonStyle,

                          onPressed: () {Navigator.of(context).pushNamed('/inputs');},
                          child: new Text(
                            'Start',
                            style: new TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(25),
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                              ),
                          ),

                        ),
                        minWidth: width/3.5,

                      ),

                  ],
                );
              },
            ),
          )),
    );
  }
}
