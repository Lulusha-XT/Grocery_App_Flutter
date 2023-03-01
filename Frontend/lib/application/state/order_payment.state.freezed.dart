// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_payment.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderPaymentState {
  OrderPayment? get orderPaymentResponseModel =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderPaymentStateCopyWith<OrderPaymentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderPaymentStateCopyWith<$Res> {
  factory $OrderPaymentStateCopyWith(
          OrderPaymentState value, $Res Function(OrderPaymentState) then) =
      _$OrderPaymentStateCopyWithImpl<$Res, OrderPaymentState>;
  @useResult
  $Res call(
      {OrderPayment? orderPaymentResponseModel,
      bool isLoading,
      bool isSuccess,
      String message});

  $OrderPaymentCopyWith<$Res>? get orderPaymentResponseModel;
}

/// @nodoc
class _$OrderPaymentStateCopyWithImpl<$Res, $Val extends OrderPaymentState>
    implements $OrderPaymentStateCopyWith<$Res> {
  _$OrderPaymentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderPaymentResponseModel = freezed,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      orderPaymentResponseModel: freezed == orderPaymentResponseModel
          ? _value.orderPaymentResponseModel
          : orderPaymentResponseModel // ignore: cast_nullable_to_non_nullable
              as OrderPayment?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderPaymentCopyWith<$Res>? get orderPaymentResponseModel {
    if (_value.orderPaymentResponseModel == null) {
      return null;
    }

    return $OrderPaymentCopyWith<$Res>(_value.orderPaymentResponseModel!,
        (value) {
      return _then(_value.copyWith(orderPaymentResponseModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OrderPaymentStateCopyWith<$Res>
    implements $OrderPaymentStateCopyWith<$Res> {
  factory _$$_OrderPaymentStateCopyWith(_$_OrderPaymentState value,
          $Res Function(_$_OrderPaymentState) then) =
      __$$_OrderPaymentStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {OrderPayment? orderPaymentResponseModel,
      bool isLoading,
      bool isSuccess,
      String message});

  @override
  $OrderPaymentCopyWith<$Res>? get orderPaymentResponseModel;
}

/// @nodoc
class __$$_OrderPaymentStateCopyWithImpl<$Res>
    extends _$OrderPaymentStateCopyWithImpl<$Res, _$_OrderPaymentState>
    implements _$$_OrderPaymentStateCopyWith<$Res> {
  __$$_OrderPaymentStateCopyWithImpl(
      _$_OrderPaymentState _value, $Res Function(_$_OrderPaymentState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderPaymentResponseModel = freezed,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? message = null,
  }) {
    return _then(_$_OrderPaymentState(
      orderPaymentResponseModel: freezed == orderPaymentResponseModel
          ? _value.orderPaymentResponseModel
          : orderPaymentResponseModel // ignore: cast_nullable_to_non_nullable
              as OrderPayment?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_OrderPaymentState implements _OrderPaymentState {
  const _$_OrderPaymentState(
      {this.orderPaymentResponseModel,
      this.isLoading = false,
      this.isSuccess = false,
      this.message = ""});

  @override
  final OrderPayment? orderPaymentResponseModel;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSuccess;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'OrderPaymentState(orderPaymentResponseModel: $orderPaymentResponseModel, isLoading: $isLoading, isSuccess: $isSuccess, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderPaymentState &&
            (identical(other.orderPaymentResponseModel,
                    orderPaymentResponseModel) ||
                other.orderPaymentResponseModel == orderPaymentResponseModel) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, orderPaymentResponseModel, isLoading, isSuccess, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderPaymentStateCopyWith<_$_OrderPaymentState> get copyWith =>
      __$$_OrderPaymentStateCopyWithImpl<_$_OrderPaymentState>(
          this, _$identity);
}

abstract class _OrderPaymentState implements OrderPaymentState {
  const factory _OrderPaymentState(
      {final OrderPayment? orderPaymentResponseModel,
      final bool isLoading,
      final bool isSuccess,
      final String message}) = _$_OrderPaymentState;

  @override
  OrderPayment? get orderPaymentResponseModel;
  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_OrderPaymentStateCopyWith<_$_OrderPaymentState> get copyWith =>
      throw _privateConstructorUsedError;
}
