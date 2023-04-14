import '../../constants/colors.dart';
import '../../constants/strings.dart';
import '../../env/dimensions.dart';
import '../shared_widgets/custom_btn.dart';
import '../shared_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushNamed(context, '/home');
    });

    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/logo.png'),
              height: Dimensions.calcH(200),
              color: Colors.white,


            ),



            SizedBox(
              height: Dimensions.calcH(15),
            ),

            SizedBox(
              height: Dimensions.calcH(5),
            ),

            SizedBox(
              height: Dimensions.calcH(5),
            ),

          ],
        ),
      ),
    );
  }
}
