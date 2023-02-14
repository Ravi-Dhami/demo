import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_task/model/item_model.dart';
import 'package:demo_task/utils/constant/color.dart';
import 'package:demo_task/utils/constant/string.dart';
import 'package:demo_task/view/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/constant/text_style.dart';
import '../../utils/widgets/item_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CollectionReference reference = FirebaseFirestore.instance.collection('data');

  @override
  Widget build(BuildContext context) {
    Provider.of<HomeController>(context, listen: false).sortData('name');
    return Consumer<HomeController>(builder: (ctx, homeController, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            AppString.data.toString(),
            style: TextStyle(color: Colors.black.withOpacity(0.6)),
          ),
          centerTitle: true,
          backgroundColor: AppColor.gray,
          actions: [
            PopupMenuButton(
              onSelected: (val) {
                homeController.onMenuItemSelected(val as int);
              },
              itemBuilder: (ctx) => [
                _buildPopupMenuItem(
                    AppString.name.toString(), Option.name.index),
                _buildPopupMenuItem(
                    AppString.city.toString(), Option.city.index),
                _buildPopupMenuItem(AppString.age.toString(), Option.age.index),
              ],
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Text(
                        AppString.name.toString(),
                        style: AppTextStyle.title.copyWith(
                          fontSize: 18,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        AppString.city.toString(),
                        style: AppTextStyle.title.copyWith(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        AppString.age.toString(),
                        style: AppTextStyle.title.copyWith(
                            color: Colors.black.withOpacity(0.6), fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: StreamBuilder(
                stream: reference.snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: homeController.data.length,
                        itemBuilder: (_, i) {
                          return DataContainer(
                            name: '${homeController.data[i]['name']}',
                            age: '${homeController.data[i]['age']}',
                            city: '${homeController.data[i]['city']}',
                          );
                        });
                  } else {}
                  return Center(
                    child: Text(
                      AppString.error.toString(),
                    ),
                  );
                },
              ))
            ],
          ),
        ),
      );
    });
  }

  PopupMenuItem _buildPopupMenuItem(String title, int position) {
    return PopupMenuItem(
      value: position,
      child: Text(title),
    );
  }
}
