import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebsiteScreen extends StatelessWidget {
  static const routeName = '/website_screen';
  const WebsiteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late WebViewController wController;
    final data =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final MaterialColor? color = data['color'];
    final String title = data['title'];
    return Theme(
      data: ThemeData(
        primarySwatch: color,
      ),
      child: Builder(
        builder: (context) => WillPopScope(
          onWillPop: () async {
            if (await wController.canGoBack()) {
              wController.goBack();
              // stay in screen
              return false;
            }
            // leave the screen
            return true;
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text(title),
              actions: [
                IconButton(
                  onPressed: () async {
                    if (await wController.canGoBack()) {
                      wController.goBack();
                    }
                  },
                  icon: const Icon(Icons.chevron_left),
                ),
                IconButton(
                  onPressed: () async {
                    if (await wController.canGoForward()) {
                      wController.goForward();
                    }
                  },
                  icon: const Icon(Icons.chevron_right),
                ),
                IconButton(
                  onPressed: () => wController.reload(),
                  icon: const Icon(Icons.refresh),
                ),
              ],
            ),
            body: SafeArea(
              child: WebView(
                initialUrl: 'https://mohebban-almahdi.ir',
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (controller) {
                  wController = controller;
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
