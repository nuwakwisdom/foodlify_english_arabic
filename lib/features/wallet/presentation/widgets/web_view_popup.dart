import 'package:Foodlify/features/home/presentation/cubit/wallet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPopup extends StatefulWidget {
  const WebViewPopup({
    super.key,
    required this.url,
  });
  final String url;

  @override
  State<WebViewPopup> createState() => _WebViewPopupState();
}

class _WebViewPopupState extends State<WebViewPopup> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onUrlChange: (request) {
            if (request.url == 'about:blank') {
              Logger().d(request.url);
              // If the URL is about:blank, close the web-view screen
              Navigator.pop(context);
            }
            context.read<WalletCubit>().getWallet(context);
          },
          onNavigationRequest: (NavigationRequest request) {
            // Logger().d(request.url);
            // if (request.url.startsWith('http://ec2-3-236-5-60.compute-1.amazonaws.com/')) {
            //   Navigator.of(context).pop();
            // }
            // Navigator.pop(context);
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
        Uri.parse(
          widget.url,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: controller);
  }
}
