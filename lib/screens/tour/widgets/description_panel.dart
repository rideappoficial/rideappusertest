import 'package:flutter/material.dart';

class DescriptionPanel extends StatefulWidget {

  @override
  _DescriptionPanelState createState() => _DescriptionPanelState();
}

class _DescriptionPanelState extends State<DescriptionPanel> {

  bool open = false;
  String description = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 18),
          child: Text(
            "Descrição",
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 18),
          child: Text(
            description,
            maxLines: open ? null : 3,
            textAlign: TextAlign.justify,
            overflow: open ? null : TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              letterSpacing: 1
            ),
          ),
        ),
        if(/* open || */description.length < 100) const SizedBox(
          height: 18,
        ) else Align(
          alignment: Alignment.centerLeft,
          child: FlatButton(
            padding: EdgeInsets.zero,
            child: Text(
              open ? "Diminuir descrição" : "Ver descrição completa",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).primaryColor
              ),
            ),
            onPressed: () {
              setState(() {
                open = !open;
              });
            },
          ),
        ),
      ],
    );
  }
}
