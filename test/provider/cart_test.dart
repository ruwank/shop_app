import 'package:ecommerce_shop_app/providers/cart.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group('Testing Cart', () {
    var cart = Cart();

    test('Product should be added to cart', (){
      expect(cart.itemCount == 0, true);
      cart.addItem('1', 45.25, 'title');
      expect(cart.itemCount == 1, true);

    });
    test('Cart Product should be removed', () {
      cart.addItem('1', 45.25, 'title');
      cart.addItem('2', 25.25, 'title2');
      expect(cart.itemCount == 2, true);
      cart.removeItem('1');
      expect(cart.itemCount == 1, true);

    });
    test('Number of items should not increment when added same product', () {
      cart.addItem('1', 45.25, 'title');
      expect(cart.itemCount == 1, true);
      cart.addItem('1', 45.25, 'title');
      expect(cart.itemCount == 1, true);
    });
    test('Total amount should  increment when added same product', () {
      cart.addItem('1', 45.25, 'title');
      expect(cart.totalAmount == 45.25, true);
      cart.addItem('1', 45.25, 'title');
      expect(cart.totalAmount == 90.50, true);
    });
  });
}