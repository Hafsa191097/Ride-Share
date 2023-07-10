import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
 late final WebViewController controller;


  @override
  void initState() {
    super.initState();
    
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://martcart.pk/'),
      );
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}