import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/components/constrains/constrain.dart';
import 'package:quran/components/widgets/commen-widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

headContainer(BuildContext context, String title, Widget toPage) {
  return Container(
      height: 40.h,
      margin: EdgeInsets.symmetric(horizontal: 10.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>toPage));
              },
              child: Icon(
            Icons.more,
            color: primColor,
            size: 35.sp,
          )),
          autoText(title, 1, 20.ssp, FontWeight.w800, Colors.black),
        ],
      ));
}
