import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/config.dart';
import 'package:grocery_app/model/cart.dart';
import 'package:grocery_app/providers.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class PaymentPage extends ConsumerStatefulWidget {
  const PaymentPage({super.key});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends ConsumerState<PaymentPage> {
  static final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  String cardHolderName = "";
  String cardNumber = "";
  String cardCVC = "";
  String cardExp = "";
  @override
  Widget build(BuildContext context) {
    final OrderPaymentModel = ref.watch(orderPaymentProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment"),
      ),
      body: ProgressHUD(
        inAsyncCall: OrderPaymentModel.isLoading,
        opacity: 0.3,
        key: UniqueKey(),
        child: Form(
          key: globalKey,
          child: _paymentUI(context, ref),
        ),
      ),
    );
  }

  _paymentUI(BuildContext context, WidgetRef ref) {
    final cartProvider = ref.watch(cartItemsProvider);

    if (cartProvider.cartModel != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Total Amount",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "${Config.currency}${cartProvider.cartModel!.grandTotal.toString()}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.green,
                  ),
                ),
              ),
              SizedBox(height: 15),
              FormHelper.inputFieldWidgetWithLabel(
                context,
                "CardHolderName",
                "Card Holder",
                "Your name and surname",
                (onValidate) {
                  if (onValidate.isEmpty) {
                    return "* Required";
                  }
                },
                (onSaved) {
                  cardHolderName = onSaved.toString().trim();
                },
                showPrefixIcon: true,
                prefixIcon: const Icon(Icons.face),
                borderRadius: 10,
                contentPadding: 10,
                fontSize: 14,
                paddingLeft: 0,
                paddingRight: 0,
                prefixIconPaddingLeft: 10,
                borderColor: Colors.grey.shade200,
                textColor: Colors.black,
                prefixIconColor: Colors.black,
                hintColor: Colors.black.withOpacity(.6),
                backgroundColor: Colors.grey.shade100,
                borderFocusColor: Colors.grey.shade200,
              ),
              SizedBox(height: 15),
              FormHelper.inputFieldWidgetWithLabel(
                context,
                "CardNumber",
                "Card Number",
                "Card Number",
                (onValidate) {
                  if (onValidate.isEmpty) {
                    return "* Required";
                  }
                },
                (onSaved) {
                  cardNumber = onSaved.toString().trim();
                },
                showPrefixIcon: true,
                prefixIcon: const Icon(Icons.credit_card),
                borderRadius: 10,
                contentPadding: 10,
                fontSize: 14,
                paddingLeft: 0,
                paddingRight: 0,
                prefixIconPaddingLeft: 10,
                borderColor: Colors.grey.shade200,
                textColor: Colors.black,
                prefixIconColor: Colors.black,
                hintColor: Colors.black.withOpacity(.6),
                backgroundColor: Colors.grey.shade100,
                borderFocusColor: Colors.grey.shade200,
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Flexible(
                    child: FormHelper.inputFieldWidgetWithLabel(
                      context,
                      "validExp",
                      "Valid Until",
                      "Month / Year",
                      (onValidate) {
                        if (onValidate.isEmpty) {
                          return "* Required";
                        }
                      },
                      (onSaved) {
                        cardExp = onSaved.toString().trim();
                      },
                      showPrefixIcon: true,
                      prefixIcon: const Icon(Icons.calendar_month),
                      borderRadius: 10,
                      contentPadding: 10,
                      fontSize: 14,
                      paddingLeft: 0,
                      paddingRight: 0,
                      prefixIconPaddingLeft: 10,
                      borderColor: Colors.grey.shade200,
                      textColor: Colors.black,
                      prefixIconColor: Colors.black,
                      hintColor: Colors.black.withOpacity(.6),
                      backgroundColor: Colors.grey.shade100,
                      borderFocusColor: Colors.grey.shade200,
                    ),
                  ),
                  SizedBox(width: 15),
                  Flexible(
                    child: FormHelper.inputFieldWidgetWithLabel(
                      context,
                      "CVV",
                      "CVV",
                      "CVV",
                      (onValidate) {
                        if (onValidate.isEmpty) {
                          return "* Required";
                        }
                      },
                      (onSaved) {
                        cardCVC = onSaved.toString().trim();
                      },
                      showPrefixIcon: false,
                      prefixIcon: const Icon(Icons.face),
                      borderRadius: 10,
                      contentPadding: 10,
                      fontSize: 14,
                      paddingLeft: 0,
                      paddingRight: 0,
                      prefixIconPaddingLeft: 10,
                      borderColor: Colors.grey.shade200,
                      textColor: Colors.black,
                      prefixIconColor: Colors.black,
                      hintColor: Colors.black.withOpacity(.6),
                      backgroundColor: Colors.grey.shade100,
                      borderFocusColor: Colors.grey.shade200,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: FormHelper.submitButton("Procced to confirm", () async {
                  if (validateAndSave()) {
                    final orderPaymentModel =
                        ref.read(orderPaymentProvider.notifier);
                    await orderPaymentModel.processPayment(
                      cardHolderName,
                      cardNumber,
                      cardExp,
                      cardCVC,
                      cartProvider.cartModel!.grandTotal.toString(),
                    );
                    final orderPaymetnResponseModel =
                        ref.watch(orderPaymentProvider);
                    print(orderPaymetnResponseModel.isSuccess);
                    if (!orderPaymetnResponseModel.isSuccess) {
                      // ignore: use_build_context_synchronously
                      FormHelper.showSimpleAlertDialog(
                        context,
                        Config.app_name,
                        orderPaymetnResponseModel.message,
                        "Ok",
                        () {
                          Navigator.of(context).pop();
                        },
                      );
                    } else {
                      Navigator.of(context).pushNamed("/order-success");
                    }
                  }
                },
                    btnColor: Colors.blue,
                    borderColor: Colors.white,
                    txtColor: Colors.white,
                    borderRadius: 20,
                    width: 250),
              )
            ],
          ),
        ),
      );
    }

    return const CircularProgressIndicator();
  }

  bool validateAndSave() {
    final form = globalKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
