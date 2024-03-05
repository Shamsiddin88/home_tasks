import 'package:flutter/material.dart';
import 'package:home_tasks/data/models/my_response.dart';
import 'package:home_tasks/data/repositories/product_repo.dart';
import 'package:home_tasks/utils/project_extensions.dart';

import '../data/models/product_model.dart';

class ProductInfoScreen extends StatefulWidget {
  const ProductInfoScreen({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  State<ProductInfoScreen> createState() => _ProductInfoScreenState();
}

class _ProductInfoScreenState extends State<ProductInfoScreen> {
  ProductRepo productsRepository = ProductRepo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCAF4FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios, color: Colors.black,),),
        title: Text(widget.productModel.productName, style: TextStyle(color: Colors.black),),
      ),
      body:


      FutureBuilder(
        future: productsRepository.getAllProducts(),
        builder: (
            BuildContext context,
            AsyncSnapshot<MyResponse> snapshot,
            ) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.hasData) {
            List<ProductModel> products =
                (snapshot.data as MyResponse?)?.data as List<ProductModel>? ?? [];



            return
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(24),
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],),
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(widget.productModel.imageUrl, height: 100, width: 150, fit: BoxFit.fill,)),
                    Text(widget.productModel.productName, style: TextStyle(fontSize: 22),),
                    SizedBox(height: 12,),
                    Text("Price \$ ${widget.productModel.price.toString()}", style: TextStyle(fontSize: 22),),
                    10.getH(),
                    Text(widget.productModel.description)
                  ],
                ),
              );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}