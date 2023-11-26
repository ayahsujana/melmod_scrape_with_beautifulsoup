import 'package:beautiful_soup_dart/src/bs_soup.dart';
import 'package:blocwithgetit/model/detail.dart';
import 'package:blocwithgetit/service/dio_parser.dart';

class DetailParser extends BasicParser {
  DetailParser(super.link);

  @override
  List<DetailMelmodModel> parseHTML(BeautifulSoup body) {
    List<DetailMelmodModel> detail = [];

    final items = body.findAll('div', class_: 'inside-article');
    for (var item in items) {
      final title = item.find('h1', class_: 'entry-title')?.text ?? '';
      final create =
          item.find('time', class_: 'entry-date published')?.text ?? '';
      final table = item
          .find('figure', class_: 'wp-block-table')!
          .getText(separator: ' => ', strip: true);
      final zipUrl =
          item.find('a', class_: 'wp-block-button__link')!.attributes['href'] ??
              '';

      DetailMelmodModel listItem = DetailMelmodModel(
        title: title,
        create: create,
        table: table,
        zipUrl: zipUrl,
      );
      detail.add(listItem);
    }
    return detail;
  }
}
