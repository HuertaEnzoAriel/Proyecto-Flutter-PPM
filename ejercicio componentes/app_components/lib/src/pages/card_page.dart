import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cards')),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo3(),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Título de la Tarjeta'),
            subtitle: Text("Descripcion de la tarjeta"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(child: Text('Cancelar'), onPressed: () {}),
              TextButton(child: Text('OK'), onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }

  //Tarjeta con imagen
  Widget _cardTipo2() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        children: <Widget>[
          //Se utiliza el widget FadeInImage para agregar un placeholder que
          //funcionará como un loader hasta visualizar la imagen original
          //Este placeholder debe contener una imagen que se debe almacenar
          //en el dispositivo
          FadeInImage(
            //Obtenemos la imagen que funcionara como loading
            placeholder: AssetImage('assets/loading-img.gif'),
            image: NetworkImage(
              'https://i.natgeofe.com/n/2a832501-483e-422f-985c-0e93757b7d84/6_3x2.jpg',
            ),
            //Duración de la animación de la imagen que aparece en la tarjeta
            fadeInDuration: Duration(milliseconds: 200),
            //Propiedad para fijar alto de la imagen de la tarjeta
            height: 300.0,
            //Propiedad para indicar cómo la imagen debe ocupar el espacio
            //asignado dentro de la tarjeta
            fit: BoxFit.cover,
          ),
          //Contenedor para mostrar una descripción de imagen dentro de
          //la tarjeta
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Descripción de la imagen de tarjeta'),
          ),
        ],
      ),
    );
  }

  Widget _cardTipo3() {
    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            placeholder: AssetImage('assets/loading-img.gif'),
            image: NetworkImage(
              'https://i.natgeofe.com/n/2a832501-483e-422f-985c-0e93757b7d84/6_3x2.jpg',
            ),
            fadeInDuration: Duration(milliseconds: 200),
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Contenedor con aspecto de Tarjeta'),
          ),
        ],
      ),
    );
    //Se retorna un contenedor
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        //Color del contenedor
        color: Colors.white,
        //Se genera una lista de tipo boxShadow para mostrar una sombra
        boxShadow: <BoxShadow>[
          BoxShadow(
            //Color negro con un indice de opacidad 26
            color: Colors.black26,
            //Se establece la que tan difuminada se ve una sombra
            blurRadius: 10.0,
            //se establece la extensión de la sombra
            spreadRadius: 2.0,
            //Posición de la sombra en un plano xy con coordenadas
            offset: Offset(2.0, 8.0),
          ),
        ],
      ),
      child: ClipRRect(borderRadius: BorderRadius.circular(30.0), child: card),
    );
  }
}
