import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/components/constrains/constrain.dart';
import 'package:quran/components/widgets/commen-widgets.dart';
import 'package:quran/models/radio-list.dart';
import 'package:quran/services/RadioPlayer.dart';
import 'package:quran/views/radio-list/radio-list-view-model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RadioListPage extends StatelessWidget {
  @override
  bool first=true;
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: RadioProvider(),
      child: Scaffold(
        backgroundColor: primColor,
        appBar: myAppBar('قائمة قنوات الراديو'),
        body: SafeArea(
            child: Selector<RadioProvider, List<RadioModel>>(
                selector: (context, getRadio) {
          if(first){
            getRadio.fetchRadioList();
            first=false;
          }
          return getRadio.getRadioList;
        },
          builder: (ctx, radioList, widget) {
          return radioList.length == 0
              ? spinKit(context)
              : ListView.builder(
                  itemCount: radioList.length,
                  itemBuilder: (context, index) => Container(
                        height: 0.12.sh,
                        margin: EdgeInsets.all(5.sp),
                        padding: EdgeInsets.all(5.sp),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.r),
                            boxShadow: [myBoxShadow]),
                        child:
                        ChangeNotifierProvider<RadioPlayerProvider>(
                          create: (context)=> RadioPlayerProvider(),
                         child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
//                            Container(
//                              width: 0.1.sh,
//                              margin: EdgeInsets.symmetric(horizontal: 7.sp),
//                             // alignment: Alignment.center,
//                              decoration: BoxDecoration(
//                                  color: Colors.white,
//                                  borderRadius: BorderRadius.circular(50.r),
//                                  image: DecorationImage(
//                                      image: NetworkImage(index == 3
//                                          ? 'https://i.gifer.com/Pf0j.gif'
//                                          : 'https://png.pngtree.com/png-vector/20190901/ourlarge/pngtree-radio-icon-design-vector-png-image_1712465.jpg'),
//                                      fit: BoxFit.fill),
//                                  boxShadow: [myBoxShadow]),
//                              //child: Icon(Icons.book,color: Color(0xFFFF4F7D),),
//                            ),
                           radioRunContainer(radioList[index],  0.1.sh),
                            Container(
                              width: 0.6.sw,
                              child: autoText(radioList[index].name, 2, 20.ssp,
                                  FontWeight.w600, Colors.black),
                            ),
                          ],
                        ),
                        )
                      ));
        })),
      ),
    );
  }
}
