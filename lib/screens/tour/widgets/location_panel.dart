import 'package:flutter/material.dart';

class LocationPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 18, bottom: 18),
          child: Text(
            "Localização",
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text("CEP"),
                  const SizedBox(
                    height: 12,
                  ),
                  Text("Município"),
                  const SizedBox(
                    height: 12,
                  ),
                  Text("Bairro"),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("00000-000"),
                    const SizedBox(
                      height: 12,
                    ),
                    Text("Jericoacoara"),
                    const SizedBox(
                      height: 12,
                    ),
                    Text("Centro")
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
