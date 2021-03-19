import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/components/constrains/constrain.dart';
import 'package:quran/components/widgets/commen-widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/components/widgets/home-widget.dart';
import 'package:quran/models/famous-reciters.dart';
import 'package:quran/models/rewayat.dart';
import 'package:quran/services/RadioPlayer.dart';
import 'package:quran/views/list-of-reciters/list-of-reciters.dart';
import 'file:///C:/Users/Ahmed-Uwk/Documents/GitHub/quran-app/lib/views/list-of-rewayat/list-of-rewayt.dart';
import 'package:quran/views/list-of-seur/list-of-sur.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var contHeight1 = 0.0;
  var contHeight2 = 0.0;
  RadioPlayerController radioPlayerController;

  change() {
    Timer(Duration(seconds: 2), () {
      contHeight1 = 220.h;
      contHeight2 = 160.h;
    });
  }

  @override
  void initState() {
    super.initState();
    radioPlayerController=Get.put(RadioPlayerController());
    change();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
              child: Column(
            children: <Widget>[
              myAppBar('القرآن الكريم'),
              //Famous Reciters
               Container(
                margin: EdgeInsets.symmetric(vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    headContainer(context, 'مشاهير القراء',RecitersPage('all')),
                    Container(
                      height: 240.h,
                      child: ListView.builder(
                          itemCount: famousRecitersList.length,
                          itemExtent: 140.w,
                          reverse: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ListOfSurPage(
                                                famousRecitersList[index].name,
                                                famousRecitersList[index].server)
                                        )
                                    );
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 2500),
                                    curve: Curves.bounceInOut,
                                    height: contHeight1,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 5.sp, vertical: 5.sp),
                                    alignment: Alignment.bottomCenter,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30.r),
                                            bottomRight: Radius.circular(30.r)),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              famousRecitersList[index].imageUrl),
                                          fit: BoxFit.fill,
                                        ),
                                        boxShadow: [myBoxShadow]),
                                    child: Container(
                                        width: 140.w,
                                        decoration: BoxDecoration(
                                          color: Colors.black26,
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(30.r)),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.sp),
                                          child: autoText(
                                              famousRecitersList[index].name,
                                              2,
                                              18.ssp,
                                              FontWeight.w700,
                                              Colors.white),
                                        )),
                                  ),
                                ),
                              ],
                            );
                          }),
                    )
                  ],
                ),
              ),
              //Famous Radio channel
               radioSection(context, contHeight2,radioPlayerController),
              //el Rewayat
               Container(
                margin: EdgeInsets.symmetric(vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    headContainer(context, 'الروايـــات',RewayatListPage()),
                    Column(
                      children: List.generate(3, (index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>RecitersPage(rewayat[index].name)));
                      },
                      child: Container(
                          height: 60.h,
                          margin: EdgeInsets.all(7.sp),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.r),
                              boxShadow: [myBoxShadow]),
                          child: autoText(rewayat[index].name, 1, 20.ssp,
                              FontWeight.w800, Colors.black)),
                    );
                      }),
                    )
                  ],
                ),
              ),
            ],
          )),
        ),
      );
  }
}
