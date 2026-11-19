import 'package:flutter/material.dart';

void main() => runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Exercise1(),
      ),
    );

class Exercise1 extends StatelessWidget {
  const Exercise1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom buttons"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SelectableButton(isSelected: false),
            SizedBox(height: 10),
            SelectableButton(isSelected: true),
            SizedBox(height: 10),
            SelectableButton(isSelected: false),
            SizedBox(height: 10),
            SelectableButton(isSelected: true),
          ],
        ),
      ),
    );
  }
}

class SelectableButton extends StatefulWidget {
  final bool isSelected;

  const SelectableButton({
    super.key,
    required this.isSelected,
  });

  @override
  State<SelectableButton> createState() => _SelectableButtonState();
}

class _SelectableButtonState extends State<SelectableButton> {
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = widget.isSelected;
  }

  // Getter for text
  String get buttonText {
    if (isSelected) {
      return "Selected";
    } else {
      return "Not Selected";
    }
  }

  // Getter for text color
  Color get textColor {
    if (isSelected) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  // Getter for background color
  Color get backgroundColor {
    if (isSelected) {
      return Colors.blue[500]!;
    } else {
      return Colors.blue[50]!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          elevation: 0,
        ),
        child: Center(
          child: Text(buttonText),
        ),
      ),
    );
  }
}