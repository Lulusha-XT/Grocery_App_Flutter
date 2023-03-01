import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_payment.freezed.dart';
part 'order_payment.g.dart';

@freezed
abstract class OrderPayment with _$OrderPayment {
  factory OrderPayment(
      {required String stripeCustomerID,
      required String cardId,
      required String paymentIntentId,
      required String client_secret,
      required String orderId}) = _OrderPayment;

  factory OrderPayment.fromJson(Map<String, dynamic> json) =>
      _$OrderPaymentFromJson(json);
}
