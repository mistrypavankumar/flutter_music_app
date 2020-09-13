import 'package:flutter/material.dart';
import 'package:flutter_music_app/core/const.dart';

class CustomButtonWidget extends StatelessWidget {
  final Widget icon;
  final double size;
  final double borderWidth;
  final String image;
  final isActive;
  final VoidCallback onTap;

  CustomButtonWidget({
    this.icon,
    @required this.size,
    this.image,
    this.borderWidth = 1.0,
    this.isActive = false,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    var boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(200),
      ),
      border: Border.all(
        width: borderWidth,
        color: isActive ? AppColors.darkBlue : AppColors.mainColor,
      ),
      boxShadow: [
        BoxShadow(
          color: AppColors.lightBlueShadow,
          blurRadius: 5,
          offset: Offset(5, 5),
          spreadRadius: 3,
        ),
        BoxShadow(
          color: Colors.white60,
          blurRadius: 5,
          offset: Offset(-5, -5),
          spreadRadius: 3,
        ),
      ],
    );

    if (image != null) {
      boxDecoration = boxDecoration.copyWith(
        image: DecorationImage(
          image: ExactAssetImage(image),
          fit: BoxFit.cover,
        ),
      );
    }

    if (isActive) {
      boxDecoration = boxDecoration.copyWith(
        gradient: RadialGradient(
          colors: [
            AppColors.lightBlue,
            AppColors.darkBlue,
          ],
        ),
      );
    } else {
      boxDecoration = boxDecoration.copyWith(
        gradient: RadialGradient(
          colors: [
            AppColors.mainColor,
            AppColors.mainColor,
            AppColors.mainColor,
            Colors.white,
          ],
        ),
      );
    }
    return Container(
      width: size,
      height: size,
      decoration: boxDecoration,
      child: FlatButton(
        padding: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(200),
          ),
        ),
        onPressed: onTap,
        child: icon,
      ),
    );
  }
}
