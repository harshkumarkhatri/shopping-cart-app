/// The [dart:async] is neccessary for using streams
import 'dart:async';

class CartItemsBloc {
  /// The [cartStreamController] is an object of the StreamController class
  /// .broadcast enables the stream to be read in multiple screens of our app
  final cartStreamController = StreamController.broadcast();

  /// The [getStream] getter would be used to expose our stream to other classes
  Stream get getStream => cartStreamController.stream;

  final Map allItems = {
    'active': [
      {
        'value': 'true',
      },
    ],
    'inactive': []
  };
  bool mm = false;

  bool gettingvar() {
    mm == true ? mm = false : mm = true;
  }

  void addToCart(item) {
    allItems['active'].remove(item);
    allItems['inactive'].add(item);
    cartStreamController.sink.add(allItems);
  }

  void removeFromCart(item) {
    allItems['inactive'].remove(item);
    allItems['active'].add(item);
    cartStreamController.sink.add(allItems);
  }

  /// The [dispose] method is used
  /// to automatically close the stream when the widget is removed from the widget tree
  void dispose() {
    cartStreamController.close(); // close our StreamController
  }
}

final bloc = CartItemsBloc();
