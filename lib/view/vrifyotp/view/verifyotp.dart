import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:login_app/constants/constants.dart';
import 'package:login_app/constants/textstyles.dart';
import 'package:login_app/provider/otpprovider.dart';
import 'package:login_app/view/home/view/homepage.dart';
import 'package:login_app/view/selectcountry/view/selectcountry.dart';
import 'package:neumorphic_button/neumorphic_button.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class VerifyNumberPage extends StatefulWidget {
  VerifyNumberPage({super.key, required this.phone});
  final String phone;

  @override
  State<VerifyNumberPage> createState() => _VerifyNumberPageState();
}

class _VerifyNumberPageState extends State<VerifyNumberPage> {
  @override
  void initState() {
    super.initState();
  }

  final controller = TextEditingController();

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final otpProvider = Provider.of<OtpProvider>(context, listen: false);
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
                            return value!.length == 4
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
                        onPressed: () {
                          Provider.of<OtpProvider>(context, listen: false)
                              .resendOtp(widget.phone)
                              .then(
                            (value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(otpProvider.msg)));
                            },
                          );
                        },
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
                            if (_key.currentState!.validate()) {
                              otpProvider
                                  .verifyOtp(controller.text, widget.phone);
                                  Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => Selectcountry()));
                            }
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
