import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../bloc/weather_bloc.dart';

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
        child: BlocBuilder<WeatherBloc, WeatherBlocState>(
          builder: (context, state) {
            if (state is WeatherBlocSuccess) {
              return SizedBox(
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
                            '📍 ${state.weather.areaName}',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ), // TextStyle
                          ), // Text
                          const SizedBox(height: 8), // SizedBox
                          Text(
                            'Good Morning',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ), // TextStyle
                          ), // Text
                          Image.asset(
                              'assets/3.png',
                              scale: 0.1,
                          ), // Image
                          Center(
                            child: Text(
                              '${state.weather.temperature!.celsius!.round()}°C',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 55,
                                fontWeight: FontWeight.w400,
                              ), // TextStyle
                            ), // Text
                          ), // Center
                          Center(
                            child: Text(
                              // Weather Condition
                              state.weather.weatherDescription!.toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                              ), // TextStyle
                            ), // Text
                          ), // Center
                          const SizedBox(height: 5), // SizedBox
                          Center(
                            child: Text(
                              // Day, Date and Time
                              DateFormat('EEEE dd ·').add_jm().format(state.weather.date!),
                              // 'Friday 16 - 09:41AM',
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
                                    'assets/17.png',
                                    scale: 1.4,
                                  ), // Image.asset
                                  const SizedBox(width: 5), // SizedBox
                                  Column(
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
                                        // Sunrise Time
                                        DateFormat().add_jm().format(state.weather.sunrise!),
                                        style: const TextStyle(
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
                                    'assets/18.png',
                                    scale: 1.4,
                                  ), // Image.asset
                                  const SizedBox(width: 5), // SizedBox
                                  Column(
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
                                        // Sunset Time
                                        DateFormat().add_jm().format(state.weather.sunset!),
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
                                    'assets/20.png',
                                    scale: 1.4,
                                  ), // Image.asset
                                  const SizedBox(width: 5), // SizedBox
                                  Column(
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
                                        // Maximum Temp
                                        '${state.weather.tempMax!.celsius!.round()}°C',
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
                                    'assets/21.png',
                                    scale: 1.4,
                                  ), // Image.asset
                                  const SizedBox(width: 5), // SizedBox
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Min Temp',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                        ), // TextStyle
                                      ), // Text
                                      const SizedBox(height: 3), // SizedBox
                                      Text(
                                        // Minimum Temperature
                                        '${state.weather.tempMin!.celsius!.round()}°C',
                                        style: const TextStyle(
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
              );
            } else {
              return Container();
            }
          },
        ), // SizedBox
      ), // Padding
    ); // Scaffold
  }
}
