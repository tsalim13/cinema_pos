import 'package:cinema_pos/components/calendar_day.dart';
import 'package:cinema_pos/components/keypad.dart';
import 'package:cinema_pos/components/show_time.dart';
import 'package:cinema_pos/const.dart';
import 'package:flutter/material.dart';

class BuyTicket extends StatefulWidget {
  final String title;

  const BuyTicket(this.title, {Key? key}) : super(key: key);

  @override
  _BuyTicketState createState() => _BuyTicketState();
}

class _BuyTicketState extends State<BuyTicket> {
  int _currentShowTime = 1;
  int _currentDay = 3;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 15.0),
          child: Row(
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                decoration: kRoundedFadedBorder,
                child: IconButton(
                    icon: const Icon(
                      Icons.keyboard_arrow_left,
                      size: 28.0,
                    ),
                    onPressed: () {
                      //Navigator.pop(context);
                    }),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .45,
                child: Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.5,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          'Sélectionnez une date'.toUpperCase(),
          style: Theme.of(context).textTheme.headline6!.copyWith(
              //height: 1,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(192, 255, 255, 255),
              fontSize: 22,
              letterSpacing: 2),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            width: MediaQuery.of(context).size.width * 0.45,
            decoration: const BoxDecoration(
              color: Color.fromARGB(134, 0, 0, 0),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25.0),
                topLeft: Radius.circular(25.0),
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: SingleChildScrollView(
                controller: ScrollController(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    CalendarDay(
                      dayNumber: '9',
                      dayAbbreviation: 'MAR',
                      isActive: _currentDay == 1,
                      callBack: () {
                        setState(() {
                          _currentDay = 1;
                        });
                      },
                    ),
                    CalendarDay(
                      dayNumber: '10',
                      dayAbbreviation: 'MER',
                      isActive: _currentDay == 2,
                      callBack: () {
                        setState(() {
                          _currentDay = 2;
                        });
                      },
                    ),
                    CalendarDay(
                      dayNumber: '11',
                      dayAbbreviation: 'JEU',
                      isActive: _currentDay == 3,
                      callBack: () {
                        setState(() {
                          _currentDay = 3;
                        });
                      },
                    ),
                    CalendarDay(
                      dayNumber: '12',
                      dayAbbreviation: 'VEN',
                      isActive: _currentDay == 4,
                      callBack: () {
                        setState(() {
                          _currentDay = 4;
                        });
                      },
                    ),
                    CalendarDay(
                      dayNumber: '13',
                      dayAbbreviation: 'SAM',
                      isActive: _currentDay == 5,
                      callBack: () {
                        setState(() {
                          _currentDay = 5;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Text(
          'Sélectionnez une séance'.toUpperCase(),
          style: Theme.of(context).textTheme.headline6!.copyWith(
              //height: 1,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(192, 255, 255, 255),
              fontSize: 22,
              letterSpacing: 2),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            width: MediaQuery.of(context).size.width * 0.45,
            decoration: const BoxDecoration(
              color: Color.fromARGB(134, 0, 0, 0),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    ShowTime(
                      id: 1,
                      time: '10:00',
                      price: 200,
                      seats: 10,
                      isActive: _currentShowTime == 1,
                      callBack: () {
                        setState(() {
                          _currentShowTime = 1;
                        });
                      },
                    ),
                    ShowTime(
                      id: 2,
                      time: '11:30',
                      price: 500,
                      seats: 30,
                      isActive: _currentShowTime == 2,
                      callBack: () {
                        setState(() {
                          _currentShowTime = 2;
                        });
                      },
                    ),
                    ShowTime(
                      id: 3,
                      time: '13:00',
                      price: 500,
                      seats: 10,
                      isActive: _currentShowTime == 3,
                      callBack: () {
                        setState(() {
                          _currentShowTime = 3;
                        });
                      },
                    ),
                    ShowTime(
                      id: 4,
                      time: '14:30',
                      price: 500,
                      seats: 28,
                      isActive: _currentShowTime == 4,
                      callBack: () {
                        setState(() {
                          _currentShowTime = 4;
                        });
                      },
                    ),
                    ShowTime(
                      id: 5,
                      time: '15:00',
                      price: 200,
                      seats: 7,
                      isActive: _currentShowTime == 5,
                      callBack: () {
                        setState(() {
                          _currentShowTime = 5;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Spacer(),

        Row(
          children: [
            Container(
              child: NumericKeyboard(
                  onKeyboardTap: (value) => {print(value)},
                  textColor: Colors.white,
                  rightButtonFn: () {
                    // setState(() {
                    //   text = text.substring(0, text.length - 1);
                    // });
                  },
                  rightIcon: Icon(
                    Icons.backspace,
                    color: Colors.white,
                  ),
                  // leftButtonFn: () {
                  //   print('left button clicked');
                  // },
                  // leftIcon: Icon(Icons.check, color: Colors.red,),
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 10.0),
                    decoration: const BoxDecoration(
                        color: kActionColor,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(25.0))),
                    child: const InkWell(
                        child: Text('Valider',
                            style: TextStyle(
                              letterSpacing: 2,
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold))),
                  ),
                )
              ],
            )
          ],
        )

        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: <Widget>[
        //     const Padding(
        //       padding: EdgeInsets.only(left: 25.0),
        //       child: Text(
        //         '500 Da',
        //         style: TextStyle(
        //             fontSize: 30.0,
        //             fontWeight: FontWeight.bold,
        //             color: Colors.white),
        //       ),
        //     ),
        //     Container(
        //       padding:
        //           const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
        //       decoration: const BoxDecoration(
        //           color: kActionColor,
        //           borderRadius:
        //               BorderRadius.only(topLeft: Radius.circular(25.0))),
        //       child: const InkWell(
        //           child: Text('Payer',
        //               style: TextStyle(
        //                   color: Colors.white,
        //                   fontSize: 25.0,
        //                   fontWeight: FontWeight.bold))),
        //     )
        //   ],
        // ),
      ],
    );
  }
}
