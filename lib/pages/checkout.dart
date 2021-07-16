import 'package:flutter/material.dart';
import 'package:shopping_cart_app/bloc/cart_items_bloc.dart';

class Checkout extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Checkout')),
      body: StreamBuilder(
        stream: bloc.getStream,
        initialData: bloc.allItems,
        builder: (context, snapshot) {
          return snapshot.data['inactive'].length > 0
              ? Column(
                  children: <Widget>[
                    /// The [checkoutListBuilder] has to be fixed
                    /// in an expanded widget to ensure it
                    /// doesn't occupy the whole screen and leaves
                    /// room for the the RaisedButton
                    Expanded(child: checkoutListBuilder(snapshot)),
                    RaisedButton(
                      onPressed: () {
                        bloc.gettingvar();
                      },
                      child: Text("Change var"),
                    ),
                    RaisedButton(
                      onPressed: () {},
                      child: Text("Checkout"),
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(height: 40)
                  ],
                )
              : Column(
                  children: [
                    Center(child: Text("You haven't taken any item yet")),
                    RaisedButton(
                      onPressed: () {
                        bloc.gettingvar();
                      },
                      child: Text("Change var"),
                    ),
                  ],
                );
        },
      ),
    );
  }
}

Widget checkoutListBuilder(snapshot) {
  return ListView.builder(
    itemCount: snapshot.data["inactive"].length,
    itemBuilder: (BuildContext context, i) {
      final cartList = snapshot.data["inactive"];
      return ListTile(
        title: Text(cartList[i]['value']),
        // subtitle: Text("\$${cartList[i]['price']}"),
        trailing: IconButton(
          icon: Icon(Icons.remove_shopping_cart),
          onPressed: () {
            bloc.removeFromCart(cartList[i]);
          },
        ),
        onTap: () {},
      );
    },
  );
}
