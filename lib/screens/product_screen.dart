import 'package:flutter/material.dart';
import 'package:home_tasks/data/models/my_response.dart';
import 'package:home_tasks/data/models/product_model.dart';
import 'package:home_tasks/data/repositories/product_repo.dart';
import 'package:home_tasks/screens/add_product_screen.dart';
import 'package:home_tasks/screens/product_info_screen.dart';
import 'package:home_tasks/screens/update_product_screen.dart';
import 'package:home_tasks/utils/colors/app_colors.dart';
import 'package:home_tasks/utils/project_extensions.dart';
import 'package:home_tasks/utils/styles/app_text_style.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final ProductRepo productRepo = ProductRepo();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: FutureBuilder<MyResponse>(
        future: productRepo.getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (snapshot.hasData) {
            List<ProductModel> products =
                (snapshot.data as MyResponse).data as List<ProductModel>;

            return RefreshIndicator(
              color: AppColors.white,
              backgroundColor: Colors.blue,
              onRefresh: () {
                setState(() {

                });;
                return Future<void>.delayed(Duration(seconds: 2));
              },
              child: Column(
                children: [
                  50.getH(),
                  Text(
                    "Pruducts",
                    style: AppTextStyle.rubikBold
                        .copyWith(color: AppColors.black, fontSize: 20),
                  ),
                  20.getH(),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 16,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      childAspectRatio: 0.6,
                      padding: EdgeInsets.all(12),
                      children: [
                        ...List.generate(products.length, (index) {
                          var product = products[index];
                          return ZoomTapAnimation(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductInfoScreen(productModel: product,
                                            
                                          )));
                            },
                            child: Container(
                              padding: EdgeInsets.all(12),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(.2),
                                      blurRadius: 5.0,
                                      spreadRadius: 5.0,
                                      offset: Offset(
                                        0,
                                        0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColors.white),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: Image.network(
                                          product.imageUrl,
                                          height: 100,
                                        )),
                                  ),
                                  Text(product.productName),
                                  10.getH(),
                                  Text("${product.price.toString()} dollar"),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Spacer(),
                                      IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      UpdateProductScreen(
                                                          productModel:
                                                              products[index])));
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          color: Colors.green,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  AlertDialog(
                                                    content: Text(
                                                      'Are you sure you want to delete',
                                                      textAlign: TextAlign.center,
                                                    ),
                                                    actions: [
                                                      Center(
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      16.w()),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              TextButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Container(
                                                                  padding: EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          25.w(),
                                                                      vertical:
                                                                          17.h()),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                4.w()),
                                                                  ),
                                                                  child: Text(
                                                                    "No",
                                                                  ),
                                                                ),
                                                              ),
                                                              15.getW(),
                                                              TextButton(
                                                                onPressed:
                                                                    () async {
                                                                  await productRepo
                                                                      .deleteProduct(
                                                                          product
                                                                              .productId);
                                                                  Navigator.pop(
                                                                      context);
                                                                  setState(() {});
                                                                },
                                                                child: Container(
                                                                  padding: EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          25.w(),
                                                                      vertical:
                                                                          17.h()),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                4.w()),
                                                                  ),
                                                                  child: Text(
                                                                    "Yes",
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ));
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        })
                      ],
                    ),
                  )
                ],
              ),
            );

          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddProductScreen()));
          // ProductModel productModel = ProductModel(
          //     color: Colors.red,
          //     description: "zo'r telefon",
          //     price: 1500.0,
          //     imageUrl:
          //         "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.zoodmall.uz%2Fru%2Fproduct%2F29116681%2Fsmartfon-samsung-galaxy-s24-ultra-5g-12256gb-global-titanium-gray%2F&psig=AOvVaw2NI3HwuMJs0p_XQIr6afnJ&ust=1709662424733000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCKjn-P2a24QDFQAAAAAdAAAAABAK",
          //     productName: "Samsung galaxy",
          //     dateTime: DateTime.now(),
          //     productId: "");
          //
          // await productRepo.addProduct(productModel);
          // setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
