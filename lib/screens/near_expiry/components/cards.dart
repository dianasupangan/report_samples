import 'package:flutter/material.dart';
import 'package:report_samples/data/near_expiry.dart';

class Cards extends StatefulWidget {
  const Cards({super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  int minDaysBeforeExpiration = 0;
  int maxDaysBeforeExpiration = 0;
  List top3 = [];
  @override
  void initState() {
    computeCardValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Total stock cost card
        Card(
          child: Container(
            height: 130,
            width: 160,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$minDaysBeforeExpiration Days",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Until the nearest\nexpiry",
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        Card(
          child: Container(
            height: 130,
            width: 160,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$maxDaysBeforeExpiration Days",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Until the farthest\nexpiry",
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void computeCardValues() {
    List expirationDayList = [];
    List sortedExpirationDayList = [];

    for (var i = 0; i < nearExpiryData.length; i++) {
      expirationDayList
          .add(int.parse(nearExpiryData[i]["days_before_expiration"]));
    }
    sortedExpirationDayList = expirationDayList..sort();

    setState(() {
      minDaysBeforeExpiration = sortedExpirationDayList.first;
      maxDaysBeforeExpiration = sortedExpirationDayList.last;
    });
  }
}
