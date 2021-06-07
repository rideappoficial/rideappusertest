import 'package:flutter/material.dart';

class DetailsTrip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 18, bottom: 18),
          child: Text(
            "Detalhes do Passeio",
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
                  Text("Serviço de 'transfer'"),
                  const SizedBox(
                    height: 12,
                  ),
                  Text("Máximo de pessoas"),
                  const SizedBox(
                    height: 12,
                  ),
                  Text("Permitido crianças"),
                  const SizedBox(
                    height: 12,
                  ),
                  Text("Tempo do passeio"),
                  const SizedBox(
                    height: 12,
                  ),
                  Text("Disponibilidade"),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sim", style: TextStyle(fontWeight: FontWeight.w800),),
                    const SizedBox(
                      height: 12,
                    ),
                    Text("5 pessoas", style: TextStyle(fontWeight: FontWeight.w800),),
                    const SizedBox(
                      height: 12,
                    ),
                    Text("Não", style: TextStyle(fontWeight: FontWeight.w800),),
                    const SizedBox(
                      height: 12,
                    ),
                    Text("1 hora e 30 minutos", style: TextStyle(fontWeight: FontWeight.w800),),
                    const SizedBox(
                      height: 12,
                    ),
                    Text("9h às 17h", style: TextStyle(fontWeight: FontWeight.w800),)
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
