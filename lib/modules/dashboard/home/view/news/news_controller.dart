import 'package:get/get.dart';
import '../../../../../api/ui_state.dart';
import '../../data/news_repo.dart';
import '../../data/news_response.dart';

class NewsController extends GetxController {
  final NewsRepo repo = NewsRepo();

  static NewsController get to => Get.find();

  /// UiState for News
  final newsState = Rx<UiState<NewsResponse>>(UiState.none());

  /// Cleaned Latest News Text
  final RxString latestNews = "".obs;

  @override
  void onInit() {
    super.onInit();
    getNewsDetails();
  }

  /// Remove HTML tags
  String _removeHtmlTags(String htmlString) {
    String result = htmlString.replaceAll(RegExp(r'<[^>]*>'), '');

    result = result
        .replaceAll('&nbsp;', ' ')
        .replaceAll('&amp;', '&')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&quot;', '"')
        .replaceAll('&#39;', "'")
        .replaceAll('&rsquo;', "'")
        .replaceAll('&lsquo;', "'");

    return result.replaceAll(RegExp(r'\s+'), ' ').trim();
  }

  /// API Call for News
  void getNewsDetails() {
    repo.getNewsDetailsData(
      body: {},
      callback: (state) {
        state.when(
          loading: () {
            newsState.value = UiState.loading();
            print("News Loading...");
          },

          success: (data) {
            newsState.value = UiState.success(data);
            print("NEWS API SUCCESS");
            print("Status Code: ${data.statuscode}");
            print("Message: ${data.msg}");

            /// Extract Latest News
            String rawNews = data.newsContent?.newsDetail ?? "";
            String cleanedNews = _removeHtmlTags(rawNews);
            latestNews.value = cleanedNews.isNotEmpty
                ? cleanedNews
                : "Welcome to WeSaveMore! Stay updated with latest offers.";
          },

          error: (msg) {
            newsState.value = UiState.error(msg);
            print("NEWS ERROR: $msg");

            latestNews.value =
                "Welcome to WeSaveMore! Stay updated with latest offers.";
          },

          none: () {
            newsState.value = UiState.none();
            print("News None State");

            latestNews.value =
                "Welcome to WeSaveMore! Stay updated with latest offers.";
          },
        );
      },
    );
  }

  /// Refresh News
  void refreshNews() {
    print("Refreshing News...");
    getNewsDetails();
  }
}
