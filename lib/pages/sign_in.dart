import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_secure_storage/get_secure_storage.dart';
import 'package:sayfood/pages/sign_up.dart';
import 'package:sayfood/styles/app_theme.dart';
import 'package:sayfood/styles/images.dart';
import 'package:sayfood/styles/strings.dart';
import 'package:sayfood/styles/styling.dart';
import 'package:sayfood/utils/firebase_services.dart';
import 'package:sayfood/utils/validators.dart';
import 'package:sayfood/widgets/capsule_shape_container.dart';
import 'package:sayfood/widgets/textfields.dart';
import 'package:velocity_x/velocity_x.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isSigningIn = false;
  bool passwordHidden = true;
  String? errorText;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailAddressController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void attemptSignIn() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isSigningIn = true;
      });
      await FirebaseServices.signInWithEmailAndPassword(
              _emailAddressController.text, _passwordController.text)
          .then((errorMessage) async {
        if (errorMessage == null) {
          errorText = null;
          GetSecureStorage()
              .write('isLoggedIn', 'true')
              .then((value) => Navigator.pushNamed(context, '/MainPage'));
        } else {
          setState(() {
            errorText = errorMessage;
          });
        }
        setState(() {
          isSigningIn = false;
        });
      });
    }
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
      height: context.percentHeight * 47,
      width: context.percentWidth * 100,
      decoration: const BoxDecoration(
        color: Styling.mainPurple,
        image: DecorationImage(
            image: AssetImage(Images.signUpPurple), fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(
            Images.logosf,
            width: context.percentWidth * 100,
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
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            16.heightBox,
            MainBorderedTextField(
              controller: _emailAddressController,
              hintText: 'Email',
              keyboardType: TextInputType.emailAddress,
              validator: Validators.validateEmail,
            ),
            16.heightBox,
            MainBorderedTextField(
              controller: _passwordController,
              hintText: 'Password',
              isObscure: true,
              keyboardType: TextInputType.visiblePassword,
              validator: Validators.validatePassword,
            ),
            16.heightBox,
            if (errorText != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  errorText!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            isSigningIn
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : capsuleShape(
                    color: Styling.darkGrey,
                    child: RawMaterialButton(
                      onPressed: () {
                        attemptSignIn();
                      },
                      child: const Text(
                        'SIGN IN',
                        style: AppTheeme.normalButtonTextWhite,
                      ),
                    ),
                  ),
            16.heightBox,
            capsuleShape(
              color: Styling.lightGrey,
              child: RawMaterialButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignUp()));
                },
                child: const Text(
                  'CREATE ACCOUNT',
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
      ),
    );
  }
}
