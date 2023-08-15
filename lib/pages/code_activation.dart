import 'package:flutter/material.dart';
import 'package:sayfood/styles/app_theme.dart';
import 'package:sayfood/styles/strings.dart';
import 'package:sayfood/styles/styling.dart';
import 'package:sayfood/widgets/capsule_shape_container.dart';
import 'package:sayfood/widgets/cross_pop_button.dart';
import 'package:velocity_x/velocity_x.dart';

class CodeActivation extends StatefulWidget {
  const CodeActivation({super.key});

  @override
  _CodeActivationState createState() => _CodeActivationState();
}

class _CodeActivationState extends State<CodeActivation> {
  late TextEditingController _codeFieldController;

  @override
  void initState() {
    super.initState();
    _codeFieldController = TextEditingController();

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushNamed(context, '/SelectCategory');
    });
  }

  @override
  void dispose() {
    _codeFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 80,
          leading: const CrossPopButton().p(16),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Text(Strings.activationScreenHeader),
              24.heightBox,
              capsuleShape(
                child: TextField(
                  controller: _codeFieldController,
                  keyboardType: TextInputType.number,
                  style: AppTheeme.normalButtonText,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: Strings.activationTextFieldHint,
                      hintStyle: AppTheeme.normalButtonText
                          .copyWith(color: Styling.darkGrey)),
                ).p(16),
              ),
              16.heightBox,
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Strings.activateViaCall,
                    style: AppTheeme.normalButtonText,
                  ),
                  Text(
                    Strings.resendCode,
                    style: AppTheeme.normalButtonText,
                  ),
                ],
              ).px16(),
            ],
          ).p(24),
        ),
      ),
    );
  }
}
