import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ShareHelper {

  static void shareWhatsapp(String message) async {
    final url = "whatsapp://send?text=${Uri.encodeComponent(message)}";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      await launchUrl(Uri.parse(
          "https://wa.me/?text=${Uri.encodeComponent(message)}"));
    }
  }

  static void shareFacebook(String message) async {
    final fbURL =
        "fb://facewebmodal/f?href=https://www.facebook.com/sharer/sharer.php?u=${Uri.encodeComponent(message)}";

    if (await canLaunchUrl(Uri.parse(fbURL))) {
      await launchUrl(Uri.parse(fbURL));
    } else {
      await launchUrl(Uri.parse(
          "https://www.facebook.com/sharer/sharer.php?u=${Uri.encodeComponent(message)}"));
    }
  }

  static void shareTwitter(String message) async {
    final twitterURL =
        "twitter://post?message=${Uri.encodeComponent(message)}";
    if (await canLaunchUrl(Uri.parse(twitterURL))) {
      await launchUrl(Uri.parse(twitterURL));
    } else {
      await launchUrl(Uri.parse(
          "https://twitter.com/intent/tweet?text=${Uri.encodeComponent(message)}"));
    }
  }

  static void shareEmail(String message) async {
    final emailUrl =
        "mailto:?subject=WeSaveMore&body=${Uri.encodeComponent(message)}";
    await launchUrl(Uri.parse(emailUrl));
  }

  static void shareGeneral(String message) async {
    Share.share(message);
  }
}
