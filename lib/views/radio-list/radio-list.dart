import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/components/constrains/constrain.dart';
import 'package:quran/components/widgets/commen-widgets.dart';
import 'package:quran/views/radio-list/radio-list-view-model.dart';
class RadioList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RadioProvider>(
      create: (context)=>RadioProvider(),
      child: Scaffold(
        backgroundColor: primColor,
        appBar: myAppBar('قائمة قنوات الراديو'),
        body: SafeArea(
            child:
            Consumer<RadioProvider>(
              builder: (ctx,radioList,widget) {
                radioList.fetchRadioList();
                return radioList.radioList.length==0?
                spinKit(context):
                ListView.builder(
                      itemCount: radioList.radioList.length,
                      itemBuilder: (context, index) =>
                          Container(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.1,
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(1, 1),
                                      blurRadius: 3,
                                      spreadRadius: 1
                                  )
                                ]
                            ),
                            child: LayoutBuilder(
                              builder: (ctx, constraints) =>
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        width: constraints.maxWidth * 0.2,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            //Colors.grey[300],
                                            borderRadius: BorderRadius.circular(
                                                50),
                                            image: DecorationImage(
                                                image: NetworkImage(index == 3
                                                    ? 'https://i.gifer.com/Pf0j.gif'
                                                    : 'https://png.pngtree.com/png-vector/20190901/ourlarge/pngtree-radio-icon-design-vector-png-image_1712465.jpg'),
                                                //https://i.gifer.com/Pf0j.gif
                                                fit: BoxFit.fill
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black26,
                                                  offset: Offset(1, 1),
                                                  blurRadius: 5,
                                                  spreadRadius: 1
                                              )
                                            ]
                                        ),
                                        //child: Icon(Icons.book,color: Color(0xFFFF4F7D),),
                                      ),
                                      Container(
                                        width: constraints.maxWidth * 0.72,
                                        child: autoText(radioList.radioList[index].name, 2, 20,
                                            FontWeight.w600, Colors.black),
                                      ),
                                    ],
                                  ),
                            ),
                          )
                  );
              }
            )
        ),
      ),
    );
  }
}
