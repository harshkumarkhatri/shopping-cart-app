import 'package:shopping_cart_app/bloc/cart_items_bloc.dart';
import 'package:flutter/material.dart';

class ShopItems extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/checkout'),
          )
        ],
      ),
      body: ShopItemsWidget(),
    );
  }
}

class ShopItemsWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: bloc.allItems,
      stream: bloc.getStream,
      builder: (context, snapshot) {
        return snapshot.data["active"].length > 0
            ? shopItemsListBuilder(snapshot)
            : Column(
                children: [
                  Center(child: forText()),
                  RaisedButton(
                    onPressed: () {
                      bloc.gettingvar();
                      print(bloc.mm);
                    },
                    child: Text("Change var"),
                  ),
                ],
              );
      },
    );
  }
}

Widget forText() {
  return Text(bloc.mm.toString());
}

Widget shopItemsListBuilder(snapshot) {
  return ListView.builder(
    itemCount: snapshot.data["active"].length,
    itemBuilder: (BuildContext context, i) {
      final shopList = snapshot.data["active"];
      return ListTile(
        title: Text(shopList[i]['value']),
        // subtitle: Text("\$${shopList[i]['price']}"),
        trailing: IconButton(
          icon: Icon(Icons.add_shopping_cart),
          onPressed: () {
            bloc.addToCart(shopList[i]);
            print(bloc.gettingvar());
          },
        ),
        onTap: () {},
      );
    },
  );
}
