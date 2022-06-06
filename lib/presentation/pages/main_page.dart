import 'dart:math';

import 'package:advanced_widgets/inherited_widget/app_theme.dart';
import 'package:advanced_widgets/presentation/widgets/weather_indicator.dart';
import 'package:advanced_widgets/presentation/widgets/weather_title.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  ThemeDataType type = ThemeDataType.purple;
  double weather = 1;
  bool details = false;

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _animation = Tween<double>(begin: 1.0, end: 3.0).animate(_controller);
  }

  @override
  void didChangeDependencies() {
    type = AppTheme.getType(context);
    super.didChangeDependencies();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  String title(double weather) {
    String text = '${Random().nextInt(5) + 10} градусов,\nОблачно';
    if (weather == 0) {
      text = '${Random().nextInt(10)} градусов,\nДождь';
    }
    if (weather == 1) {
      text = '${Random().nextInt(5) + 25} градусов,\nСолнечно';
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.of(context, type).primaryColor,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear,
                      top:
                          details ? MediaQuery.of(context).size.height / 5 : 30,
                      right:
                          details ? MediaQuery.of(context).size.width / 3 : 30,
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          setState(() {
                            if (!details) {
                              _controller.forward();
                            } else {
                              _controller.reverse();
                            }
                            details = !details;
                          });
                        },
                        child: ScaleTransition(
                          scale: _animation,
                          child: WeatherIndicator(
                            sizeMultiplier: 1,
                            weather: weather,
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (details)
                ScaleTransition(
                  scale: _animation,
                  child: const SizedBox(height: 30),
                ),
              if (details)
                ScaleTransition(
                  scale: _animation,
                  child: WeatherTitle(
                      child: Text(
                    title(weather),
                    style: TextStyle(
                      fontSize: 17.0,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 1.1
                        ..color = Colors.black,
                    ),
                  )),
                ),
              if (details)
                ScaleTransition(
                  scale: _animation,
                  child: const SizedBox(height: 30),
                ),
              Slider(
                  value: weather,
                  divisions: 2,
                  max: 1,
                  onChanged: (value) {
                    setState(() {
                      weather = value;
                    });
                  }),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    AppTheme.setType(context, ThemeDataType.purple);
                    type = ThemeDataType.purple;
                  });
                },
                style: getButtonTheme(AppTheme.of(context, type)),
                child: const Text('Purple theme'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    AppTheme.setType(context, ThemeDataType.green);
                    type = ThemeDataType.green;
                  });
                },
                style: getButtonTheme(AppTheme.of(context, type)),
                child: const Text('Green theme'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    AppTheme.setType(context, ThemeDataType.blue);
                    type = ThemeDataType.blue;
                  });
                },
                style: getButtonTheme(AppTheme.of(context, type)),
                child: const Text('Blue theme'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    AppTheme.setType(context, ThemeDataType.black);
                    type = ThemeDataType.black;
                  });
                },
                style: getButtonTheme(AppTheme.of(context, type)),
                child: const Text('Black theme'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    AppTheme.setType(context, ThemeDataType.red);
                    type = ThemeDataType.red;
                  });
                },
                style: getButtonTheme(AppTheme.of(context, type)),
                child: const Text('Red theme'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
