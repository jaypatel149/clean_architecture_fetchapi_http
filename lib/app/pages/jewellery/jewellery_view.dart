import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_application/app/app.dart';

class JewelleryView extends StatelessWidget {
  const JewelleryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetBuilder<JewelleryApiController>(
        builder: (controller) => Scaffold(
            appBar: AppBar(
              title: const Text('My Jewellery data'),
              centerTitle: true,
            ),
            body: controller.jewelleryData.isNotEmpty
                ? ListView.builder(
                    itemCount: controller.jewelleryData.length,
                    itemBuilder: (BuildContext context, int index) =>
                        GestureDetector(
                          child: Card(
                            child: Column(
                              children: [
                                Image(
                                    width: 200,
                                    height: 200,
                                    image: NetworkImage(
                                        '${controller.jewelleryData[index]!.image}')),
                                Text(
                                  '${controller.jewelleryData[index]!.category}',
                                  style: const TextStyle(
                                      color: Color(0xFFD11D10),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                GetBuilder<JewelleryApiController>(
                                  id: 'title-update',
                                  builder: (controller) => InkWell(
                                    onTap: () {
                                      controller.jewelleryData[index]!.title =
                                          controller.titleupdated();
                                      controller.update();
                                    },
                                    child: Text(
                                      '${controller.jewelleryData[index]!.title}',
                                      style: const TextStyle(
                                          color: Color(0xFF161DE5),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                GetBuilder<JewelleryApiController>(
                                  id: 'rate-update',
                                  builder: (controller) => InkWell(
                                    onTap: () {
                                      controller.jewelleryData[index]!.rating!
                                          .rate = controller.ratingupdated();
                                      controller.update();
                                    },
                                    child: Text(
                                      'Rating ${controller.jewelleryData[index]!.rating!.rate}',
                                      style: const TextStyle(
                                          color: Colors.yellow,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                GetBuilder<JewelleryApiController>(
                                  id: 'price-update',
                                  builder: (controller) => InkWell(
                                    onTap: () {
                                      controller.jewelleryData[index]!.price =
                                          controller.priceupdated();
                                      controller.update();
                                    },
                                    child: Text(
                                      '\$ ${controller.jewelleryData[index]!.price}',
                                      style: const TextStyle(
                                          color: Colors.purple,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ))
                : const Center(child: CircularProgressIndicator())),
      );
}
