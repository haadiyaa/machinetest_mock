import 'package:flutter/material.dart';
import 'package:login_app/constants/constants.dart';
import 'package:login_app/constants/textstyles.dart';
import 'package:login_app/provider/countryprovider.dart';
import 'package:login_app/view/home/view/homepage.dart';
import 'package:neumorphic_button/neumorphic_button.dart';
import 'package:provider/provider.dart';

class Selectcountry extends StatefulWidget {
  const Selectcountry({
    super.key,
  });

  @override
  State<Selectcountry> createState() => _SelectcountryState();
}

class _SelectcountryState extends State<Selectcountry> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
        Provider.of<Countryprovider>(context, listen: false).selectCountry();
  }

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
                  'Select Country',
                  style: MyTextStyle.heading1,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  child: Column(
                    children: [
                      const Text(
                        textAlign: TextAlign.center,
                        'Please select the country where\nyou want to study',
                        style: TextStyle(color: Constants.textcolor2),
                      ),
                      Constants.height20,
                      Consumer<Countryprovider>(
                        builder: (context, countryProvider, child) {
                          if (countryProvider.selectCountyModel != null) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        countryProvider.selectedCountry(
                                            countryProvider.selectCountyModel!
                                                .data!.countries![1].id
                                                .toString());
                                      },
                                      child: Container(
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: NetworkImage(countryProvider
                                                .selectCountyModel!
                                                .data!
                                                .countries![0]
                                                .image!),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        height: size.height * 0.2,
                                        width: size.height * 0.2,
                                      ),
                                    ),
                                    Constants.height5,
                                    Text(countryProvider.selectCountyModel!
                                        .data!.countries![0].name!)
                                  ],
                                ),
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        countryProvider.selectedCountry(
                                            countryProvider.selectCountyModel!
                                                .data!.countries![0].id
                                                .toString());
                                      },
                                      child: Container(
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: NetworkImage(countryProvider
                                                .selectCountyModel!
                                                .data!
                                                .countries![1]
                                                .image!),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        height: size.height * 0.2,
                                        width: size.height * 0.2,
                                      ),
                                    ),
                                    Constants.height5,
                                    Text(countryProvider.selectCountyModel!
                                        .data!.countries![1].name!)
                                  ],
                                ),
                              ],
                            );
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),

                      SizedBox(
                        height: size.height * 0.15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: NeumorphicButton(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const Homepage()));
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
                              'Proceed',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                      Constants.height10,
                      const Text('Can’t see the country of your interest?'),
                      Constants.height20,
                      const Text(
                        'Consult with us',
                        style: TextStyle(
                            color: Constants.textcolor2, fontSize: 16),
                      )
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
