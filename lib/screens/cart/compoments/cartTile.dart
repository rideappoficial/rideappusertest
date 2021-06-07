import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rideusertesteapp/common/customIconButton.dart';
import 'package:rideusertesteapp/model/cart_tour.dart';


// Para colocar sobre disponibilidade - ver # 49
class CartTile extends StatelessWidget {
  const CartTile({this.cartTourModel});
  final CartTourModel cartTourModel;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: cartTourModel,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed('/tour', arguments: cartTourModel.tour);
        },
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: <Widget>[
                SizedBox(
                  height: 80,
                  width: 80,
                  child: Image.network(cartTourModel.tour.images.first),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          cartTourModel.tour.title,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                        Consumer<CartTourModel>(builder: (_, cartTour, __) {
                          //if(cartproduct.hasStock)
                          return Text(
                            'R\$ ${cartTour.unitPrice.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                          //else
                          return Text(
                            'Sem estoque disponível.',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
                Consumer<CartTourModel>(builder: (_, cartTourModel, __) {
                  return Column(
                    children: [
                      CustomIconButton(
                        iconData: Icons.add,
                        color: Theme.of(context).primaryColor,
                        onTap: cartTourModel.increment,
                      ),
                      Text('${cartTourModel.quantity}',
                      style: const TextStyle(fontSize: 20),
                      ),
                      CustomIconButton(
                        iconData: Icons.remove,
                        color: cartTourModel.quantity > 1
                            ? Theme.of(context).primaryColor
                            : Colors.red,
                        onTap: cartTourModel.decrement,
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
