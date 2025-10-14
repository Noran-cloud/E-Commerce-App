import 'package:flutter/material.dart';
import 'package:rwad2/DI/di.dart';
import 'package:rwad2/Services/user_service.dart';
import 'package:rwad2/models/SearchProducts.dart';

class SearchForProducts extends StatefulWidget {
  const SearchForProducts({super.key});

  @override
  State<SearchForProducts> createState() => _SearchForProductsState();
}

class _SearchForProductsState extends State<SearchForProducts> {
    final userService = locator<UserService>();
  var search_products = SearchProducts();

  void searchProduct() async{
    search_products = await userService.searchProducts();
    setState(() {
      
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchProduct();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder( 
        itemCount: search_products.products?.length,
        itemBuilder: (context,index){
         final search_product = search_products.products?[index];
         return Row(
          children: [
             Image.network(search_product?.thumbnail??'',width: 120,height: 100,),
             Expanded(
               child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(search_product?.title??'',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                Text(search_product?.description??"",style: TextStyle(color: Colors.grey,fontFamily: 'LibreBaskerville'),),
                SizedBox(height: 10,),
               ],),
             )
          ],                   
         );
        }),
    );
  }
}