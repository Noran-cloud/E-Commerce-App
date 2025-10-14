import 'package:dio/dio.dart';
import 'package:rwad2/models/SearchProducts.dart';
import 'package:rwad2/models/getProduct.dart';
import 'package:rwad2/models/loginResponse.dart';
import 'package:rwad2/models/movies.dart';
import 'package:rwad2/models/productsModel.dart';
import 'package:rwad2/models/userComments.dart';
import 'package:rwad2/models/users.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  final Dio dio;
  UserService(this.dio);

Future<List<Users>> getHttp() async {
  List<Users> users = [];
  try{
      final response = await dio.get('https://jsonplaceholder.typicode.com/users');
      print(response);
      List<dynamic> data = response.data;
      users = data.map((user)=>Users.fromJson(user)).toList();
  }
  catch(e){
    print(e);
  }
  return users;
}


  Future<List<UserComments>> getComments() async {
    List<UserComments> userComments = [];
    try {
      final response = await dio.get('https://jsonplaceholder.typicode.com/comments'); 
      print("Status code: ${response.statusCode}");
        List<dynamic> data = response.data;
        userComments = data.map((comment) => UserComments.fromJson(comment)).toList();
    } catch (e) {
      print("e");
    }
    return userComments;
  }

Future<Movies> getMovies() async {
    var movies = Movies() ;
    try {
      final response = await dio.get('https://imdb.iamidiotareyoutoo.com/search',queryParameters: {'q': 'Spiderman'}); 
      print("Status code: ${response.statusCode}");
        movies =  Movies.fromJson(response.data);
    } catch (e) {
      print("e");
    }
    return movies;
  }

Future<LoginResponse> login(String name, String pass) async{
  var loginResponse = LoginResponse();
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  try{
    final response = await dio.post('https://dummyjson.com/auth/login',data: {
      "username": name,
      "password": pass,
      "expiresInMins": 30
    });
    print(response);
    loginResponse = LoginResponse.fromJson(response.data);
    await preferences.setString("accessToken", loginResponse.accessToken?? '');
    await preferences.setString("refreshToken", loginResponse.refreshToken?? '');
  }
  catch(e){
    print(e);
  }
  return loginResponse;
}

Future<void> refreshToken() async{
  var pref = await SharedPreferences.getInstance();
  var refreshToken = pref.getString("refreshToken");
  try{
    final response = await dio.post('https://dummyjson.com/auth/refresh',data: {
      "refreshToken" : refreshToken,
      "expiresInMins" : 30
    });
    print(response);
    pref.setString("accessToken", response.data['accessToken']);
    pref.setString("refreshToken", response.data['refreshToken']);
  }
  catch(e){
    print(e);
  }
}

Future<void> getUserData() async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("token");
}

Future<ProductsModel> getAllProducts() async{
  var productsModel = ProductsModel();
  try{
  final response = await dio.get('https://dummyjson.com/products');
  print('StatusCode: ${response.statusCode}');
  productsModel = ProductsModel.fromJson(response.data);
  }
  catch(e){
    print(e);
  }
  return productsModel;
}

Future<GetProduct> getProduct() async{
    var product = GetProduct();
    try{
      final response = await dio.get('https://dummyjson.com/products/1');
      print('StatusCode: ${response.statusCode}');
      product = GetProduct.fromJson(response.data);
    }
    catch(e){
      print(e);
    }
    return product;
}

Future<SearchProducts> searchProducts() async{
  var search = SearchProducts();
  try{
    final response = await dio.get('https://dummyjson.com/products/search',queryParameters: {"q":'phone'});
    print('StatusCode: ${response.statusCode}');
    search = SearchProducts.fromJson(response.data);
  }
  catch(e){print(e);}
  return search;
}
}

