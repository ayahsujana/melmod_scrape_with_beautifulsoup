import 'package:beautiful_soup_dart/src/bs_soup.dart';
import 'package:blocwithgetit/model/melmod.dart';
import 'package:blocwithgetit/service/dio_parser.dart';

class MelmodParser extends BasicParser {
  MelmodParser(super.link);

  @override
  List<MelModModel> parseHTML(BeautifulSoup body) {
    List<MelModModel> melmod = [];

    final items = body.findAll('div', class_: 'inside-article');
    for (var e in items) {
      final titleClass = e.find('h2', class_: 'entry-title')!;
      final title = titleClass.find('a')!.innerHtml;

      final urlLink = titleClass.find('a')!.attributes['href'];

      final uploadClass = e.find('div', class_: 'entry-meta')!;
      final upload = uploadClass.find('time')!.innerHtml;

      var images = '';
      if (title.toString().contains('How to install mods')) {
        images = 'https://i.ytimg.com/vi/tth6pNXnb9w/hqdefault.jpg';
      } else {
        images = e.children[1].children[0].children[0].attributes['src']!;
      }

      final updates = MelModModel(
          title: title, url: urlLink ?? '', image: images, create: upload);

      melmod.add(updates);
    }
    return melmod;
  }
}
