import 'package:ecom_user_app/page/checkout_page.dart';
import 'package:ecom_user_app/page/user_address_page.dart';
import 'package:ecom_user_app/providers/cart_provider.dart';
import 'package:ecom_user_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  static const String routeName = '/cart';

  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Cart'),),
      body: Consumer<CartProvider>(
        builder: (context, provider, child) =>
            Column(
              children: [
                Expanded(
                    child: ListView.builder(
                      itemCount: provider.cartList.length,
                      itemBuilder: (context, index) {
                        final cartM = provider.cartList[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                cartM.imageUrl!
                            ),
                          ),
                          title: Text(cartM.productName!),
                          trailing:
                            Text('${currencySymbol}${provider
                              .unitPriceWithQuantity(cartM)}'),

                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Unit Price:$currencySymbol ${cartM
                                  .salePrice}'),
                              Row(
                                children: [
                                  IconButton(onPressed: () {
                                    provider.decreaseQuantity(cartM);
                                  },
                                      icon: Icon(
                                        Icons.remove_circle_outline, size: 30,)),
                                  Text('${cartM.quantity}',style: TextStyle(fontSize: 17),),
                                  IconButton(onPressed: () {
                                    provider.increaseQuantity(cartM);
                                  },
                                      icon: Icon(
                                        Icons.add_circle_outline, size: 30,)),
                                 const Spacer(),
                                  IconButton(onPressed: (){
                                    provider.removeFromCart(cartM.productId!);
                                  }, icon: Icon(Icons.delete))
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('SubTotal :$currencySymbol ${provider.getCartSubTotal()}',style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold),),
                          TextButton(onPressed:provider.totalItemsInCart == 0? null :
                              (){
                            Navigator.pushNamed(context,CheckoutPage.routeName);
                          },
                              child: Text('CHECKOUT')),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
      ),
    );
  }
}