import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ShopX/view_models/homePage/widgets/productGrid.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'widgets/productTile.dart';
import '../../controller/homeController.dart';

class Homepage extends GetView<Homecontroller> {
  final Homecontroller homecontroller;
  const Homepage({this.homecontroller});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
                onPressed: () {})
          ],
        ),
        body: Column(children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'ShopX',
                    style: TextStyle(
                        fontFamily: 'avenir',
                        fontSize: 32,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.view_list_rounded),
                  onPressed: () {
                    homecontroller.changeToList();
                  },
                ),
                IconButton(
                  icon: Icon(Icons.grid_view),
                  onPressed: () {
                    homecontroller.changeToTile();
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: GetBuilder<Homecontroller>(
              builder: (_) {
                if (homecontroller.isLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (homecontroller.listType == ListType.Tiles) {
                    return StaggeredGridView.countBuilder(
                        crossAxisCount: 2,
                        itemCount: homecontroller.productList.length,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        staggeredTileBuilder: (idx) => StaggeredTile.fit(1),
                        itemBuilder: (ctx, idx) {
                          return ProductGrid(
                            homecontroller.productList[idx],
                          );
                        });
                  } else {
                    return StaggeredGridView.countBuilder(
                      crossAxisCount: 2,
                      itemCount: homecontroller.productList.length,
                      itemBuilder: (ctx, idx) {
                        return ProductTile(
                          homecontroller.productList[idx],
                        );
                      },
                      staggeredTileBuilder: (idx) =>
                          StaggeredTile.count(2, 1.5),
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                    );
                  }
                }
              },
            ),
          ),
        ]),
      ),
    );
  }
}
