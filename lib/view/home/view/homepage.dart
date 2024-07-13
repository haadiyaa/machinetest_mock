import 'package:flutter/material.dart';
import 'package:login_app/constants/textstyles.dart';
import 'package:neumorphic_button/neumorphic_button.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome',style: MyTextStyle.heading1,),
            Padding(
              padding: const EdgeInsets.all(10),
              child: NeumorphicButton(
                onTap: () {},
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
                    'Logout',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: NeumorphicButton(
                onTap: () {},
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
                    'Delete User',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
