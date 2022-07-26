import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_application/app/app.dart';

class FetchApiView extends StatelessWidget {
  const FetchApiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetBuilder<FetchApiController>(
        builder: (controller) => Scaffold(
            appBar: AppBar(
              title: const Text('My ApiFetch'),
              centerTitle: true,
            ),
            drawer: Drawer(
              child: ListView(
                children: const [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text(
                      'Shop Product',
                      style: TextStyle(fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ListTile(
                    title: SizedBox(
                      child: Text(
                        'All Category',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  ListTile(
                    trailing: Icon(Icons.arrow_forward_ios),
                    title: SizedBox(
                      child: Text(
                        'Jewellery',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFE4CE09)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    onTap: RouteManagement.goToJewelleryData,
                  ),
                  ListTile(
                    trailing: Icon(Icons.arrow_forward_ios),
                    title: SizedBox(
                      child: Text(
                        'Mens Clothing',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF330BA1)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    onTap: RouteManagement.goToMenclothData,
                  ),
                  ListTile(
                    trailing: Icon(Icons.arrow_forward_ios),
                    title: SizedBox(
                      child: Text(
                        'Womens Clothing',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    onTap: RouteManagement.goToWomenclothData,
                  ),
                  ListTile(
                    trailing: Icon(Icons.arrow_forward_ios),
                    title: SizedBox(
                      child: Text(
                        'Electronics',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    onTap: RouteManagement.goToElectronicData,
                  ),
                ],
              ),
            ),
            body: controller.dummyData.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.dummyData.length,
                    itemBuilder: (BuildContext context, int index) =>
                        GestureDetector(
                      onTap: () {
                        RouteManagement.goToMydata(index: index + 1);
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(children: [
                            Image(
                              width: 200,
                              height: 200,
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  '${controller.dummyData[index].image}'),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '${controller.dummyData[index].category}',
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '${controller.dummyData[index].title}',
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Rating ${controller.dummyData[index].rating!.rate}',
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.yellow),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '\$ ${controller.dummyData[index].price}',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                backgroundColor: Colors.green,
                              ),
                            )
                          ]),
                        ),
                      ),
                    ),
                  )
                : const Center(child: CircularProgressIndicator())),
      );
}
