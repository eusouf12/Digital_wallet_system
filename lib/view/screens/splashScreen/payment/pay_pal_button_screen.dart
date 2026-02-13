import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omerabashar_flutter_app/utils/app_colors/app_colors.dart';
import 'package:omerabashar_flutter_app/view/components/custom_gradient/custom_gradient.dart';
import 'package:omerabashar_flutter_app/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../components/custom_text/custom_text.dart';
import '../controller/subscribe_controller.dart';

class PayPalButton extends StatefulWidget {
  final String hostedButtonId;
  final double amount;
  final String currency;
  final String returnUrl;
  final String cancelUrl;
  final Function(String)? onPaymentComplete;

   PayPalButton({
    Key? key,
    this.hostedButtonId = '3N3GQAXUKEV8C',
    this.amount = 100,
    this.currency = 'USD',
    this.returnUrl = 'http://localhost:5173/paypal?status=success',
    this.cancelUrl = 'http://localhost:5173/paypal?status=cancel',
    this.onPaymentComplete,
  }) : super(key: key);
  final subscribeController = Get.put(SubscribeController());

  @override
  State<PayPalButton> createState() => _PayPalButtonState();
}

class _PayPalButtonState extends State<PayPalButton> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _initWebViewController();
  }

  void _initWebViewController() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (NavigationRequest request) {
            // Check if payment completed
            if (request.url.contains('status=success')) {
              widget.subscribeController.postBuySubscription();
              Navigator.pop(context);
              widget.onPaymentComplete?.call('success');
              _showSnackBar('Payment Successful!', Colors.green);
              return NavigationDecision.prevent;
            } else if (request.url.contains('status=cancel')) {
              Navigator.pop(context);
              widget.onPaymentComplete?.call('cancel');
              _showSnackBar('Payment Cancelled', Colors.red);
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
          onPageStarted: (String url) {
            // Optional: show loading indicator
          },
          onPageFinished: (String url) {
            // Optional: hide loading indicator
          },
        ),
      );
  }

  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  String _generatePayPalHtml() {
    final cmd = widget.hostedButtonId.isNotEmpty ? '_s-xclick' : '_xclick';
    final hostedButtonField = widget.hostedButtonId.isNotEmpty
        ? '<input type="hidden" name="hosted_button_id" value="${widget.hostedButtonId}" />'
        : '';

    return '''
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    body {
      margin: 0;
      padding: 20px;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      background: #f5f5f5;
    }
  </style>
  <script>
    window.onload = function() {
      // Auto-submit form when page loads
      document.getElementById('paypal-form').submit();
    };
  </script>
</head>
<body>
  <form id="paypal-form" action="https://www.paypal.com/cgi-bin/webscr" method="post">
    <input type="hidden" name="cmd" value="$cmd" />
    $hostedButtonField
    <input type="hidden" name="amount" value="${widget.amount}" />
    <input type="hidden" name="currency_code" value="${widget.currency}" />
    <input type="hidden" name="return" value="${widget.returnUrl}" />
    <input type="hidden" name="cancel_return" value="${widget.cancelUrl}" />
    <noscript>
      <input type="submit" value="Proceed to PayPal" />
    </noscript>
  </form>
</body>
</html>
    ''';
  }

  void _openPayPalPayment() {
    final htmlContent = _generatePayPalHtml();

    _controller.loadRequest(
      Uri.dataFromString(
        htmlContent,
        mimeType: 'text/html',
      ),
    );

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      builder: (context) => PopScope(
        canPop: false,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.95,
          child: Column(
            children: [
              AppBar(
                title: const Text('PayPal Payment'),
                leading: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                    _showSnackBar('Payment Cancelled', Colors.orange);
                  },
                ),
              ),
              Expanded(
                child: WebViewWidget(controller: _controller),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomGradient(
      color1: AppColors.white_2,
      color2: AppColors.white_2,
      child: Scaffold(
         body: SafeArea(
           child: Center(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 GestureDetector(
                    onTap: _openPayPalPayment,
                    child: Image.network(
                      'https://www.paypalobjects.com/en_US/i/btn/btn_subscribe_SM.gif',
                      height: 26,
                    ),
                  ),
                 SizedBox(height: 16,),
                 CustomText(text: "Click the Subscribe Above Button",color: AppColors.black,fontSize: 16,)
               ],
             ),
           ),
         ),
        ),
    );
  }
}

// Example Usage
class PayPalDemo extends StatelessWidget {
   PayPalDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomGradient(
      color1:  AppColors.white_2,
      color2:  AppColors.white_2,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomRoyelAppbar(leftIcon: false,titleName: "PayPal Payment",),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Click button to pay with PayPal',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              PayPalButton(
                hostedButtonId: '3N3GQAXUKEV8C',
                amount: 100,
                currency: 'USD',
                onPaymentComplete: (status) {
                  print('Payment status: $status');
                  // Handle payment completion here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
