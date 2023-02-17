import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grocery_app/config.dart';
part 'category.freezed.dart';
part 'category.g.dart';

List<Category> categoriesFromJson(dynamic str) =>
    List<Category>.from((str).map((e) => Category.fromJson(e)));

@freezed
abstract class Category with _$Category {
  factory Category(
      {required String category_name,
      required String category_image,
      required String category_id}) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

extension CategoryExt on Category {
  String get fullImagePath => Config.imageURL + category_image;
}
