import 'package:flutter/material.dart';

class CustomStepper extends StatefulWidget {
  CustomStepper(
      {required this.lowerLimit,
      required this.upperLimit,
      required this.stepValue,
      required this.iconSize,
      required this.value,
      required this.onChenged,
      Key? key})
      : super(key: key);
  final int lowerLimit;
  final int upperLimit;
  final int stepValue;
  final double iconSize;

  int value;
  final ValueChanged<dynamic> onChenged;

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.only(right: 2),
              child: Icon(
                Icons.remove,
                color: Colors.black,
                size: 20,
              ),
            ),
            onTap: () {
              setState(() {
                widget.value = widget.value == widget.lowerLimit
                    ? widget.lowerLimit
                    : widget.value -= widget.stepValue;

                widget.onChenged({"qty": widget.value, "type": "-"});
              });
            },
          ),
          SizedBox(
            width: widget.iconSize,
            child: Text(
              widget.value.toString(),
              style: TextStyle(
                fontSize: widget.iconSize * 0.7,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.only(right: 2),
              child: Icon(
                Icons.add,
                color: Colors.black,
                size: 20,
              ),
            ),
            onTap: () {
              setState(() {
                widget.value = widget.value == widget.upperLimit
                    ? widget.upperLimit
                    : widget.value += widget.stepValue;

                widget.onChenged({"qty": widget.value, "type": "+"});
              });
            },
          ),
        ],
      ),
    );
  }
}
