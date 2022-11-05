import 'package:bloc_sample/models/product.dart';

class ProductService{
  static List<Product> products = List<Product>.empty(growable: true);

  static ProductService _singleton = ProductService._interval();

  factory ProductService(){
    return _singleton;
  }



  ProductService._interval();
  static List<Product> getAll(){
    products.add(Product(1, "Acer", 6000));
    products.add(Product(2, "Hacer", 7000));
    products.add(Product(3, "Ahmet", 3000));
    products.add(Product(2, "Mahmud", 2233));

    return products;
  }
}