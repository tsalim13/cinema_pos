import 'package:flutter/material.dart';

import '../const.dart';

class ShowTime extends StatefulWidget {
  bool isActive;

  final int id;

  final int price;

  final String time;

  final int seats;

  final Function callBack;

  ShowTime(
      {Key? key,
      required this.id,
      required this.time,
      required this.price,
      required this.seats,
      this.isActive = false,
      required this.callBack})
      : super(key: key);

  @override
  _ShowTimeState createState() => _ShowTimeState();
}

class _ShowTimeState extends State<ShowTime> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        widget.callBack();
        setState(() {
          widget.isActive = !widget.isActive;
        });
      },
      child: Container(
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: widget.isActive ? kPimaryColor.withOpacity(0.05) : null,
            border: Border.all(
                color: widget.isActive ? kPimaryColor : Colors.white12),
            borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          children: <Widget>[
            Text(
              widget.time,
              style: TextStyle(
                  color: widget.isActive ? kPimaryColor : Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            Text.rich(
              TextSpan(
                children: [
                  WidgetSpan(child: Icon(Icons.local_atm_outlined, color: Colors.green, size: 20)),
                  TextSpan(
                      text: ' ${widget.price} Da',
                      style:
                          const TextStyle(color: Colors.white, fontSize: 18.0)),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                children: [
                  WidgetSpan(child: Icon(Icons.event_seat_sharp, color: kPimaryColor, size: 20)),
                  TextSpan(
                      text: ' ${widget.seats}',
                      style:
                          const TextStyle(color: Colors.white, fontSize: 18.0)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
