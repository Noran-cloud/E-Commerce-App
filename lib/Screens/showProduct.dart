import 'package:flutter/material.dart';
import 'package:rwad2/DI/di.dart';
import 'package:rwad2/Services/user_service.dart';
import 'package:rwad2/models/getProduct.dart';

class Showproduct extends StatefulWidget {
  const Showproduct({super.key});

  @override
  State<Showproduct> createState() => _ShowproductState();
}

class _ShowproductState extends State<Showproduct> {
    final userService = locator<UserService>();

  var product = GetProduct();

  void getProductFromServer() async{
    product = await userService.getProduct();
    setState(() {
      
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProductFromServer();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column( 
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40,),
              Row(
                children: [
              Image.network(product.thumbnail?? '',width: 170, height: 150,),
              Expanded(
                child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title?? '',softWrap: true,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Text('${product.price}\$',style: TextStyle(color: Colors.green[600]),),
                    Row(
                      children: [
                        Text('${product.rating}'),
                        Image.asset('assets/images/rate.jpg',width: 100,height: 50,)
                      ],
                    )
                  ],
                ),
              ),
        
                ],              
              ),
              SizedBox(height: 40,),
              Text('Description:',style: TextStyle(fontFamily: 'LibreBaskerville',fontWeight: FontWeight.bold,fontSize: 23,),),
              SizedBox(height: 10,),
              Text(product.description??'',style: TextStyle(fontFamily: 'LibreBaskerville'),),
              SizedBox(height: 30,),
              Text('Reviews',style: TextStyle(fontFamily: 'LibreBaskerville',fontWeight: FontWeight.bold,fontSize: 23,)),
              Expanded(child: ListView.builder( physics:NeverScrollableScrollPhysics(),shrinkWrap: true,
                itemCount: product.reviews?.length,
                itemBuilder: (context,index){
                  var review = product.reviews?[index];
                  return Column( crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Image.asset('assets/images/profile.png',width: 50,height: 50,),
                        SizedBox(width: 10,),
                        Column( mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(review?.reviewerName??'',style: TextStyle(fontWeight: FontWeight.bold),),                                               
                            Text(review?.reviewerEmail??'',style: TextStyle(color: Colors.grey,fontSize: 9),),
                            SizedBox(height: 10,),
                            Text(review?.comment??'',style: TextStyle(fontFamily: 'LibreBaskerville',),),
                            SizedBox(height: 5,),                      
                          ],
                        )
                      ],),
                      Container(
                          width: 250,height: 1,color: Colors.black26,
                        ),
                        SizedBox(height: 10,),
                    ],
                  );
                }))
            ],
          ),
        ),
      ),
    );
  }
}