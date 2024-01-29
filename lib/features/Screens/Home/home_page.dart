import 'dart:convert';
import 'package:evcar/component/background.dart';
import 'package:evcar/component/responsive.dart';
import 'package:evcar/constants/colors.dart';
import 'package:evcar/constants/image_strings.dart';
import 'package:evcar/features/Screens/Home/widgets/home_data.dart';
import 'package:evcar/features/Screens/Home/widgets/home_detail.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:http/http.dart' as http;

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

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
    separatedValues = ['', '', ''];
    fetchData();
    // Schedule periodic data fetching every 10 seconds
    Future.delayed(const Duration(seconds: 10), fetchData);
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://api.thingspeak.com/channels/$channelId/feeds.json?api_key=$apiKey&results=1',
        ),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);

        if (jsonResponse['feeds'] != null && jsonResponse['feeds'].isNotEmpty) {
          String field1 = jsonResponse['feeds'][0]['field1'] ?? '';
          setState(() {
            field1Value = field1;
          });

          List<String> values = field1.split(' ');
          setState(() {
            separatedValues = values;
          });
        } else {
          throw Exception('No data available from ThingSpeak');
        }
      } else {
        throw Exception(
          'Failed to load data. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Responsive(
          desktop: const DesktopHomeSceen(),
          mobile: Column(
            children: [
              const HomeDataScreen(),
              Image.asset(
                tWelcomeScreenImage,
                width: 300,
                height: 300,
              ),
              const SizedBox(height: 20),
              CircularPercentIndicator(
                radius: 100.0,
                lineWidth: 25.0,
                animation: true,
                percent: separatedValues.length > 0
                    ? (double.tryParse(separatedValues[0]) ?? 0.0) / 100.0
                    : 0.0,
                center: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${(separatedValues.length > 0 ? double.tryParse(separatedValues[0]) ?? 0.0 : 0.0) * 1}%",
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
              const SizedBox(height: 10),
              const Text(
                'Battery',
                style: TextStyle(fontSize: 15, color: tPrimaryColor),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TempVoltageCard(
                      label: 'Temp',
                      value: separatedValues.length > 0
                          ? double.tryParse(separatedValues[1]) ?? 0.0
                          : 0.0,
                      unit: '°C',
                    ),
                    const SizedBox(width: 20),
                    TempVoltageCard(
                      label: 'Voltage',
                      value: separatedValues.length > 0
                          ? double.tryParse(separatedValues[2]) ?? 0.0
                          : 0.0,
                      unit: 'V',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DesktopHomeSceen extends StatelessWidget {
  const DesktopHomeSceen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
