// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductFilterModel {
  PaginationModel get paginationModel => throw _privateConstructorUsedError;
  String? get category_id => throw _privateConstructorUsedError;
  String? get sort_by => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductFilterModelCopyWith<ProductFilterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductFilterModelCopyWith<$Res> {
  factory $ProductFilterModelCopyWith(
          ProductFilterModel value, $Res Function(ProductFilterModel) then) =
      _$ProductFilterModelCopyWithImpl<$Res, ProductFilterModel>;
  @useResult
  $Res call(
      {PaginationModel paginationModel, String? category_id, String? sort_by});

  $PaginationModelCopyWith<$Res> get paginationModel;
}

/// @nodoc
class _$ProductFilterModelCopyWithImpl<$Res, $Val extends ProductFilterModel>
    implements $ProductFilterModelCopyWith<$Res> {
  _$ProductFilterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paginationModel = null,
    Object? category_id = freezed,
    Object? sort_by = freezed,
  }) {
    return _then(_value.copyWith(
      paginationModel: null == paginationModel
          ? _value.paginationModel
          : paginationModel // ignore: cast_nullable_to_non_nullable
              as PaginationModel,
      category_id: freezed == category_id
          ? _value.category_id
          : category_id // ignore: cast_nullable_to_non_nullable
              as String?,
      sort_by: freezed == sort_by
          ? _value.sort_by
          : sort_by // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginationModelCopyWith<$Res> get paginationModel {
    return $PaginationModelCopyWith<$Res>(_value.paginationModel, (value) {
      return _then(_value.copyWith(paginationModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_productFilterModelCopyWith<$Res>
    implements $ProductFilterModelCopyWith<$Res> {
  factory _$$_productFilterModelCopyWith(_$_productFilterModel value,
          $Res Function(_$_productFilterModel) then) =
      __$$_productFilterModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PaginationModel paginationModel, String? category_id, String? sort_by});

  @override
  $PaginationModelCopyWith<$Res> get paginationModel;
}

/// @nodoc
class __$$_productFilterModelCopyWithImpl<$Res>
    extends _$ProductFilterModelCopyWithImpl<$Res, _$_productFilterModel>
    implements _$$_productFilterModelCopyWith<$Res> {
  __$$_productFilterModelCopyWithImpl(
      _$_productFilterModel _value, $Res Function(_$_productFilterModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paginationModel = null,
    Object? category_id = freezed,
    Object? sort_by = freezed,
  }) {
    return _then(_$_productFilterModel(
      paginationModel: null == paginationModel
          ? _value.paginationModel
          : paginationModel // ignore: cast_nullable_to_non_nullable
              as PaginationModel,
      category_id: freezed == category_id
          ? _value.category_id
          : category_id // ignore: cast_nullable_to_non_nullable
              as String?,
      sort_by: freezed == sort_by
          ? _value.sort_by
          : sort_by // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_productFilterModel implements _productFilterModel {
  _$_productFilterModel(
      {required this.paginationModel, this.category_id, this.sort_by});

  @override
  final PaginationModel paginationModel;
  @override
  final String? category_id;
  @override
  final String? sort_by;

  @override
  String toString() {
    return 'ProductFilterModel(paginationModel: $paginationModel, category_id: $category_id, sort_by: $sort_by)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_productFilterModel &&
            (identical(other.paginationModel, paginationModel) ||
                other.paginationModel == paginationModel) &&
            (identical(other.category_id, category_id) ||
                other.category_id == category_id) &&
            (identical(other.sort_by, sort_by) || other.sort_by == sort_by));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, paginationModel, category_id, sort_by);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_productFilterModelCopyWith<_$_productFilterModel> get copyWith =>
      __$$_productFilterModelCopyWithImpl<_$_productFilterModel>(
          this, _$identity);
}

abstract class _productFilterModel implements ProductFilterModel {
  factory _productFilterModel(
      {required final PaginationModel paginationModel,
      final String? category_id,
      final String? sort_by}) = _$_productFilterModel;

  @override
  PaginationModel get paginationModel;
  @override
  String? get category_id;
  @override
  String? get sort_by;
  @override
  @JsonKey(ignore: true)
  _$$_productFilterModelCopyWith<_$_productFilterModel> get copyWith =>
      throw _privateConstructorUsedError;
}
