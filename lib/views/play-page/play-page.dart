import 'package:flutter/material.dart';
import 'package:progressive_image/progressive_image.dart';
import 'package:quran/components/constrains/constrain.dart';
import 'package:quran/components/widgets/commen-widgets.dart';

class Play extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primColor,
      appBar: myAppBar('مشارى بن راشد'),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height - 80,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                left: -(MediaQuery.of(context).size.width),
                child: Container(
                  height: MediaQuery.of(context).size.height - 88,
                  width: 2 * MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(500)),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AnimatedContainer(
                      duration: Duration(seconds: 2),
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.4,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: primColor,
                              width:3
                          ),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child:myImageContainer(context,'')
                  ),
                  autoText('سوره البقرة', 1, 20, FontWeight.w700, Colors.black),
                  autoText('رواية حفص عن عاصم', 1, 17, FontWeight.w400,
                      Colors.black54),
                  Slider(
                    value: 5,
                    onChanged: (value) => {},
                    activeColor: primColor,
                    max: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height *0.04,
                        width:  MediaQuery.of(context).size.width * 0.09 ,
                        child: Icon(Icons.stop,color: primColor),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: primColor,
                                width:1.5
                            )
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: MediaQuery.of(context).size.height *0.07,
                        width:  MediaQuery.of(context).size.width * 0.14 ,
                        child: Icon(Icons.play_arrow,color: Colors.white,size: 40,),
                        decoration: BoxDecoration(
                            color: primColor ,
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                                color: primColor,
                                width:1.5
                            )
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height *0.04,
                        width:  MediaQuery.of(context).size.width * 0.09 ,
                        child: Icon(Icons.repeat,color: primColor),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: primColor,
                                width:1.5
                            )
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height *0.15,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
