import 'package:class_a_ec/core/resources/image_paths.dart';
import 'package:easy_localization/easy_localization.dart';

class OrderModel {
  final String title;
  final String date;
  final String image;
  final String price;
  final String itemsNumber;
  OrderModel({
    required this.title,
    required this.date,
    required this.image,
    required this.price,
    required this.itemsNumber,
  });
}

List<OrderModel> orderList = [
  OrderModel(
    title: 'Strawberry Shake'.tr(),
    date: '29 Nov, 01:20 pm',
    image: ImagePaths.bestSeller,
    price: '20.00',
    itemsNumber: '2',
  ),
];
