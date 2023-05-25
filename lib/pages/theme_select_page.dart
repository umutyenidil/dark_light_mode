import 'package:dark_light_mode/cubits/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class ThemeSelectPage extends StatefulWidget {
  const ThemeSelectPage({Key? key}) : super(key: key);

  @override
  State<ThemeSelectPage> createState() => _ThemeSelectPageState();
}

class _ThemeSelectPageState extends State<ThemeSelectPage> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<double> _lightToDark;
  late Animation<double> _darkToLight;
  late bool isLight;

  @override
  void initState() {
    super.initState();
    isLight = true;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _lightToDark = Tween<double>(begin: 60 / 150, end: 90 / 150).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );
    _darkToLight = Tween<double>(begin: 60 / 150, end: 90 / 150).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            print('tiklandi mode:${isLight ? 'light' : 'dark'}');
            isLight ? _controller.forward() : _controller.reverse();
            if(isLight){
              BlocProvider.of<ThemeCubit>(context).lightToDark();
            }else{
              BlocProvider.of<ThemeCubit>(context).darkToLight();
            }
            isLight = !isLight;
            // _controller.forward();
          },
          child: Lottie.asset(
            'assets/lotties/switch.json',
            frameRate: FrameRate(30),
            controller: isLight ? _darkToLight : _lightToDark,
          ),
        ),
      ),
    );
  }
}
