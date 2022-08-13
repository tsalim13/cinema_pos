import 'package:flutter/material.dart';

import '../const.dart';

class CalendarDay extends StatefulWidget {
  final String dayAbbreviation;
  final String dayNumber;
  final bool isActive;
  final Function callBack;

  const CalendarDay(
      {Key? key,
      required this.dayNumber,
      required this.dayAbbreviation,
      required this.isActive,
      required this.callBack})
      : super(key: key);
  @override
  _CalendarDayState createState() => _CalendarDayState();
}

class _CalendarDayState extends State<CalendarDay> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: InkWell(
        onTap: () {
          widget.callBack();
        },
        child: ClipPath(
          clipper: DolDurmaClipper(
              height: 18, holeRadius: 12, isActive: widget.isActive),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              color: widget.isActive
                  ? kPimaryColor
                  : Color.fromARGB(255, 158, 158, 158),
            ),
            width: 80,
            height: 95,
            padding: EdgeInsets.all(5),
            child: Padding(
              padding: EdgeInsets.only(top: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(widget.dayNumber,
                      style: TextStyle(
                          color:
                              widget.isActive ? kBackgroundColor : Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold)),
                  Text(
                    widget.dayAbbreviation.toUpperCase(),
                    style: TextStyle(
                      color:
                          widget.isActive ? kBackgroundColor : Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DolDurmaClipper extends CustomClipper<Path> {
  DolDurmaClipper(
      {required this.height, required this.holeRadius, required this.isActive});

  final double height;
  final double holeRadius;
  final bool isActive;

  @override
  Path getClip(Size size) {
    final path = Path();
    if (isActive) {
      path
        ..moveTo(0, 0)
        ..lineTo(0, size.height - height - holeRadius)
        ..arcToPoint(
          Offset(0, size.height - height),
          clockwise: true,
          radius: const Radius.circular(1),
        )
        ..lineTo(0, size.height)
        ..lineTo(size.width, size.height)
        ..lineTo(size.width, size.height - height)
        ..arcToPoint(
          Offset(size.width, size.height - height - holeRadius),
          clockwise: true,
          radius: const Radius.circular(1),
        );

      path.lineTo(size.width, 0);
    } else {
      path
        ..moveTo(0, 0)
        ..lineTo(0, size.height)
        ..lineTo(size.width, size.height)
        ..lineTo(size.width, 0);

      path.close();
    }
    path.close();

    final path2 = Path.combine(
      PathOperation.difference,
      path,
      Path()
        ..addOval(Rect.fromCircle(
            center: Offset(size.width / 2, 15), radius: holeRadius / 2))
        ..close(),
    );

    return path2;
  }

  @override
  bool shouldReclip(DolDurmaClipper oldClipper) => true;
}
