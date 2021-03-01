import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progressive_image/progressive_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

myAppBar(String title){
  return Container(
      height: 0.07.sh,
      alignment: Alignment.center,
      child:autoText(title, 1, 16.ssp, FontWeight.w700, Colors.white)
  );
}

//******************************************************
SpinKitWave spinKit(BuildContext context) {
  return SpinKitWave(
    color: Colors.white,
    size: 50.0,
  );
}

//******************************************************
AutoSizeText autoText(String text, int maxLine, double fontSize,FontWeight fontWeight, Color color ) {
  return AutoSizeText(text,
      maxLines: maxLine,
      overflow: TextOverflow.visible,
      textAlign: TextAlign.center,
      style:GoogleFonts.elMessiri(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
      )
  );
}

//******************************************************

myImageContainer(BuildContext context,String image){
  return ClipRRect(
    borderRadius: BorderRadius.circular(47.r),
    child: ProgressiveImage(
      placeholder: AssetImage('assets/images/loading.gif'),
      thumbnail: NetworkImage(
          'https://i.pinimg.com/originals/6c/07/09/6c07096f19511c98a0c861f3470e198a.jpg'),
      image: NetworkImage(
          'https://i.pinimg.com/originals/6c/07/09/6c07096f19511c98a0c861f3470e198a.jpg'),
      fadeDuration: Duration(seconds: 2),
      excludeFromSemantics: true,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width ,
      fit: BoxFit.fill,
    ),
  );
}