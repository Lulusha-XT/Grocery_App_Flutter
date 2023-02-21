// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slider.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SliderModel _$SliderModelFromJson(Map<String, dynamic> json) {
  return _Slider.fromJson(json);
}

/// @nodoc
mixin _$SliderModel {
  String get slider_name => throw _privateConstructorUsedError;
  String get slider_image => throw _privateConstructorUsedError;
  String get slider_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SliderModelCopyWith<SliderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SliderModelCopyWith<$Res> {
  factory $SliderModelCopyWith(
          SliderModel value, $Res Function(SliderModel) then) =
      _$SliderModelCopyWithImpl<$Res, SliderModel>;
  @useResult
  $Res call({String slider_name, String slider_image, String slider_id});
}

/// @nodoc
class _$SliderModelCopyWithImpl<$Res, $Val extends SliderModel>
    implements $SliderModelCopyWith<$Res> {
  _$SliderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slider_name = null,
    Object? slider_image = null,
    Object? slider_id = null,
  }) {
    return _then(_value.copyWith(
      slider_name: null == slider_name
          ? _value.slider_name
          : slider_name // ignore: cast_nullable_to_non_nullable
              as String,
      slider_image: null == slider_image
          ? _value.slider_image
          : slider_image // ignore: cast_nullable_to_non_nullable
              as String,
      slider_id: null == slider_id
          ? _value.slider_id
          : slider_id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SliderCopyWith<$Res> implements $SliderModelCopyWith<$Res> {
  factory _$$_SliderCopyWith(_$_Slider value, $Res Function(_$_Slider) then) =
      __$$_SliderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String slider_name, String slider_image, String slider_id});
}

/// @nodoc
class __$$_SliderCopyWithImpl<$Res>
    extends _$SliderModelCopyWithImpl<$Res, _$_Slider>
    implements _$$_SliderCopyWith<$Res> {
  __$$_SliderCopyWithImpl(_$_Slider _value, $Res Function(_$_Slider) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slider_name = null,
    Object? slider_image = null,
    Object? slider_id = null,
  }) {
    return _then(_$_Slider(
      slider_name: null == slider_name
          ? _value.slider_name
          : slider_name // ignore: cast_nullable_to_non_nullable
              as String,
      slider_image: null == slider_image
          ? _value.slider_image
          : slider_image // ignore: cast_nullable_to_non_nullable
              as String,
      slider_id: null == slider_id
          ? _value.slider_id
          : slider_id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Slider implements _Slider {
  _$_Slider(
      {required this.slider_name,
      required this.slider_image,
      required this.slider_id});

  factory _$_Slider.fromJson(Map<String, dynamic> json) =>
      _$$_SliderFromJson(json);

  @override
  final String slider_name;
  @override
  final String slider_image;
  @override
  final String slider_id;

  @override
  String toString() {
    return 'SliderModel(slider_name: $slider_name, slider_image: $slider_image, slider_id: $slider_id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Slider &&
            (identical(other.slider_name, slider_name) ||
                other.slider_name == slider_name) &&
            (identical(other.slider_image, slider_image) ||
                other.slider_image == slider_image) &&
            (identical(other.slider_id, slider_id) ||
                other.slider_id == slider_id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, slider_name, slider_image, slider_id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SliderCopyWith<_$_Slider> get copyWith =>
      __$$_SliderCopyWithImpl<_$_Slider>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SliderToJson(
      this,
    );
  }
}

abstract class _Slider implements SliderModel {
  factory _Slider(
      {required final String slider_name,
      required final String slider_image,
      required final String slider_id}) = _$_Slider;

  factory _Slider.fromJson(Map<String, dynamic> json) = _$_Slider.fromJson;

  @override
  String get slider_name;
  @override
  String get slider_image;
  @override
  String get slider_id;
  @override
  @JsonKey(ignore: true)
  _$$_SliderCopyWith<_$_Slider> get copyWith =>
      throw _privateConstructorUsedError;
}
