import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:dio/dio.dart';

abstract class BasicParser {
  String? _link;

  String? getLink() => _link;

  BasicParser(String link) {
    _link = link;
  }
  Future<String> serviceHTML() async {
    final response = await Dio().get(
      _link!,
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    try {
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return Future.error(response.data);
      }
    } catch (e) {
      return Future.error(response.data);
    }
  }

  parseHTML(BeautifulSoup body);
}
