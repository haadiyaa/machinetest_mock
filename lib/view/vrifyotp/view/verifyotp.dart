import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:login_app/constants/constants.dart';
import 'package:login_app/constants/textstyles.dart';
import 'package:neumorphic_button/neumorphic_button.dart';
import 'package:pinput/pinput.dart';

class VerifyNumberPage extends StatelessWidget {
  VerifyNumberPage({super.key});
  final controller = TextEditingController();
  final _key = GlobalKey<FormState>();
  final validPin = '4301';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 10,
        ),
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: NeumorphicButton(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        bottomRightShadowBlurRadius: 15,
                        bottomRightShadowSpreadRadius: 1,
                        padding: const EdgeInsets.all(5),
                        borderRadius: 50,
                        backgroundColor: Colors.grey.shade900,
                        topLeftShadowBlurRadius: 15,
                        topLeftShadowSpreadRadius: 1,
                        topLeftShadowColor: Colors.grey.shade800,
                        bottomRightShadowColor: Colors.black,
                        height: 30,
                        width: 30,
                        bottomRightOffset: const Offset(5, 5),
                        topLeftOffset: const Offset(-5, -5),
                        child: const Icon(
                          size: 15,
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const Text(
                  'Verify Number',
                  style: MyTextStyle.heading1,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  child: Column(
                    children: [
                      const Text(
                        textAlign: TextAlign.center,
                        'Please enter the OTP received to\nverify your number ',
                        style: TextStyle(color: Constants.textcolor2),
                      ),
                      Constants.height20,
                      Form(
                        key: _key,
                        child: Pinput(
                          controller: controller,
                          errorBuilder: (errorText, pin) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Center(
                                child: Text(
                                  errorText!,
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            );
                          },
                          validator: (value) {
                            return value == validPin
                                ? null
                                : 'OTP does not match, please try again';
                          },
                          onCompleted: (value) {
                            print(value);
                          },
                          length: 4,
                          pinAnimationType: PinAnimationType.slide,
                          defaultPinTheme: MyTextStyle.defaultPinTheme,
                          showCursor: true,
                          cursor: MyTextStyle.cursor,
                          preFilledWidget: MyTextStyle.preFilledWidget,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                      const Text(
                        'Did\'nt receive OTP?',
                        style:
                            TextStyle(color: Color.fromARGB(255, 97, 97, 97)),
                      ),
                      Constants.height10,
                      TextButton(
                        style: TextButton.styleFrom(
                            foregroundColor: Constants.textcolor2),
                        onPressed: () {},
                        child: const Text(
                          'Resend OTP',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: NeumorphicButton(
                          onTap: () {
                            _key.currentState!.validate();
                          },
                          bottomRightShadowBlurRadius: 15,
                          bottomRightShadowSpreadRadius: 1,
                          padding: const EdgeInsets.all(10),
                          borderRadius: 50,
                          backgroundColor: Colors.grey.shade900,
                          topLeftShadowBlurRadius: 15,
                          topLeftShadowSpreadRadius: 1,
                          topLeftShadowColor: Colors.grey.shade800,
                          bottomRightShadowColor: Colors.black,
                          height: size.height * 0.1,
                          width: size.width * 0.5,
                          bottomRightOffset: const Offset(5, 5),
                          topLeftOffset: const Offset(-5, -5),
                          child: const Center(
                            child: Text(
                              'Verify',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                      // const Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
