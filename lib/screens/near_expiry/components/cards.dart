import 'package:flutter/material.dart';
import 'package:report_samples/data/near_expiry.dart';
import 'package:report_samples/data/slow_moving.dart';

class Cards extends StatefulWidget {
  const Cards({super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  int minDaysBeforeExpiration = 0;
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
                      "$minDaysBeforeExpiration Units",
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
                  "Sold Stocks",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void computeCardValues() {
    int daysBeforeExpiration = 0;
    List listahan = [];

    for (var i = 0; i < nearExpiryData.length; i++) {
      final daysBeforeExpirationList =
          nearExpiryData[i]["days_before_expiration"];
      listahan.add(int.parse(nearExpiryData[i]["days_before_expiration"]));

      if (int.parse(daysBeforeExpirationList) > daysBeforeExpiration) {
        daysBeforeExpiration = int.parse(daysBeforeExpirationList);
      }
    }
    print(listahan..sort());

    for (var i = 0; i < 2; i++) {
      final daysBeforeExpirationList =
          nearExpiryData[i]["days_before_expiration"];
      listahan.add(int.parse(nearExpiryData[i]["days_before_expiration"]));

      if (int.parse(daysBeforeExpirationList) > daysBeforeExpiration) {
        daysBeforeExpiration = int.parse(daysBeforeExpirationList);
      }
    }
    setState(() {
      minDaysBeforeExpiration = daysBeforeExpiration;
    });
  }
}
