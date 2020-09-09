import 'package:flutter/material.dart';
import 'package:flutter_music_app/core/const.dart';

class CustomButtonWidget extends StatelessWidget {
  final Widget icon;
  final double size;
  final double borderWidth;
  final String image;

  CustomButtonWidget({
    this.icon,
    @required this.size,
    this.image,
    this.borderWidth = 1.0,
  });
  @override
  Widget build(BuildContext context) {
    var boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(200),
      ),
      border: Border.all(
        width: borderWidth,
        color: AppColors.mainColor,
      ),
      boxShadow: [
        BoxShadow(
          color: AppColors.lightBlueShadow,
          blurRadius: 5,
          offset: Offset(5, 5),
          spreadRadius: 3,
        ),
        BoxShadow(
          color: Colors.white,
          blurRadius: 5,
          offset: Offset(-5, -5),
          spreadRadius: 3,
        ),
      ],
      gradient: RadialGradient(colors: [
        AppColors.mainColor,
        AppColors.mainColor,
        AppColors.mainColor,
        Colors.white,
      ]),
    );

    if (image != null) {
      boxDecoration = boxDecoration.copyWith(
        image: DecorationImage(
          image: ExactAssetImage(image),
          fit: BoxFit.cover,
        ),
      );
    }
    return Container(
      width: size,
      height: size,
      decoration: boxDecoration,
      child: icon,
    );
  }
}
