import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/components/constrains/constrain.dart';
import 'package:quran/components/widgets/commen-widgets.dart';
import 'package:quran/components/widgets/list-of-suras-widgets.dart';
import 'package:quran/models/sura-list.dart';
import 'package:quran/views/list-of-seur/sur-of-list-view-model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ListOfSurPage extends StatelessWidget {
  ListOfSurPage(this.reciterName,this.server);
  String reciterName;
  String server;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value:SurProvider(),
        child: Scaffold(
          backgroundColor: primColor,
          appBar: myAppBar(reciterName),
          body: SafeArea(
              child: Selector<SurProvider,List<SuraModel>>(
                  selector: (context,getSurList){ getSurList.fetchsurList();return getSurList.getSurList;},
                  builder: (ctx, surList, widget) {
                   return surList.length == 0
                ? spinKit(context)
                : ListView.builder(
                    itemCount: surList.length,
                    itemBuilder: (context, index) => Container(
                        height: 0.13.sh,
                        margin: EdgeInsets.all(5.sp),
                        padding: EdgeInsets.all(5.sp),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                            boxShadow: [myBoxShadow]),
                        child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          width: 0.12.sh,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(50.r),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      'https://i.pinimg.com/736x/97/ea/81/97ea81d52f91ae1ccff5b2d35ba411de.jpg'),
                                                  fit: BoxFit.fill),
                                              boxShadow: [myBoxShadow]
                                          ),
                                        ),
                                        Container(
                                          width: 100.w,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              autoText(
                                                  surList[index].nameSimple,
                                                  1,
                                                  18.ssp,
                                                  FontWeight.w600,
                                                  Colors.black),
                                              autoText(
                                                  '${surList[index].revelationPlace}',
                                                  1,
                                                  19.ssp,
                                                  FontWeight.w500,
                                                  Colors.black54),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    textContainer(surList[index].versesCount.toString(),50.w),
                                    textContainer(surList[index].nameArabic,90.w)
                                  ],
                                )
                    )
                   );
          })),
        ));
  }
}
