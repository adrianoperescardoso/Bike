import 'package:flutter/material.dart';
import 'package:mvp_app_aluguel_bikes/Providers/cart_item.dart';
import 'package:mvp_app_aluguel_bikes/Providers/cart_provider.dart';
import 'package:mvp_app_aluguel_bikes/Screens/bike_details_screen.dart';
import 'package:mvp_app_aluguel_bikes/Screens/bikes_overview_screen.dart';
import 'package:mvp_app_aluguel_bikes/Screens/cart_detail_screen.dart';
import 'package:mvp_app_aluguel_bikes/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CartProvider(
      child: ChangeNotifierProvider(
        create: (context) => CartItem(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BikeOverviewScreen(),
        routes: {
          AppRoutes.BIKE_DETAIL: (context) => BikeDetailsScreen(),
          AppRoutes.CART_DETAIL: (context) => CartDetailScreen(),
        },
      ),
      ),
    );
  }
}
