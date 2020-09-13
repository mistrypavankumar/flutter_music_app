import 'package:flutter/material.dart';
import 'package:flutter_music_app/widgets/custom_progress_widget.dart';

import '../core/const.dart';
import '../widgets/custom_button_widget.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  var _value;
  AnimationController _animationController;
  var isPlay;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    isPlay = true;
    _value = 0.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButtonWidget(
                    size: 50,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: AppColors.styleColor,
                    ),
                  ),
                  Text(
                    "PLAYING NOW",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.styleColor,
                    ),
                  ),
                  CustomButtonWidget(
                    size: 50,
                    onTap: () {},
                    icon: Icon(
                      Icons.menu,
                      color: AppColors.styleColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: CustomButtonWidget(
                image: "assets/logo.jpg",
                size: MediaQuery.of(context).size.width * .7,
                borderWidth: 5,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => DetailPage(),
                    ),
                  );
                },
              ),
            ),
            Text(
              "Lose It",
              style: TextStyle(
                color: AppColors.styleColor,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                height: 2,
              ),
            ),
            Text(
              "Flume - Vic Mensa",
              style: TextStyle(
                color: AppColors.styleColor.withAlpha(90),
                fontSize: 16,
              ),
            ),
            Expanded(
              child: SizedBox(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: CustomProgressWidget(
                value: _value,
                labelStart: "1:21",
                labelEnd: "3.46",
              ),
            ),
            Expanded(
              child: SizedBox(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButtonWidget(
                    size: 70,
                    onTap: () {
                      setState(() {
                        if (_value > .1) {
                          _value -= .1;
                        }
                      });
                    },
                    borderWidth: 5,
                    icon: Icon(
                      Icons.fast_rewind,
                      color: AppColors.styleColor,
                    ),
                  ),
                  CustomButtonWidget(
                    size: 80,
                    onTap: () {
                      if (_animationController.value == 0.0) {
                        _animationController.forward();
                      } else {
                        _animationController.reverse();
                      }
                    },
                    isActive: true,
                    borderWidth: 5,
                    icon: AnimatedIcon(
                      icon: AnimatedIcons.pause_play,
                      progress: _animationController,
                      color: Colors.white,
                    ),
                  ),
                  CustomButtonWidget(
                    size: 70,
                    onTap: () {
                      setState(() {
                        if (_value < .9) {
                          _value += .1;
                        }
                      });
                    },
                    borderWidth: 5,
                    icon: Icon(
                      Icons.fast_forward,
                      color: AppColors.styleColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
