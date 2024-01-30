import 'package:evcar/constants/colors.dart';
import 'package:evcar/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:evcar/component/background.dart';
import 'package:evcar/component/responsive.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  String selectedCarColor = 'White'; // Default color

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
          desktop: _buildDesktopView(),
          mobile: _buildMobileView(),
        ),
      ),
    );
  }

  Widget _buildDesktopView() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                tWelcomeScreenImage,
                height: 400,
                width: 400,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildHeader(),
                _buildCircularIndicator(),
                _buildBatteryText(),
                _buildTempVoltageRow(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileView() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(10),
        ),
        _buildHeader(),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset(
              tWelcomeScreenImage,
              height: 350,
              width: 350,
            ),
          ),
        ),
        _buildCircularIndicator(),
        _buildBatteryText(),
        _buildTempVoltageRow(),
      ],
    );
  }

  Widget _buildHeader() {
    return const Column(
      children: [
        Text(
          'TOYOTA EV & PSU',
          style: TextStyle(
            fontSize: 33,
            fontWeight: FontWeight.w600,
            color: tPrimaryColor,
          ),
        ),
        Text(
          'Model: CoE33 & EE55',
          style: TextStyle(fontSize: 16, color: tPrimaryColor),
        ),
        Text(
          'Hello PSU, Welcome to EV Car model Coe & EE',
          style: TextStyle(fontSize: 12, color: tPrimaryColor),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildCircularIndicator() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: CircularPercentIndicator(
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
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w300,
                  color: (separatedValues.isNotEmpty)
                      ? (double.tryParse(separatedValues[0]) ?? 0.0) > 30
                          ? Colors.green
                          : (double.tryParse(separatedValues[0]) ?? 0.0) <=
                                      30 &&
                                  (double.tryParse(separatedValues[0]) ?? 0.0) >
                                      20
                              ? Colors.yellow
                              : Colors.red
                      : tPrimaryColor,
                ),
              ),
            ],
          ),
        ),
        circularStrokeCap: CircularStrokeCap.round,
        progressColor: (separatedValues.isNotEmpty)
            ? (double.tryParse(separatedValues[0]) ?? 0.0) > 30
                ? Colors.green
                : (double.tryParse(separatedValues[0]) ?? 0.0) <= 30 &&
                        (double.tryParse(separatedValues[0]) ?? 0.0) > 20
                    ? Colors.yellow
                    : Colors.red
            : Colors.red[600],
      ),
    );
  }

  Widget _buildBatteryText() {
    return Column(
      children: [
        Text(
          'Battery',
          style: TextStyle(
            fontSize: 15,
            color: (separatedValues[0].isNotEmpty)
                ? (double.tryParse(separatedValues[0]) ?? 0.0) > 30
                    ? Colors.green
                    : (double.tryParse(separatedValues[0]) ?? 0.0) <= 30 &&
                            (double.tryParse(separatedValues[0]) ?? 0.0) > 20
                        ? Colors.yellow
                        : Colors.red
                : tPrimaryColor,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildTempVoltageRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TempVoltageCard(
            label: 'Temp',
            value: separatedValues.isNotEmpty
                ? double.tryParse(separatedValues[1]) ?? 0.0
                : 0.0,
            unit: '°C',
          ),
          const SizedBox(width: 5),
          TempVoltageCard(
            label: 'Voltage',
            value: separatedValues.isNotEmpty
                ? double.tryParse(separatedValues[2]) ?? 0.0
                : 0.0,
            unit: 'V',
          ),
        ],
      ),
    );
  }
}

class TempVoltageCard extends StatelessWidget {
  final String label;
  final double value;
  final String unit;

  const TempVoltageCard({
    super.key,
    required this.label,
    required this.value,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 36, 35, 35),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          width: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: tPrimaryColor,
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  "${value * 1} $unit",
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: tPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
