import 'package:flutter/material.dart';

import 'choice_card.dart';

class BuyPanel extends StatefulWidget {
  @override
  _BuyPanelState createState() => _BuyPanelState();
}

class _BuyPanelState extends State<BuyPanel> {

  TextEditingController _controller = TextEditingController();
  int _quantidade = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        /*
        Padding(
          padding: const EdgeInsets.only(top:18, bottom: 18),
          child: Text(
            "Comprar passeio",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700
            )
          ),
        ),
        Text(
          "Defina a quantidade de pessoas (incluindo crianças) que realizaram este passeio.",
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: 15
          ),
        ),
        Row(
          children: [
            Container(
              height: 50,
              margin: const EdgeInsets.symmetric(vertical: 24),
              child: RaisedButton(
                color: Color(0xffEE5C36),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)
                ),
                onPressed: (){
                  if(_quantidade > 1) {
                    _quantidade--;
                    _controller.text = _quantidade.toString();
                  }
                },
                child: Icon(Icons.arrow_back_ios, color: Colors.white,),
              ),
            ),
            const SizedBox(width: 12),
            Flexible(
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800
                ),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                    focusColor: Colors.black,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                    )
                ),
              ),
            ),
            const SizedBox(width: 12),
            Container(
              height: 50,
              margin: const EdgeInsets.symmetric(vertical: 24),
              child: RaisedButton(
                color: Color(0xffEE5C36),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)
                ),
                onPressed: (){
                  _quantidade++;
                  _controller.text = _quantidade.toString();
                },
                child: Icon(Icons.arrow_forward_ios, color: Colors.white,),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Total:",
              style: TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.w400,
                fontSize: 20
              ),
            ),
            Text(
              "R\$ 350,00",
              style: TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.w500,
                fontSize: 20
              )
            ),
          ],
        ),

        */
      // - - -
      /*
      SizedBox(
      height: 44,
      child: RaisedButton(
        color: Theme.of(context).primaryColor,,
        textColor: Colors.white,
        onPressed: () {
          Navigator.of(context).pushNamed('/cart');
        },
        child: Text('Adicionar ao Carrinho',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    ),
    */
    // - - -
        ///*
        Container(
          height: 50,
          margin: const EdgeInsets.symmetric(vertical: 24),
          child: RaisedButton(
            color: Theme.of(context).primaryColor,
            disabledColor: Color(0xffEE5C36).withAlpha(150),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25)
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/cart');
              /*
              showDialog(
                context: context,
                builder: (_) => ChoiceCard()
              );
              */
            },
            child: Text(
              "Comprar",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                letterSpacing: 1
              ),
            ),
          ),
        ),
        //*/
      ],
    );
  }
}
