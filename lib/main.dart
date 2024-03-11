import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/app_colors.dart';
import 'package:flutter_application_1/widgets/container_with_icon.dart';
import 'package:flutter_application_1/widgets/step_block.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final int _rowLength = 5;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyRoundedContainerWithIcon(
                    iconData: Icons.arrow_back_ios_new,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    'Indicate the\n number of days',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                  MyRoundedContainerWithIcon(iconData: Icons.close),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < _rowLength; i++)
                  StepBlock(
                    isActive: i == _currentIndex,
                    isNextActive: i == _currentIndex + 1,
                  ),
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border:
                        Border.all(color: notActiveElementColor, width: 2.0),
                  ),
                  child: Center(
                    child: Text(
                      ' ${_currentIndex % _rowLength + 1}',
                      style: const TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 5),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (_currentIndex < _rowLength - 1) {
                      _currentIndex++;
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  backgroundColor: activeElementColor,
                  padding: const EdgeInsets.all(15.0),
                ).copyWith(
                  fixedSize: MaterialStateProperty.all<Size>(
                    const Size(double.infinity, 70),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Next',
                      style: TextStyle(color: textColorOnButton),
                    ),
                    SizedBox(width: 8),

                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 15,
                    ), 
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
              child: TextButton(
                child: const Text(
                  "Later",
                  style: TextStyle(color: activeElementColor, fontSize: 15),
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
