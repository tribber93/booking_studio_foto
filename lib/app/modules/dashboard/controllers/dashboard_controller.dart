import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController
  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
    // debugPrint("ini ke-$index");
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalNonBrowserApplication,
    )) {
      throw 'Could not launch $url';
    }
  }
}
