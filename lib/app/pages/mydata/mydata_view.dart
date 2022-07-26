import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:my_application/app/app.dart';

class MydataView extends StatelessWidget {
  const MydataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetBuilder<MyDataController>(
        builder: (controller) => Scaffold(
          appBar: AppBar(
            title: const Text('My Api data'),
            centerTitle: true,
          ),
          body: controller.dummyData == null
              ? const Center(child: CircularProgressIndicator())
              : Center(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.network(
                              '${controller.dummyData!.image}',
                              width: 200,
                              height: 200,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '${controller.dummyData!.title}',
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF240AB9),
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '${controller.dummyData!.category}',
                              style: const TextStyle(
                                  color: Color(0xFFD11D10),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '\Rating ${controller.dummyData!.rating!.rate}',
                              style: const TextStyle(
                                  color: Colors.yellow,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            const SizedBox(height: 10),
                            Text('\$ ${controller.dummyData!.price}',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        ),
      );
}
