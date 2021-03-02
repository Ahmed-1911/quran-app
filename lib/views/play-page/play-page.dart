import 'package:flutter/material.dart';
import 'package:quran/components/constrains/constrain.dart';
import 'package:quran/components/widgets/commen-widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Play extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primColor,
      body: Column(
        children: <Widget>[
          myAppBar('مشاري بن راشد'),
          Container(
            height: 0.93.sh,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  left: -(1.sw),
                  child: Container(
                    height:0.93.sh,
                    width: 2.sw,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(800.r)),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AnimatedContainer(
                        duration: Duration(seconds: 2),
                        curve: Curves.bounceInOut,
                        height: 150.h,
                        width: 150.h,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: primColor,
                                width:3.sp
                            ),
                            borderRadius: BorderRadius.circular(50.r)
                        ),
                        child:myImageContainer(context,'')
                    ),
                    autoText('سوره البقرة', 1, 17.ssp, FontWeight.w700, Colors.black),
                    autoText('رواية حفص عن عاصم', 1, 10.ssp, FontWeight.w400,
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
                          height: 30.h,
                          width:  30.h ,
                          child: Icon(Icons.stop,color: primColor,size: 20.sp,),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.r),
                              border: Border.all(
                                  color: primColor,
                                  width:1.5.sp
                              )
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20.w),
                          height: 50.h,
                          width:  50.h ,
                          child: Icon(Icons.play_arrow,color: Colors.white,size: 40.sp,),
                          decoration: BoxDecoration(
                              color: primColor ,
                              borderRadius: BorderRadius.circular(40.r),
                              border: Border.all(
                                  color: primColor,
                                  width:1.5.sp
                              )
                          ),
                        ),
                        Container(
                          height: 30.h,
                          width:  30.h ,
                          child: Icon(Icons.repeat,color: primColor,size: 20.sp,),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.r),
                              border: Border.all(
                                  color: primColor,
                                  width:1.5.sp
                              )
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
