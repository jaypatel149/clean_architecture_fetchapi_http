import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_application/app/app.dart';

class ElectronicView extends StatelessWidget {
  const ElectronicView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetBuilder<ElectronicApiController>(
        builder: (controller) => Scaffold(
            appBar: AppBar(
              title: const Text('My Jewellery data'),
              centerTitle: true,
            ),
            body: controller.electronicData.isNotEmpty
                ? ListView.builder(
                    itemCount: controller.electronicData.length,
                    itemBuilder: (BuildContext context, int index) =>
                        GestureDetector(
                          child: Card(
                            child: Column(
                              children: [
                                Image(
                                    width: 200,
                                    height: 200,
                                    image: NetworkImage(
                                        '${controller.electronicData[index]!.image}')),
                                Text(
                                  '${controller.electronicData[index]!.category}',
                                  style: const TextStyle(
                                      color: Color(0xFFD11D10),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  '${controller.electronicData[index]!.title}',
                                  style: const TextStyle(
                                      color: Color(0xFF161DE5),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  '${controller.electronicData[index]!.rating!.rate}',
                                  style: const TextStyle(
                                      color: Colors.yellow,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  '${controller.electronicData[index]!.price}',
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
