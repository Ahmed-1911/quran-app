import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/components/constrains/constrain.dart';
import 'package:quran/components/widgets/commen-widgets.dart';

class ListOfSur extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primColor,
      appBar: myAppBar('مشارى بن راشد'),
      body: SafeArea(
          child:
              ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, inddex) =>
                  Container(
                    height: MediaQuery.of(context).size.height*0.1,
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(1,1),
                              blurRadius: 3,
                              spreadRadius:1
                          )
                        ]
                    ),
                    child: LayoutBuilder(
                      builder: (ctx,constraints)=>
                      Row(
                        children: <Widget>[
                          Container(
                            width: constraints.maxWidth *0.2,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,//Colors.grey[300],
                              borderRadius: BorderRadius.circular(50),
                              image: DecorationImage(
                                image: NetworkImage('https://i.pinimg.com/736x/97/ea/81/97ea81d52f91ae1ccff5b2d35ba411de.jpg'),
                                fit: BoxFit.fill
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(1,1),
                                    blurRadius: 5,
                                    spreadRadius:1
                                )
                              ]
                            ),
                            //child: Icon(Icons.book,color: Color(0xFFFF4F7D),),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              autoText('Al-Fateha', 1 , 20 , FontWeight.w600, Colors.black),
                              autoText('7 ayat', 1 , 18 , FontWeight.w500, Colors.black54),
                            ],
                          ),
                          SizedBox(width: constraints.maxWidth * 0.2,),
                          Container(
                            width: constraints.maxWidth*0.3,
                            child: autoText('سورة الفاتحة', 1 , 20 , FontWeight.w600, Colors.black),
                          )
                        ],
                      ),
                    ),
                  )
              )
      ),
    );
  }
}
