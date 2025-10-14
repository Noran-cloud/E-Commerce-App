import 'package:flutter/material.dart';
import 'package:rwad2/DI/di.dart';
import 'package:rwad2/Services/user_service.dart';
import 'package:rwad2/models/productsModel.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({super.key});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  final userService = locator<UserService>();
  ProductsModel productsModel = ProductsModel();

  void getProductsFromServer() async{
    final response = await userService.getAllProducts();
    setState(() {
      productsModel = response;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProductsFromServer();
  }
   var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(Icons.arrow_back_ios),
          title: Text('All Products',style: TextStyle(fontFamily: 'LibreBaskerville',fontSize: 25, color: Colors.black),),
        ),
        backgroundColor: Colors.white,
        body: ListView.builder(
                itemCount: productsModel.products?.length?? 0,
                itemBuilder: (context,index){
                  final product = productsModel.products![index];
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 35,
                      child: Image.network(product.thumbnail??'',)),
                    title: Text(product.title?? 'no title',style: TextStyle(fontFamily: 'LibreBaskerville',color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17),),
                    subtitle: Text(product.brand?? 'no brand',style: TextStyle(fontFamily: 'LibreBaskerville',color: Colors.deepPurple),),
                    trailing: Text('${product.price}\$',style: TextStyle(color: const Color.fromARGB(255, 119, 119, 119),fontSize: 13),),
                  );
                }),          
    );
  }
}
