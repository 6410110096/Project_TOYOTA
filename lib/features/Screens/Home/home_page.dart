import 'dart:convert';
import 'package:evcar/component/background.dart';
import 'package:evcar/constants/colors.dart';
import 'package:evcar/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../../constants/image_strings.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:http/http.dart' as http;

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final String channelId = "2394931";
  final String apiKey = "DGOLL3BJMA7BIDTC";
  late String field1Value;
  late List<String> separatedValues;

  @override
  void initState() {
    super.initState();
    // Initialize the list with empty strings
    separatedValues = ['', '', ''];

    fetchData();
    Future.delayed(const Duration(seconds: 10), fetchData);
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://api.thingspeak.com/channels/$channelId/feeds.json?api_key=$apiKey&results=1'),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);

        if (jsonResponse['feeds'] != null && jsonResponse['feeds'].isNotEmpty) {
          String field1 = jsonResponse['feeds'][0]['field1'] ?? '';
          // Update the state with the original field1 value
          setState(() {
            field1Value = field1;
          });

          // Split the field1 value into a list of separated values
          List<String> values = field1.split(' ');
          // Update the state with the separated values
          setState(() {
            separatedValues = values;
          });
        } else {
          throw Exception('No data available from ThingSpeak');
        }
      } else {
        throw Exception(
            'Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

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
                const Padding(padding: EdgeInsets.all(tDefaultSpace)),
                const Text(
                  'TOYOTA EV & PSU',
                  style: TextStyle(
                      fontSize: 33,
                      fontWeight: FontWeight.w600,
                      color: tPrimaryColor),
                ),

                const Text(
                  'Model: CoE33 & EE55',
                  style: TextStyle(fontSize: 16, color: tPrimaryColor),
                ),
                const Text(
                  'Hello PSU, Welcome to EV Car model Coe & EE',
                  style: TextStyle(fontSize: 12, color: tPrimaryColor),
                ),
                const SizedBox(height: 15),
                Image.asset(tWelcomeScreenImage, width: 300, height: 300),
                const SizedBox(height: 15),

                // Update the Text widgets with the fetched values
                //Text('Value 1: ${separatedValues.length > 0 ? separatedValues[0] : ''}'),
                //Text('Value 2: ${separatedValues.length > 1 ? separatedValues[1] : ''}'),
                //Text('Value 3: ${separatedValues.length > 2 ? separatedValues[2] : ''}'),

                //แสดงค่าแบตเตอรี่ ในรูปแบบ Charging
                CircularPercentIndicator(
                  radius: 100.0,
                  lineWidth: 25.0,
                  animation: true,
                  percent: separatedValues.isNotEmpty
                      ? (double.tryParse(separatedValues[0]) ?? 0.0) / 100.0
                      : 0.0,
                  center: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${(separatedValues.isNotEmpty ? double.tryParse(separatedValues[0]) ?? 0.0 : 0.0) * 1}%",
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w300,
                            color: tPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Colors.red[600],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'Battery',
                        style: TextStyle(fontSize: 15, color: tPrimaryColor),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      // Temp
                      Card(
                        color: tPrimaryColor,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: SizedBox(
                            width: 150,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Temp',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: tPrimaryColor,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Center(
                                  child: Text(
                                    "${(separatedValues.isNotEmpty ? double.tryParse(separatedValues[1]) ?? 0.0 : 0.0) * 1} °C",
                                    style: const TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                      color: tPrimaryColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        color: tPrimaryColor,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: SizedBox(
                            width: 150,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Voltage',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: tPrimaryColor,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Center(
                                  child: Text(
                                    "${(separatedValues.isNotEmpty ? double.tryParse(separatedValues[2]) ?? 0.0 : 0.0) * 1} V",
                                    style: const TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                      color: tPrimaryColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
