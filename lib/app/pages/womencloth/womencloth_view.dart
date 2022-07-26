import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_application/app/app.dart';

class WomenclothView extends StatelessWidget {
  const WomenclothView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetBuilder<WomenclothApiController>(
        builder: (controller) => Scaffold(
            appBar: AppBar(
              title: const Text('My Mens-cloth data'),
              centerTitle: true,
            ),
            body: controller.womenClothData.isNotEmpty
                ? ListView.builder(
                    itemCount: controller.womenClothData.length,
                    itemBuilder: (BuildContext context, int index) =>
                        GestureDetector(
                          child: Card(
                            child: Column(
                              children: [
                                Image(
                                    width: 200,
                                    height: 200,
                                    image: NetworkImage(
                                        '${controller.womenClothData[index]!.image}')),
                                Text(
                                  '${controller.womenClothData[index]!.category}',
                                  style: const TextStyle(
                                      color: Color(0xFFD11D10),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  '${controller.womenClothData[index]!.title}',
                                  style: const TextStyle(
                                      color: Color(0xFF161DE5),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  '${controller.womenClothData[index]!.rating!.rate}',
                                  style: const TextStyle(
                                      color: Colors.yellow,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  '${controller.womenClothData[index]!.price}',
                                  style: const TextStyle(
                                      color: Colors.purple,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ))
                : const Center(child: CircularProgressIndicator())),
      );
}
