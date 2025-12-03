import 'package:get/get.dart';
import '../../../../../api/ui_state.dart';
import '../../data/news_repo.dart';
import '../../data/news_response.dart';

class NewsController extends GetxController {
  final NewsRepo repo = NewsRepo();

  /// Loading state
  final RxBool isLoading = true.obs;

  /// News data
  final newsState = Rx<UiState<NewsResponse>>(UiState.none());
  final Rx<NewsResponse?> newsData = Rx<NewsResponse?>(null);
  final RxString latestNews = "".obs;
  final RxList<NewsContent> newsList = <NewsContent>[].obs;

  @override
  void onInit() {
    super.onInit();
    getNewsDetails();
  }

  /// Remove HTML tags from text
  String _removeHtmlTags(String htmlString) {
    /// Remove all HTML tags
    String result = htmlString.replaceAll(RegExp(r'<[^>]*>'), '');

    /// Decode HTML entities
    result = result
        .replaceAll('&nbsp;', ' ')
        .replaceAll('&amp;', '&')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&quot;', '"')
        .replaceAll('&#39;', "'")
        .replaceAll('&rsquo;', "'")
        .replaceAll('&lsquo;', "'");

    /// Remove extra whitespace and trim
    result = result.replaceAll(RegExp(r'\s+'), ' ').trim();
    return result;
  }

  /// Fetch news details from API
  void getNewsDetails() {
    isLoading.value = true;
    Map<String, dynamic> body = {};
    repo.getNewsDetailsData(
      body: body,
      callback: (state) {
        state.when(
          success: (data) {
            newsData.value = data;
            newsState.value = UiState.success(data);

            ///Set the latest news text and remove HTML tags
            if (data.newsContent != null && data.newsContent!.newsDetail != null) {
              String cleanedNews = _removeHtmlTags(data.newsContent!.newsDetail!);
              latestNews.value = cleanedNews.isNotEmpty
                  ? cleanedNews
                  : "Welcome to WeSaveMore! Stay updated with latest offers.";

            } else {
              latestNews.value = "Welcome to WeSaveMore! Stay updated with latest offers.";
            }

            isLoading.value = false;
          },
          error: (msg) {
            newsState.value = UiState.error(msg);
            /// Set default message on error
            latestNews.value = "Welcome to WeSaveMore! Stay updated with latest offers.";

            isLoading.value = false;
          },
          loading: () {
            isLoading.value = true;
          },
          none: () {
            isLoading.value = false;
          },
        );
      },
    );
  }

  /// Refresh news
  void refreshNews() {
    print("🔄 Refreshing news...");
    getNewsDetails();
  }
}