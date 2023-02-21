import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grocery_app/config.dart';
part 'slider.model.freezed.dart';
part 'slider.model.g.dart';

List<SliderModel> slidersFromJson(dynamic json) =>
    List<SliderModel>.from((json).map((e) => SliderModel.fromJson(e)));

@freezed
abstract class SliderModel with _$SliderModel {
  factory SliderModel({
    required String slider_name,
    required String slider_image,
    required String slider_id,
  }) = _Slider;

  factory SliderModel.fromJson(Map<String, dynamic> json) =>
      _$SliderModelFromJson(json);
}

extension SliderModelExt on SliderModel {
  String get fullImagePath => Config.imageURL + slider_image;
}
