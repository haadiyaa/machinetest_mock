import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_app/constants/constants.dart';
import 'package:login_app/constants/textstyles.dart';
import 'package:login_app/provider/otpprovider.dart';
import 'package:login_app/view/vrifyotp/view/verifyotp.dart';
import 'package:neumorphic_button/neumorphic_button.dart';
import 'package:provider/provider.dart';

class Phonepage extends StatefulWidget {
  const Phonepage({
    super.key,
    required this.code,
    required this.image,
    required this.country,
  });
  final String code;
  final String country;
  final String image;

  @override
  State<Phonepage> createState() => _PhonepageState();
}

class _PhonepageState extends State<Phonepage> {
  final controller = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  void initState() {
    print('code ${widget.code} ');
    super.initState();
  }

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
                  'Enter Phone Number',
                  style: MyTextStyle.heading1,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  child: Column(
                    children: [
                      const Text(
                        textAlign: TextAlign.center,
                        'Please enter your 10 digit mobile\nnumber to receive OTP',
                        style: TextStyle(color: Constants.textcolor2),
                      ),
                      Constants.height20,
                      SizedBox(
                        width: size.width,
                        child: Row(
                          children: [
                            CountryCodePicker(
                              initialSelection: widget.country,
                            ),
                            Expanded(
                              child: Form(
                                key: _key,
                                child: TextFormField(
                                  controller: controller,
                                  validator: (value) {
                                    return RegExp(r'^([6-9][0-9]{9})$')
                                            .hasMatch(value!)
                                        ? null
                                        : 'Please enter a valid mobile number';
                                  },
                                  keyboardType: TextInputType.phone,
                                  decoration: const InputDecoration(
                                    hintText: '9999999999',
                                    hintStyle:
                                        const TextStyle(letterSpacing: 3),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: size.height * 0.3,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: NeumorphicButton(
                          onTap: () {
                            if (_key.currentState!.validate()) {
                              if (otpProvider.logintype == Constants.agent) {
                                Provider.of<OtpProvider>(context, listen: false)
                                    .agentOtp(
                                        widget.code, controller.text.trim())
                                    .then(
                                  (value) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(otpProvider.msg)));
                                  },
                                ).then(
                                  (value) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => VerifyNumberPage(
                                                  phone:
                                                      '${widget.code}${controller.text}',
                                                )));
                                  },
                                );
                              } else if (otpProvider.logintype ==
                                  Constants.student) {
                                Provider.of<OtpProvider>(context, listen: false)
                                    .studentOtp(
                                        widget.code, controller.text.trim())
                                    .then(
                                  (value) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(otpProvider.msg)));
                                  },
                                ).then(
                                  (value) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => VerifyNumberPage(
                                                  phone:
                                                      '${widget.code}${controller.text}',
                                                )));
                                  },
                                );
                              }

                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (_) => VerifyNumberPage(
                              //               phone:
                              //                   '${widget.code}${controller.text}',
                              //             )));
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
                              'Get OTP',
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
