import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  bool _isElevated = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isElevated = !_isElevated;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(
              milliseconds: 200,
            ),
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
              // when _isElevated is false, value
              // of inset parameter will be true
              // that will create depth effect.
              boxShadow: _isElevated
                  ?
                  // Elevated Effect
                  [
                      const BoxShadow(
                        color: Color(0xFFBEBEBE),
                        // Shadow for bottom right corner
                        offset: Offset(10, 10),
                        blurRadius: 30,
                        spreadRadius: 1,
                        inset: false,
                      ),
                      const BoxShadow(
                        color: Colors.white,
                        // Shadow for top left corner
                        offset: Offset(-10, -10),
                        blurRadius: 30,
                        spreadRadius: 1,
                        inset: false,
                      ),
                    ]
                  :
                  // Depth Effect
                  [
                      const BoxShadow(
                        color: Color(0xFFBEBEBE),
                        // Shadow for bottom right corner
                        offset: Offset(10, 10),
                        blurRadius: 30,
                        spreadRadius: 1,
                        inset: true,
                      ),
                      const BoxShadow(
                        color: Colors.white,
                        // Shadow for top left corner
                        offset: Offset(-10, -10),
                        blurRadius: 30,
                        spreadRadius: 1,
                        inset: true,
                      ),
                    ],
            ),
            child: Icon(
              Icons.power_settings_new,
              size: 80,
              // Changing icon color on
              // the basis of it's elevation
              color: _isElevated
                  ? Colors.grey
                  : const Color.fromARGB(255, 83, 220, 230),
            ),
          ),
        ),
      ),
    );
  }
}
