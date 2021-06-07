import 'package:flutter/material.dart';
import 'package:rideusertesteapp/model/cart_tour.dart';

class OrderTourTile extends StatelessWidget {
  final CartTourModel cartTourModel;
  const OrderTourTile({this.cartTourModel});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed('/tour', arguments: cartTourModel.tour);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: Image.network(cartTourModel.tour.images.first),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartTourModel.tour.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                  /*
                  Text(
                    cartProduct.size,
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                  */
                  Text(
                    'R\$ ${(cartTourModel.fixedPrice ?? cartTourModel.unitPrice).toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Text('${cartTourModel.quantity}',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}