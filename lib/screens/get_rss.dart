import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';


class GetRss {

  static Future <List<Noticias>> getRss() async{

    var data = await http.get(
        'https://www.eltiempo.com/rss/tecnosfera_novedades-tecnologia.xml',
        headers: {
    'Content-type':'text/xml'
    });

    var rssFeed = RssFeed.parse(data.body.toString());
    List<Noticias> noticias = List();

    for (int i=0;i<rssFeed.items.length;i++){
      noticias.add(Noticias(rssFeed.items[i].title,rssFeed.items[i].description,rssFeed.items[i].pubDate,rssFeed.items[i].enclosure.url,rssFeed.items[i].link));
    }
    return noticias;
  }

  newsContent() async{

    List newsContent = await GetRss.getRss();
    print('The content of the file is -->${newsContent.asMap()}');
  }

}

class Noticias {
  String _titulo, _descripcion, _fecha, _urlImagen, _urlNoticia;

  Noticias(this._titulo , this._descripcion, this._fecha, this._urlImagen, this._urlNoticia);

}