import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark
        ), // SystemUiOverlayStyle
      ), // AppBar
      body: Padding(
        // from Left Top Right Bottom
        // kToolbarHeight is a constant provided by Flutter
        padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: SizedBox(
          // body will be the entire height of the screen
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepPurple,
                  ), // BoxDecoration
                ), // Container
              ), // Align
              Align( // Align
                alignment: const AlignmentDirectional(-3, -0.3),
                child: Container(
                    height: 300,
                    width: 300,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.deepPurple,
                    ) // BoxDecoration
                ), // Container
              ), // Align
              Align(
                alignment: const AlignmentDirectional(0, -1.2),
                child: Container(
                  height: 300,
                  width: 600,
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                  ), // BoxDecoration
                ), // Container
              ), // Align
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0), // ImageFilter.blur
                child: Container(
                  decoration: BoxDecoration(color: Colors.transparent), // BoxDecoration
                ), // Container
              ), // BackdropFilter
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Johannesburg',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ), // TextStyle
                    ), // Text
                    const SizedBox(height: 8), // SizedBox
                    const Text(
                      'Good Morning',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ), // TextStyle
                    ), // Text
                    Image.asset(
                        'assets/3.png'
                    ), // Image
                    const Center(
                      child: Text(
                        '21`C',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 55,
                          fontWeight: FontWeight.w400,
                        ), // TextStyle
                      ), // Text
                    ), // Center
                    const Center(
                      child: Text(
                        'SUNNY',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ), // TextStyle
                      ), // Text
                    ), // Center
                    const SizedBox(height: 5), // SizedBox
                    const Center(
                      child: Text(
                        'Friday 16 - 09:41AM',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ), // TextStyle
                      ), // Text
                    ), // Center
                    const SizedBox(height: 30), // SizedBox
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/1.png',
                              scale: 1.4,
                            ), // Image.asset
                            const SizedBox(width: 5), // SizedBox
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sunrise',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ), // TextStyle
                                ), // Text
                                SizedBox(height: 3), // SizedBox
                                Text(
                                  '5:34AM',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ), // TextStyle
                                ), // Text
                              ],
                            ), // Column
                          ],
                        ), // Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/1.png',
                              scale: 1.4,
                            ), // Image.asset
                            const SizedBox(width: 5), // SizedBox
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sunset',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ), // TextStyle
                                ), // Text
                                SizedBox(height: 3), // SizedBox
                                Text(
                                  '5:34AM',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ), // TextStyle
                                ), // Text
                              ],
                            ), // Column
                          ],
                        ), // Row
                      ],
                    ), // Row
                    const Padding(
                      padding:  EdgeInsets.symmetric(vertical: 5.0),
                      child: Divider(
                        color: Colors.grey,
                      ), // Divider
                    ), // Padding
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/1.png',
                              scale: 1.4,
                            ), // Image.asset
                            const SizedBox(width: 5), // SizedBox
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Max Temp',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ), // TextStyle
                                ), // Text
                                SizedBox(height: 3), // SizedBox
                                Text(
                                  '25`C',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ), // TextStyle
                                ), // Text
                              ],
                            ), // Column
                          ],
                        ), // Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/1.png',
                              scale: 1.4,
                            ), // Image.asset
                            const SizedBox(width: 5), // SizedBox
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Min Temp',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ), // TextStyle
                                ), // Text
                                SizedBox(height: 3), // SizedBox
                                Text(
                                  '13`C',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ), // TextStyle
                                ), // Text
                              ],
                            ), // Column
                          ],
                        ), // Row
                      ],
                    ), // Row
                  ],
                ), // Column
              ), // SizedBox
            ],
          ), // Stack
        ), // SizedBox
      ), // Padding
    ); // Scaffold
  }
}
