import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class UserPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 18, bottom: 18),
          child: Text(
            "Últimas avaliações",
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600
            ),
          ),
        ),
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(bottom: 8),
          child: SmoothStarRating(
            allowHalfRating: false,
            onRated: (v) {},
            starCount: 5,
            rating: 4.5,
            size: 35.0,
            isReadOnly: false,
            // fullRatedIconData: Icons.blur_off,
            // halfRatedIconData: Icons.blur_on,
            color: Colors.yellow,
            borderColor: Colors.yellow,
            spacing:0.0,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 18),
          child: Text(
            "A avaliação deste passeio é realizada pelas últimas 100 pessoas que "
            " fizeram o passeio.",
            style: TextStyle(
              color: Colors.grey[800]
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(bottom: 16),
          color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Esse é um passeio fantástico a se realizar com a familia",
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Nome da pessoa",
                style: TextStyle(
                    color: Colors.grey
                ),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(bottom: 16),
          color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Esse é um passeio fantástico a se realizar com a familia",
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Nome da pessoa",
                style: TextStyle(
                    color: Colors.grey
                ),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(bottom: 16),
          color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Esse é um passeio fantástico a se realizar com a familia",
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Nome da pessoa",
                style: TextStyle(
                    color: Colors.grey
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
