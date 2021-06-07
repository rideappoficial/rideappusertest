import 'package:flutter/material.dart';
import 'package:rideusertesteapp/model/toursModel.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class TourListTile extends StatelessWidget {
  const TourListTile({this.tourModel});
  final TourModel tourModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/tour', arguments: tourModel);
      },
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 12.0 / 6.0,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
                child: Image.network(
                  tourModel.images.first,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 2.0),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tourModel.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w800
                      ),
                    ),
                    Text(
                      tourModel.description,
                      //"Passeio em Jericoacoara para conhecer a pedra furada",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 15.0
                      ),
                    ),
                    const SizedBox(height: 8.0,),
                    SmoothStarRating(
                      allowHalfRating: false,
                      onRated: (v) {},
                      starCount: 5,
                      rating: 4.5,
                      size: 18.0,
                      isReadOnly: false,
                      // fullRatedIconData: Icons.blur_off,
                      // halfRatedIconData: Icons.blur_on,
                      color: Colors.yellow,
                      borderColor: Colors.yellow,
                      spacing:0.0,
                    ),
                    const SizedBox(height: 8.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 4.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Tempo",
                                style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800
                                ),
                              ),
                              Text(
                                "45 minutos",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 4.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total de visitantes",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black38,
                                    fontWeight: FontWeight.w800
                                ),
                              ),
                              Text(
                                "2.587",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w800
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
