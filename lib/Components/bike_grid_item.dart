import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mvp_app_aluguel_bikes/Models/bike.dart';
import 'package:mvp_app_aluguel_bikes/Providers/cart_item.dart';
import 'package:mvp_app_aluguel_bikes/app_routes.dart';
import 'package:provider/provider.dart';

class BikeGridItem extends StatelessWidget {
  final Bike bike;
  BikeGridItem(this.bike);

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartItem>(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(AppRoutes.BIKE_DETAIL, arguments: bike);
      },
      child: GridTile(
        child: Image(
          image: CachedNetworkImageProvider(bike.imagemURL),
          fit: BoxFit.cover,
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            '${bike.nome}',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
          subtitle: Text(
            'R\$ ${bike.preco}',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          trailing: GestureDetector(
            child: Icon(Icons.add_shopping_cart),
            onTap: () {

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(cartProvider.Validar(bike)),
                  // duration: Duration(seconds: 2 ),
                  action: SnackBarAction(
                    label: 'OK',
                    onPressed: (){},
                  ),
                ),
              );

              cartProvider.sumPrince(bike);
              print('Quantidade de Bikes no Cart: ${cartProvider.total}');
            },
          ),
        ),
      ),
    );
  }
}
