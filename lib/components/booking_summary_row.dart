import 'package:cinema_pos/const.dart';
import 'package:flutter/material.dart';

class BookingSummaryRow extends StatelessWidget {
  final String title;
  final int noOfSeats;
  final double total;
  final DateTime showDateTime;

  const BookingSummaryRow({
    Key? key,
    required this.total,
    required this.title,
    required this.noOfSeats,
    required this.showDateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Ticket total and movie name
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(134, 0, 0, 0),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(125, 10, 5, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Movie data
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Spacer(),


                  //Show timings row
                  Row(
                    children: [
                      //Show date icon
                      const Icon(
                        Icons.date_range_outlined,
                        size: 19,
                        color: kPimaryColor,
                      ),

                      const SizedBox(width: 10),

                      //Show time data
                      Text(
                        DateTime.now().toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  //Show payment row
                  Row(
                    children: [
                      //Total icon
                      const Icon(
                        Icons.local_atm_outlined,
                        size: 19,
                        color: Colors.green,
                      ),

                      const SizedBox(width: 10),

                      //Total data
                      Text(
                        '$total Da',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          //No of seats
          SizedBox(
            height: double.infinity,
            width: 45,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [kPimaryColor, kActionColor],
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Ticket icon
                  const Icon(
                    Icons.local_activity_sharp,
                    color: Colors.white,
                  ),

                  const SizedBox(height: 5),

                  //No. of seats
                  Text(
                    '$noOfSeats',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
