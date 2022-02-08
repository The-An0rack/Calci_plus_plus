import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "calci++",
      home: CalculatorApp(),
    );
  }
}

const Color colorDark = Color(0xFF374352);
const Color colorLight = Color(0xFFe6eeff);

class CalculatorApp extends StatefulWidget {
  CalculatorApp({Key? key}) : super(key: key);

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? colorDark : colorLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: Colors.red,
                child: Text('Result'),
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buttonRounded(
                          title: '0',
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buttonRounded({String title, padding = 20}) {
  return NeuContainer(
    darkMode: darkmode,
    borderRadius: BorderRadius.circular(40),
    child: Container(
      width: padding * 2,
      height: padding * 2,
    ),
  );
}

/*Container(
            child: Center(
              child: NeuContainer(
                darkMode: isDarkMode,
                child: Icon(
                  Icons.android,
                  size: 100,
                ),
              ),
            ),
          ),*/

class NeuContainer extends StatefulWidget {
  final bool? darkMode;
  final Widget? child;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;

  NeuContainer(
      {this.darkMode = false, this.child, this.borderRadius, this.padding});

  @override
  State<NeuContainer> createState() => _NeuContainerState();
}

class _NeuContainerState extends State<NeuContainer> {
  bool _isPressed = false;
  void _onPointerUp(PointerUpEvent event) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onPointerDown(PointerDownEvent event) {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool? darkMode = widget.darkMode;
    return Listener(
      onPointerUp: _onPointerUp,
      onPointerDown: _onPointerDown,
      child: Container(
        padding: widget.padding,
        decoration: BoxDecoration(
          color: darkMode! ? colorDark : colorLight,
          borderRadius: widget.borderRadius,
          boxShadow: [
            BoxShadow(
              color: darkMode ? Colors.black54 : Colors.blueGrey.shade200,
              offset: Offset(4.0, 4.0),
              blurRadius: 15.0,
              spreadRadius: 1.0,
            ),
            BoxShadow(
              color: darkMode ? Colors.blueGrey.shade700 : Colors.white,
              offset: Offset(-4.0, -4.0),
              blurRadius: 15.0,
              spreadRadius: 1.0,
            )
          ],
        ),
        child: widget.child,
      ),
    );
  }
}
