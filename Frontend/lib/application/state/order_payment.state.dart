import 'package:freezed_annotation/freezed_annotation.dart';

import '../../model/order_payment.dart';

part 'order_payment.state.freezed.dart';

@freezed
abstract class OrderPaymentState with _$OrderPaymentState {
  const factory OrderPaymentState({
    OrderPayment? orderPaymentResponseModel,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    @Default("") String message,
  }) = _OrderPaymentState;
}
