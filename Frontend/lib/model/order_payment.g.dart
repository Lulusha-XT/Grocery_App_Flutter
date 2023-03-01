// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderPayment _$$_OrderPaymentFromJson(Map<String, dynamic> json) =>
    _$_OrderPayment(
      stripeCustomerID: json['stripeCustomerID'] as String,
      cardId: json['cardId'] as String,
      paymentIntentId: json['paymentIntentId'] as String,
      client_secret: json['client_secret'] as String,
      orderId: json['orderId'] as String,
    );

Map<String, dynamic> _$$_OrderPaymentToJson(_$_OrderPayment instance) =>
    <String, dynamic>{
      'stripeCustomerID': instance.stripeCustomerID,
      'cardId': instance.cardId,
      'paymentIntentId': instance.paymentIntentId,
      'client_secret': instance.client_secret,
      'orderId': instance.orderId,
    };
