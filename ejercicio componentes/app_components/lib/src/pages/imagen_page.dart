import 'package:flutter/material.dart';

class ImagenPage extends StatelessWidget {
  const ImagenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Imagen")),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Card(
                elevation: 4,
                margin: const EdgeInsets.all(8),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/placeholder.jpg',
                  image: 'https://cdn.pixabay.com/photo/2024/02/22/05/40/natural-scenery-8589166_1280.jpg',
                ),
              ),
            ),
            Expanded(
              child: Card(
                elevation: 4,
                margin: const EdgeInsets.all(8),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/placeholder.jpg',
                  image: 'https://cdn.pixabay.com/photo/2024/02/22/05/40/natural-scenery-8589165_1280.jpg',
                ),
              ),
            ),
            Expanded(
              child: Card(
                elevation: 4,
                margin: const EdgeInsets.all(8),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/placeholder.jpg',
                  image: 'https://ts3.mm.bing.net/th?id=OIP.zqqxSMlz9udm2sMY_ZT1TwHaEo&pid=15.1',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
