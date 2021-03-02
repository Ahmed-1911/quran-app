import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/components/widgets/commen-widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child:Column(
            children: <Widget>[
              myAppBar('Quran App'),
              Container(
                height: 150.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    autoText('مشاهير القراء', 1, 18.ssp , FontWeight.w700, Colors.black),
                    Container(
                      height: 130.h,
                      child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context,index){
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.sp),
                          color: Colors.greenAccent,
                        );
                      }),
                    )
                  ],
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}
