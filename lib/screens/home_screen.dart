import 'package:cinema_pos/model.dart';
import 'package:cinema_pos/screens/buy_ticket.dart';
import 'package:cinema_pos/screens/tickets_summary.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;
  Movie? _selectedMovie = null;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _selectMovie(Movie movie) {
    setState(() {
      _selectedMovie = movie;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _screen = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Row(
          children: [
            Container(
                width: _screen.width * .55,
                child: Expanded(child: BuyTicket('Les Minions 2'))),
            VerticalDivider(width: 1.0),
            Expanded(child: TicketsSummary('buy')),
          ],
        ));
  }
}
