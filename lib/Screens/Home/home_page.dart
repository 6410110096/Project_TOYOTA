import 'package:evcar/component/background.dart';
import 'package:flutter/material.dart';

//Import package
import 'package:percent_indicator/percent_indicator.dart';

//Import other folder
import 'package:evcar/component/config/config.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Material(
                  type: MaterialType.transparency,
                  child: Row(),
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                const Text(
                  'TOYOTA EV & PSU',
                  style: TextStyle(
                      fontSize: 33,
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor),
                ),

                const Text(
                  'Model: CoE33 & EE55',
                  style: TextStyle(fontSize: 16, color: tPrimaryColor),
                ),
                const Text(
                  'Hello PSU, Welcome to EV Car model Coe & EE',
                  style: TextStyle(fontSize: 12, color: tPrimaryColor),
                ),
                const Spacer(),
                Image.network(
                  blackCar,
                ),
                const Spacer(),
                //แสดงค่าแบตเตอรี่ ในรูปแบบ Charging
                CircularPercentIndicator(
                  radius: 100.0,
                  lineWidth: 25.0,
                  animation: true,
                  percent: 0.8,
                  center: const Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "70.0%",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w300,
                                color: tPrimaryColor),
                          ),
                        ]),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Colors.red[600],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //SvgPicture.asset('lib/img/light.svg'),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'Battery',
                        style: TextStyle(fontSize: 15, color: kPrimaryColor),
                      ),
                    )
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //บล็อกสำหรับ Voltage
                      Card(
                        color: kCardColor,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: SizedBox(
                            width: 120,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Temp',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: kPrimaryColor)),
                                const SizedBox(height: 20),
                                Center(
                                  child: RichText(
                                    text: TextSpan(children: [
                                      const TextSpan(
                                          text: '21',
                                          style: TextStyle(
                                              fontSize: 50,
                                              fontWeight: FontWeight.bold,
                                              color: kPrimaryColor)),
                                      WidgetSpan(
                                        child: Transform.translate(
                                          offset: const Offset(0, -30),
                                          child: const Text('o',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: kPrimaryColor)),
                                        ),
                                      ),
                                      const TextSpan(
                                          text: 'C',
                                          style: TextStyle(
                                              fontSize: 50,
                                              fontWeight: FontWeight.bold,
                                              color: kPrimaryColor)),
                                    ]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      //บล็อกสำหรับ Current
                      Card(
                        color: kCardColor,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: const Padding(
                          padding: EdgeInsets.all(20),
                          child: SizedBox(
                            width: 120,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Voltage',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: kPrimaryColor)),
                                SizedBox(height: 10),
                                Center(
                                  child: Text('4.3 V',
                                      style: TextStyle(
                                          fontSize: 50,
                                          fontWeight: FontWeight.bold,
                                          color: kPrimaryColor)),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
