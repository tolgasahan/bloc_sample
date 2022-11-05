import 'package:bloc_sample/bloc/cart_bloc.dart';
import 'package:bloc_sample/bloc/product_bloc.dart';
import 'package:bloc_sample/models/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.of(context).pushNamed('/cart'),
          ),
        ],
      ),
      body: buildProductList(),
    );
  }

  Widget buildProductList() {
    return StreamBuilder(
      initialData: productBloc.getAll(),
      stream: productBloc.getStream,
      builder: (context, snapshoot) {
        return snapshoot.data.length > 0
            ? buildProductListItems(snapshoot)
            : Center(
                child: Text("Yükleniyor."),
              );
      },
    );
  }

  buildProductListItems(AsyncSnapshot snapshoot) {
    return ListView.builder(
        itemCount: snapshoot.data.length,
        itemBuilder: (BuildContext context, index) {
          final list = snapshoot.data;
          return ListTile(
            title: Text(list[index].name),
            subtitle: Text(list[index].price.toString()),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                cartBloc.addToCart(Cart(list[index], 1));
              },
            ),
          );
        });
  }
}
