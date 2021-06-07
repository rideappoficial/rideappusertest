import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rideusertesteapp/model/credit_card.dart';

import 'card_text_field.dart';

class CardBack extends StatelessWidget {
  const CardBack({
    this.cvvFocus,
    this.creditCard,
  });
  final FocusNode cvvFocus;
  final CreditCard creditCard;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 16,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Container(
        height: 200,
        color: const Color(0xFF1B4B52),
        child: Column(
          children: [
            Container(
              color: Colors.black,
              height: 40,
              margin: EdgeInsets.symmetric(vertical: 16),
            ),
            Row(
              children: [
                Expanded(
                  flex: 70,
                  child: Container(
                    color: Colors.grey[500],
                    margin: const EdgeInsets.only(left: 12),
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    alignment: Alignment.centerRight,
                    height: 40,
                    child: CardTextField(
                      hint: '123',
                      maxLength: 3,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      textAlign: TextAlign.end,
                      textInputType: TextInputType.number,
                      validator: (cvv) {
                        if (cvv.length != 3) return 'Inválido';
                        return null;
                      },
                      focusNode: cvvFocus,
                      onSaved: creditCard.setCvv,
                    ),
                  ),
                ),
                Expanded(
                  flex: 30,
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
