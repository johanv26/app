import 'package:flutter/material.dart';

class Slide {
  final String imageUrl;
  final String title;
  final String description;

  Slide({
    @required this.imageUrl,
    @required this.title,
    @required this.description,
  });
}

final slideList = [
  Slide(
    imageUrl: 'assets/images/image1.jpg',
    title: 'Compañías Internacionales',
    description: 'Trabaja en compañías internacionales de forma remota, aplica en linea y accede a los mejores salarios del mercado.',
  ),
  Slide(
    imageUrl: 'assets/images/image2.jpg',
    title: 'Trabaja en nuestros Hubs',
    description: 'Una vez consigas el empleo de tus sueños, puedes trabajar en uno de nuestros Hubs, donde podrás compartir con otros compañeros y con todas las comodidades.',
  ),
  Slide(
    imageUrl: 'assets/images/image3.jpg',
    title: 'Aplica fácil',
    description: 'Nuestros procesos de selección son rápidos y efectivos, normalmente toman menos de una hora y te permiten aplicar a muchas empresas para incrementar tus oportunidades.',
  ),
];
