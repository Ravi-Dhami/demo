import 'package:demo_task/model/item_model.dart';
import 'package:demo_task/utils/constant/color.dart';
import 'package:flutter/material.dart';

import '../../utils/constant/text_style.dart';
import '../../utils/widgets/item_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _popupMenuItemIndex = 0;
  var dataItem;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dummy Data',
          style: TextStyle(color: Colors.black.withOpacity(0.6)),
        ),
        centerTitle: true,
        backgroundColor: AppColor.gray,
        actions: [
          PopupMenuButton(
            onSelected: (val) {
              _onMenuItemSelected(val as int);
            },
            itemBuilder: (ctx) => [
              _buildPopupMenuItem('Name', Option.name.index),
              _buildPopupMenuItem('Age', Option.age.index),
              _buildPopupMenuItem('City', Option.city.index),
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
                      'Name',
                      style: AppTextStyle.title.copyWith(
                        fontSize: 18,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text(
                      'City',
                      style: AppTextStyle.title.copyWith(
                        color: Colors.black.withOpacity(0.6),
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Age',
                      style: AppTextStyle.title.copyWith(
                          color: Colors.black.withOpacity(0.6), fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (_, i) {
                    if (index == 0) {
                      dataItem = data
                        ..sort(
                          (a, b) => a.name!.compareTo(b.name!.toString()),
                        );
                    } else if (index == 1) {
                      dataItem = data
                        ..sort(
                          (a, b) => a.age!.compareTo(b.age!.toInt()),
                        );
                    } else {
                      dataItem = data
                        ..sort(
                          (a, b) => a.city!.compareTo(b.city!.toString()),
                        );
                    }
                    return DataContainer(
                      name: dataItem[i].name.toString(),
                      age: dataItem[i].age.toString(),
                      city: dataItem[i].city.toString(),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  PopupMenuItem _buildPopupMenuItem(String title, int position) {
    return PopupMenuItem(
      value: position,
      child: Text(title),
    );
  }

  _onMenuItemSelected(int value) {
    setState(() {
      _popupMenuItemIndex = value;
    });

    if (value == Option.name.index) {
      setState(() {
        index = 0;
      });
    } else if (value == Option.age.index) {
      setState(() {
        index = 1;
      });
    } else if (value == Option.city.index) {
      setState(() {
        index = 2;
      });
    } else {}
  }

  List<Item> data = [
    Item(name: 'Liam', age: 17, city: 'New York'),
    Item(name: 'Noah', age: 19, city: 'Los Angeles'),
    Item(name: 'Oliver', age: 10, city: 'Chicago'),
    Item(name: 'Elijah', age: 15, city: 'Houston'),
    Item(name: 'James', age: 13, city: 'Philadelphia'),
    Item(name: 'William', age: 32, city: 'Phoenix'),
    Item(name: 'Benjamin', age: 30, city: 'San Diego'),
    Item(name: 'Lucas', age: 45, city: 'Dallas'),
    Item(name: 'Henry', age: 28, city: 'San Jose'),
    Item(name: 'Theodore', age: 25, city: 'Austin'),
  ];
}
