import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_bag/models/bag_data.dart';
import 'package:shopping_bag/provider/counterlogic_provider.dart';

class DetailPage extends StatelessWidget {
  BagData bagDetail;
  DetailPage({required this.bagDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(children: [
            Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.45,
                width: double.infinity,
                child: Image.network(
                  bagDetail.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 20,
                top: 20,
                child: Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hand Bags',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                        Text(
                          bagDetail.name,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                              color: Colors.black),
                        ),
                      ]),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 20,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Price',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                        Text(
                          bagDetail.rate,
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        )
                      ]),
                ),
              ),
            ]),
            Container(
              padding: EdgeInsets.all(20),
              // height: 50,
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    height: 55,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Colors'),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 5, bottom: 10, right: 10),
                                  child: Icon(
                                    CupertinoIcons.circle_filled,
                                    color: Colors.pink,
                                    size: 20,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 5, bottom: 10, right: 10),
                                  child: Icon(
                                    CupertinoIcons.circle_filled,
                                    color: Colors.amber,
                                    size: 20,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 5, bottom: 10, right: 10),
                                  child: Icon(
                                    CupertinoIcons.circle_filled,
                                    color: Colors.grey,
                                    size: 20,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Column(
                          
                          children: [
                            Text(
                              'Size',
                            ),
                            Text(
                              bagDetail.size,
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                  ),
                  Text(
                    bagDetail.desc,
                    maxLines: 5,
                    style: TextStyle(height: 1.8, color: Colors.black45),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Counter(),
                      //heart icon
                      Icon(
                        CupertinoIcons.heart_circle_fill,
                        color: Colors.red,
                        size: 40,
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(width: 2, color: Colors.grey)),
                          child: IconButton(
                              icon: Icon(CupertinoIcons.cart),
                              onPressed: () {}),
                        ),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(15)),
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Center(child: Text('BUY NOW')),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //counter
          ]),
        ),
      ),
    );
  }

  Consumer Counter() {
    return Consumer(
      builder: ((context, ref, child) {
        final number = ref.watch(counterStateProvider);
        return Container(
          width: 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 33,
                height: 33,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 2, color: Colors.grey)),
                child: IconButton(
                  icon: Icon(
                    CupertinoIcons.minus,
                    color: Colors.black38,
                    size: 18,
                  ),
                  onPressed: () {
                    ref.read(counterStateProvider.notifier).state--;
                  },
                ),
              ),
              Text(
                '$number',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              Container(
                width: 33,
                height: 33,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 2, color: Colors.grey)),
                child: IconButton(
                  icon: Icon(
                    CupertinoIcons.plus,
                    color: Colors.black38,
                    size: 18,
                  ),
                  onPressed: () {
                    ref.read(counterStateProvider.notifier).state++;
                  },
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
