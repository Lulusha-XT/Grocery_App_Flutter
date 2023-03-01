// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderPayment _$OrderPaymentFromJson(Map<String, dynamic> json) {
  return _OrderPayment.fromJson(json);
}

/// @nodoc
mixin _$OrderPayment {
  String get stripeCustomerID => throw _privateConstructorUsedError;
  String get cardId => throw _privateConstructorUsedError;
  String get paymentIntentId => throw _privateConstructorUsedError;
  String get client_secret => throw _privateConstructorUsedError;
  String get orderId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderPaymentCopyWith<OrderPayment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderPaymentCopyWith<$Res> {
  factory $OrderPaymentCopyWith(
          OrderPayment value, $Res Function(OrderPayment) then) =
      _$OrderPaymentCopyWithImpl<$Res, OrderPayment>;
  @useResult
  $Res call(
      {String stripeCustomerID,
      String cardId,
      String paymentIntentId,
      String client_secret,
      String orderId});
}

/// @nodoc
class _$OrderPaymentCopyWithImpl<$Res, $Val extends OrderPayment>
    implements $OrderPaymentCopyWith<$Res> {
  _$OrderPaymentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stripeCustomerID = null,
    Object? cardId = null,
    Object? paymentIntentId = null,
    Object? client_secret = null,
    Object? orderId = null,
  }) {
    return _then(_value.copyWith(
      stripeCustomerID: null == stripeCustomerID
          ? _value.stripeCustomerID
          : stripeCustomerID // ignore: cast_nullable_to_non_nullable
              as String,
      cardId: null == cardId
          ? _value.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as String,
      paymentIntentId: null == paymentIntentId
          ? _value.paymentIntentId
          : paymentIntentId // ignore: cast_nullable_to_non_nullable
              as String,
      client_secret: null == client_secret
          ? _value.client_secret
          : client_secret // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderPaymentCopyWith<$Res>
    implements $OrderPaymentCopyWith<$Res> {
  factory _$$_OrderPaymentCopyWith(
          _$_OrderPayment value, $Res Function(_$_OrderPayment) then) =
      __$$_OrderPaymentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String stripeCustomerID,
      String cardId,
      String paymentIntentId,
      String client_secret,
      String orderId});
}

/// @nodoc
class __$$_OrderPaymentCopyWithImpl<$Res>
    extends _$OrderPaymentCopyWithImpl<$Res, _$_OrderPayment>
    implements _$$_OrderPaymentCopyWith<$Res> {
  __$$_OrderPaymentCopyWithImpl(
      _$_OrderPayment _value, $Res Function(_$_OrderPayment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stripeCustomerID = null,
    Object? cardId = null,
    Object? paymentIntentId = null,
    Object? client_secret = null,
    Object? orderId = null,
  }) {
    return _then(_$_OrderPayment(
      stripeCustomerID: null == stripeCustomerID
          ? _value.stripeCustomerID
          : stripeCustomerID // ignore: cast_nullable_to_non_nullable
              as String,
      cardId: null == cardId
          ? _value.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as String,
      paymentIntentId: null == paymentIntentId
          ? _value.paymentIntentId
          : paymentIntentId // ignore: cast_nullable_to_non_nullable
              as String,
      client_secret: null == client_secret
          ? _value.client_secret
          : client_secret // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderPayment implements _OrderPayment {
  _$_OrderPayment(
      {required this.stripeCustomerID,
      required this.cardId,
      required this.paymentIntentId,
      required this.client_secret,
      required this.orderId});

  factory _$_OrderPayment.fromJson(Map<String, dynamic> json) =>
      _$$_OrderPaymentFromJson(json);

  @override
  final String stripeCustomerID;
  @override
  final String cardId;
  @override
  final String paymentIntentId;
  @override
  final String client_secret;
  @override
  final String orderId;

  @override
  String toString() {
    return 'OrderPayment(stripeCustomerID: $stripeCustomerID, cardId: $cardId, paymentIntentId: $paymentIntentId, client_secret: $client_secret, orderId: $orderId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderPayment &&
            (identical(other.stripeCustomerID, stripeCustomerID) ||
                other.stripeCustomerID == stripeCustomerID) &&
            (identical(other.cardId, cardId) || other.cardId == cardId) &&
            (identical(other.paymentIntentId, paymentIntentId) ||
                other.paymentIntentId == paymentIntentId) &&
            (identical(other.client_secret, client_secret) ||
                other.client_secret == client_secret) &&
            (identical(other.orderId, orderId) || other.orderId == orderId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, stripeCustomerID, cardId,
      paymentIntentId, client_secret, orderId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderPaymentCopyWith<_$_OrderPayment> get copyWith =>
      __$$_OrderPaymentCopyWithImpl<_$_OrderPayment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderPaymentToJson(
      this,
    );
  }
}

abstract class _OrderPayment implements OrderPayment {
  factory _OrderPayment(
      {required final String stripeCustomerID,
      required final String cardId,
      required final String paymentIntentId,
      required final String client_secret,
      required final String orderId}) = _$_OrderPayment;

  factory _OrderPayment.fromJson(Map<String, dynamic> json) =
      _$_OrderPayment.fromJson;

  @override
  String get stripeCustomerID;
  @override
  String get cardId;
  @override
  String get paymentIntentId;
  @override
  String get client_secret;
  @override
  String get orderId;
  @override
  @JsonKey(ignore: true)
  _$$_OrderPaymentCopyWith<_$_OrderPayment> get copyWith =>
      throw _privateConstructorUsedError;
}
