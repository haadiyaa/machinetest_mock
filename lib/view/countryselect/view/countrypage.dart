import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_app/constants/constants.dart';
import 'package:login_app/constants/textstyles.dart';
import 'package:login_app/model/countrmodel.dart';
import 'package:login_app/provider/countryprovider.dart';
import 'package:login_app/view/countryselect/widgets/customtextfield.dart';
import 'package:login_app/view/phonepage/view/phonepage.dart';
import 'package:neumorphic_button/neumorphic_button.dart';
import 'package:provider/provider.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({super.key});

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<Countryprovider>(context, listen: false).fetchCountry();
    final countryProvider =
        Provider.of<Countryprovider>(context, listen: false);
    if (countryProvider.country != null) {
      countryProvider.searchList = countryProvider.country!.data;
    }
  }

  @override
  Widget build(BuildContext context) {
    final countryProvider =
        Provider.of<Countryprovider>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 10,
          left: 20,
          right: 20,
        ),
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
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
                  'Select Your Country',
                  style: MyTextStyle.heading1,
                ),
                Constants.height10,
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: SizedBox(
                    height: size.height,
                    child: Column(
                      children: [
                        CustomtextField(
                          onChanged: (p0) => countryProvider.runFilter(p0),
                          text: 'Search',
                          icon: Icons.search,
                        ),
                        Expanded(
                          child: Consumer<Countryprovider>(
                            builder: (context, countryProvider, child) {
                              if (countryProvider.country != null) {
                                final countries =
                                    countryProvider.searchList ?? [];
                                return ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      Container(
                                    width: size.width,
                                    height: 1,
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromARGB(255, 36, 36, 36),
                                          Color.fromARGB(255, 48, 48, 48),
                                          Color.fromARGB(255, 36, 36, 36)
                                        ],
                                      ),
                                    ),
                                  ),
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemCount: countries.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 20),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      const Phonepage()));
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 10),
                                                  height: size.height * 0.05,
                                                  width: size.width * 0.125,
                                                  child: SvgPicture.network(
                                                    countries[index].flag!,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Text(countries[index].name!),
                                              ],
                                            ),
                                            Text(countries[index].telCode!),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }

                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          ),
                        )
                      ],
                    ),
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
