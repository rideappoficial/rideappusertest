import 'package:flutter/material.dart';

class MainPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24, bottom: 14),
          child: Text(
            "Passeio à Jericoacoara",
            style: TextStyle(
              fontSize: 34,
              letterSpacing: 2.8,
              fontWeight: FontWeight.w300,
              color: Colors.grey[800],
            ),
          ),
        ),
        Text(
          "R\$ 350,00",
          style: TextStyle(
            fontSize: 18,
            letterSpacing: 1,
            fontWeight: FontWeight.w400
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 12),
          child: Text(
            "Visualizado por: 5.369 outras pessoas",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey[600]
            ),
          ),
        ),
      ],
    );
  }
}
