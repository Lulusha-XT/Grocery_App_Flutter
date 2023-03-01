import 'package:freezed_annotation/freezed_annotation.dart';

import '../../model/cart.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState({
    Cart? cartModel,
    @Default(false) bool isLoding,
  }) = _CartState;
}
