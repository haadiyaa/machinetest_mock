import 'package:flutter/material.dart';
import 'package:login_app/constants/constants.dart';
import 'package:login_app/constants/textstyles.dart';
import 'package:login_app/view/countryselect/view/countrypage.dart';
import 'package:neumorphic_button/neumorphic_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              Constants.welcomeGif,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              height: size.height * 0.4,
              width: size.width,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    spreadRadius: 5,
                    color: Colors.white,
                    offset: Offset(0, 5),
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Color.fromARGB(255, 51, 50, 50),
              ),
              child: Column(
                children: [
                  const Text('Welcome to Study Lancer',
                      style: MyTextStyle.heading1),
                  Constants.height10,
                  const Text('Please select your role to get registered',
                      style: MyTextStyle.heading4),
                      const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: NeumorphicButton(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (_)=>const CountryPage()));
                              },
                              bottomRightShadowBlurRadius: 15,
                              bottomRightShadowSpreadRadius: 1,
                              borderRadius: 10,
                              backgroundColor: Colors.grey.shade900,
                              topLeftShadowBlurRadius: 10,
                              topLeftShadowSpreadRadius: 1,
                              topLeftShadowColor:
                                  const Color.fromARGB(255, 129, 129, 129),
                              bottomRightShadowColor: Colors.black,
                              height: size.height * 0.15,
                              width: size.width * 0.35,
                              bottomRightOffset: const Offset(5, 6),
                              topLeftOffset: const Offset(-5, -5),
                              padding: const EdgeInsets.all(5),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image(
                                  image: AssetImage(
                                    Constants.student,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const Text('Student'),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: NeumorphicButton(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (_)=>const CountryPage()));
                              },
                              bottomRightShadowBlurRadius: 15,
                              bottomRightShadowSpreadRadius: 1,
                              borderRadius: 10,
                              backgroundColor: Colors.grey.shade900,
                              topLeftShadowBlurRadius: 10,
                              topLeftShadowSpreadRadius: 1,
                              topLeftShadowColor:
                                  const Color.fromARGB(255, 129, 129, 129),
                              bottomRightShadowColor: Colors.black,
                              height: size.height * 0.15,
                              width: size.width * 0.35,
                              bottomRightOffset: const Offset(5, 6),
                              topLeftOffset: const Offset(-5, -5),
                              padding: const EdgeInsets.all(5),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image(
                                  image: AssetImage(
                                    Constants.counsellor,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const Text('Agent')
                        ],
                      ),
                    ],
                  ),const Spacer(),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('By continuing you agree to our'),
                      Text(' Terms and Conditions',style: TextStyle(color:Constants.textcolor2),),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
