import 'package:cinema_pos/components/booking_summary_row.dart';
import 'package:cinema_pos/components/calendar_day.dart';
import 'package:cinema_pos/components/keypad.dart';
import 'package:cinema_pos/components/show_time.dart';
import 'package:cinema_pos/const.dart';
import 'package:cinema_pos/model.dart';
import 'package:flutter/material.dart';

class TicketsSummary extends StatefulWidget {
  final String title;

  const TicketsSummary(this.title, {Key? key}) : super(key: key);

  @override
  _TicketsSummaryState createState() => _TicketsSummaryState();
}

class _TicketsSummaryState extends State<TicketsSummary> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 15.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .45,
            child: Text(
              'Résumé des billets',
              style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.5,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              controller: ScrollController(),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: movies.length,
                separatorBuilder: (_, i) => const SizedBox(height: 20),
                itemBuilder: (_, i) {
                  final movie = movies[i];
                  final total = 5.0;
                  final noOfSeats = 2;
                  return SizedBox(
                    height: 140,
                    child: GestureDetector(
                      //onTap: () => onTap(context,booking),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          //Booking overview
                          BookingSummaryRow(
                            total: total,
                            noOfSeats: noOfSeats,
                            title: movie.title,
                            showDateTime: DateTime.now(),
                          ),

                          //Movie Image
                          Positioned(
                            bottom: 13,
                            left: 13,
                            child: Container(
                              width: 100,
                              height: 125,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.asset(
                                  movie.imageURL + movie.title + '.jpg',
                                  fit: BoxFit.cover,
                                  // width: movieSize,
                                  // height: movieSize + 25,
                                  // borderRadius: const BorderRadius.all(Radius.circular(10)),
                                  // placeholder: const MoviePosterPlaceholder(iconSize: 40),
                                  // errorWidget: const MoviePosterPlaceholder(iconSize: 40),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
