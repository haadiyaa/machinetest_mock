import 'package:flutter/material.dart';

class myNeumorphicButton extends StatelessWidget {
  const myNeumorphicButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFF2c3135),
          boxShadow: [
            BoxShadow(
                color: Colors.white.withOpacity(0.05),
                offset: const Offset(-10, -10),
                blurRadius: 20,
                spreadRadius: 0),
            const BoxShadow(
              color: Colors.black87,
              offset: Offset(10, 10),
              blurRadius: 20,
              spreadRadius: 0,
            ),
          ],
        ),
        child: const Icon(
          Icons.close,
          color: Colors.white,
        ),
      ),
    );
  }
}

// Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: NeumorphicButton(
//                   onTap: () {},
//                   child: Icon(
//                     size: 15,
//                     Icons.close,
//                     color: Colors.white,
//                   ),
//                   // boxShape: BoxShape.circle,
//                   bottomRightShadowBlurRadius: 15,
//                   bottomRightShadowSpreadRadius: 1,
//                   // borderWidth: 5,
//                   borderRadius: 50,
//                   backgroundColor: Colors.grey.shade900,
//                   topLeftShadowBlurRadius: 15,
//                   topLeftShadowSpreadRadius: 1,
//                   topLeftShadowColor: Colors.grey.shade800,
//                   bottomRightShadowColor: Colors.black,
//                   height: 45,
//                   width: 45,
//                   bottomRightOffset: Offset(5, 5),
//                   topLeftOffset: Offset(-5, -5),
//                 ),
//               )