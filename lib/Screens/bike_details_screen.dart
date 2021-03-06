import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mvp_app_aluguel_bikes/Models/bike.dart';
import 'package:mvp_app_aluguel_bikes/Providers/cart_item.dart';
import 'package:mvp_app_aluguel_bikes/app_routes.dart';
import 'package:provider/provider.dart';

class BikeDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Bike bike = ModalRoute.of(context).settings.arguments as Bike;
    var cartProvider = Provider.of<CartItem>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('${bike.nome}'),
        actions: [
          IconButton(
              icon: Icon(Icons.pedal_bike),
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.CART_DETAIL);
              }),
          Consumer<CartItem>(
            builder: (context, cartItem, _) => Text(cartItem.total.toString()),
          ),
          SizedBox(
            width: 22,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(
              image: CachedNetworkImageProvider(bike.imagemURL),
              fit: BoxFit.cover,
            ),
            Text(
              '${bike.nome}',
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                        text: '${bike.descricao}',
                        style: TextStyle(color: Colors.black87))),
              ),
            ),

            ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black87),
                ),

                onPressed: () {
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
                },
                icon: Icon(Icons.add_shopping_cart_sharp),
                label: Text('Alugar Bike')),

            ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black87)),
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.CART_DETAIL);
                },
                icon: Icon(Icons.shopping_cart),
                label: Text('Ir para o Carrinho'))
          ],
        ),
      ),
    );
  }
}
