import 'package:flutter/material.dart';
import 'package:mvp_app_aluguel_bikes/Models/bike.dart';
import 'package:mvp_app_aluguel_bikes/Providers/cart_item.dart';
import 'package:provider/provider.dart';



class CartDetailScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartItem>(context);
    final List<Bike> bikes = Provider.of<CartItem>(context).bikes;
    return Scaffold(
      appBar: AppBar(
        title: Text ('Registro de Aluguel'),
        backgroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, int index) => const Divider(),
                itemCount: bikes.length,
                itemBuilder: (context, index){
                  return Card(
                    child: ListTile(
                      trailing: GestureDetector(
                          onTap: (){
                            cartProvider.removeBike(bikes[index]);
                            cartProvider.mPrince(bikes[index]);

                          },
                        child: Icon(Icons.remove_shopping_cart_rounded)),
                      title: Text('${bikes[index].nome}'),
                    ),
                  );
                },),
            ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.black87)
                ),
                onPressed: () {},

                icon: Icon(Icons.payment),
                label: Text('O Aluguel para ${cartProvider.total} bikes é de R\$ '
                    '${cartProvider.valor.toStringAsFixed(2)}')
            )
          ],
        ),

      ),
    );
  }
}
