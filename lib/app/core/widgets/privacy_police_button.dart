import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../helpers/constants.dart';
import '../ui/loader.dart';
import '../ui/messages.dart';

class PrivacyPoliceButton extends StatelessWidget {
  const PrivacyPoliceButton({super.key});

  Future<void> _goToPrivacyPolicy() async {
    try {
      Loader.hide();
      final url = Uri.parse(Constants.privacyPoliceUrl);
      if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
        throw Exception('Não foi possível acessar a Url: $url');
      }
    } on Exception catch (e) {
      Messages.alert(e.toString());
    } finally {
      Loader.hide();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextButton(
        onPressed: () async {
          await _goToPrivacyPolicy();
        },
        child: const Text(
          'Política de privacidade',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
