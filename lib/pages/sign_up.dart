import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sayfood/styles/app_theme.dart';
import 'package:sayfood/styles/images.dart';
import 'package:sayfood/styles/strings.dart';
import 'package:sayfood/styles/styling.dart';
import 'package:sayfood/widgets/capsule_shape_container.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _phoneNumberController.text = Strings.phoneHint;
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _upperHalfContainer(context),
            _bottomHalfContainer(context)
          ],
        ),
      ),
    );
  }

  Container _upperHalfContainer(BuildContext context) {
    return Container(
      height: context.percentHeight * 50,
      width: context.percentWidth * 100,
      decoration: const BoxDecoration(
        color: Styling.mainYellow,
        image: DecorationImage(
            image: AssetImage(Images.signUpYellow), fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SvgPicture.asset(
            Images.lgnLogo,
            width: context.percentWidth * 37,
          ),
          32.heightBox,
          const Text(
            Strings.slogan,
            style: AppTheeme.normalButtonText,
          ),
          32.heightBox
        ],
      ),
    );
  }

  Container _bottomHalfContainer(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          16.heightBox,
          capsuleShape(
            child: TextField(
              controller: _phoneNumberController,
              style: AppTheeme.normalButtonText,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                icon: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: SizedBox(
                    height: 28,
                    child: AspectRatio(
                      aspectRatio: 2 / 1,
                      child: SvgPicture.asset(
                        Images.uaeFlag,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                border: InputBorder.none,
              ),
            ).p(8).px(16),
          ),
          16.heightBox,
          capsuleShape(
            color: Styling.darkGrey,
            child: RawMaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, '/CodeActivation');
              },
              child: const Text(
                Strings.continueBtn,
                style: AppTheeme.normalButtonTextWhite,
              ),
            ),
          ),
          16.heightBox,
          capsuleShape(
            color: Styling.lightGrey,
            child: RawMaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, '/MainPage');
              },
              child: const Text(
                Strings.signUpLater,
                style: AppTheeme.normalButtonText,
              ),
            ),
          ),
          48.heightBox,
          GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  Images.languageIcon,
                  height: 30,
                ),
                5.widthBox,
                const Text(Strings.changeLanguage)
              ],
            ),
          )
        ],
      ).p(24),
    );
  }
}
