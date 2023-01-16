import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_bag/constants.dart';
import 'package:shopping_bag/models/bag_data.dart';
import 'package:shopping_bag/screens/detail_page.dart';

class Homepage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        color: Colors.white38,
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //Title
          GenderCategory(context),
          //tabbar
          Categories(),
          //gap
          const SizedBox(
            height: kDefaultPadding,
          ),
          //body list of bags
          ItemCard(context),
        ]),
      ),
    );
  }

  Container GenderCategory(BuildContext context) {
    return Container(
     
      child: Text(
        'Women',
        style: Theme.of(context)
            .textTheme
            .headline5
            ?.copyWith(fontWeight: FontWeight.bold),
     
      ),
    );
  }

  DefaultTabController Categories() {
    return DefaultTabController(
      length: 5,
      child: Container(
        child: TabBar(
           
            isScrollable: true,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black45,
            indicatorColor: Colors.pink,

           
            tabs: [
              Tab(
                text: 'Handbag',
              ),
              Tab(
                text: 'Jewellery',
              ),
              Tab(
                text: 'Footwear',
              ),
              Tab(
                text: 'Dress',
              ),
              Tab(
                text: 'Pant',
              ),
            ]),
      ),
    );
  }

  Container ItemCard(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      width: double.maxFinite,
      child: GridView.builder(
        itemCount: bagData.length,
       
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 20,
          mainAxisSpacing: 10,
        ),
        itemBuilder: ((context, index) => InkWell(
              onTap: () {
                Get.to(DetailPage(bagDetail: bagData[index]));
              },
              child: Container(
                
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 180,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            bagData[index].imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            bagData[index].name,
                            style: TextStyle(color: Colors.black54),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: Text(
                              '\$' + bagData[index].rate,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: kBlackColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    ]),
              ),
            )),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white38,
      elevation: 0,
      leading: IconButton(
        icon: Icon(CupertinoIcons.arrow_left),
        color: kTextColor,
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: Icon(CupertinoIcons.search),
          color: kTextColor,
          onPressed: () {},
        ),
        SizedBox(
          width: 15,
        ),
        IconButton(
          icon: Icon(CupertinoIcons.cart),
          color: kTextColor,
          onPressed: () {},
          splashColor: Colors.red,
        ),
        SizedBox(
          width: 15,
        ),
      ],
    );
  }
}
