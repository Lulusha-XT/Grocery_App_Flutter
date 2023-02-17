// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_sort.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductSortModel {
  String? get label => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductSortModelCopyWith<ProductSortModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductSortModelCopyWith<$Res> {
  factory $ProductSortModelCopyWith(
          ProductSortModel value, $Res Function(ProductSortModel) then) =
      _$ProductSortModelCopyWithImpl<$Res, ProductSortModel>;
  @useResult
  $Res call({String? label, String? value});
}

/// @nodoc
class _$ProductSortModelCopyWithImpl<$Res, $Val extends ProductSortModel>
    implements $ProductSortModelCopyWith<$Res> {
  _$ProductSortModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductSortModelCopyWith<$Res>
    implements $ProductSortModelCopyWith<$Res> {
  factory _$$_ProductSortModelCopyWith(
          _$_ProductSortModel value, $Res Function(_$_ProductSortModel) then) =
      __$$_ProductSortModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? label, String? value});
}

/// @nodoc
class __$$_ProductSortModelCopyWithImpl<$Res>
    extends _$ProductSortModelCopyWithImpl<$Res, _$_ProductSortModel>
    implements _$$_ProductSortModelCopyWith<$Res> {
  __$$_ProductSortModelCopyWithImpl(
      _$_ProductSortModel _value, $Res Function(_$_ProductSortModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = freezed,
    Object? value = freezed,
  }) {
    return _then(_$_ProductSortModel(
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ProductSortModel implements _ProductSortModel {
  _$_ProductSortModel({this.label, this.value});

  @override
  final String? label;
  @override
  final String? value;

  @override
  String toString() {
    return 'ProductSortModel(label: $label, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductSortModel &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductSortModelCopyWith<_$_ProductSortModel> get copyWith =>
      __$$_ProductSortModelCopyWithImpl<_$_ProductSortModel>(this, _$identity);
}

abstract class _ProductSortModel implements ProductSortModel {
  factory _ProductSortModel({final String? label, final String? value}) =
      _$_ProductSortModel;

  @override
  String? get label;
  @override
  String? get value;
  @override
  @JsonKey(ignore: true)
  _$$_ProductSortModelCopyWith<_$_ProductSortModel> get copyWith =>
      throw _privateConstructorUsedError;
}
