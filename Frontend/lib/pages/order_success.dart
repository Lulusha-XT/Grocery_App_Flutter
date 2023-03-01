import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class OrderSuccess extends StatelessWidget {
  const OrderSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Success"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Your Order has been placed! You will receive an email shortly",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              Icon(
                Icons.celebration,
                size: 200,
                color: Colors.orange,
              ),
              Center(
                child: FormHelper.submitButton(
                  "Go to Store",
                  () {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil("/", (route) => false);
                  },
                  btnColor: Colors.green,
                  borderColor: Colors.white,
                  txtColor: Colors.white,
                  borderRadius: 20,
                  width: 250,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
