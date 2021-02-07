import 'package:detayli_film/KlassFilmler.dart';
import 'package:flutter/material.dart';

class Aksiyon extends StatefulWidget {
  @override
  _AksiyonState createState() => _AksiyonState();
}

class _AksiyonState extends State<Aksiyon> {

  Future<List<Filmler>> korkuGetir() async {
    var filmListe = List<Filmler>();

    var f1 = Filmler(1, "INCEPTION", "inception.png", 12);
    var f2 = Filmler(1, "ANADOLUDA", "anadoluda.png", 14.99);

    filmListe.add(f1);
    filmListe.add(f2);

    return filmListe;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aksiyon"),
      ),
      body: FutureBuilder<List<Filmler>>(
        future: korkuGetir(),
        builder: (context,snapshot){
          if(snapshot.hasData){

            var film = snapshot.data;

            return GridView.builder(
              itemCount: film.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1/2,
              ),
              itemBuilder: (context,index){
                var filmler = film[index];

                return Card(
                  child: Column(
                    children: [
                      Image.asset("resimler/${filmler.film_resim_ad}"),
                      Text(filmler.film_ad, style: TextStyle(color: Colors.blue,fontSize: 25),),
                      SizedBox(height: 20,),
                      Text("${filmler.film_fiyat} \u{20BA}",style: TextStyle(fontSize: 25)),
                    ],
                  ),
                );
              },
            );

          }else{
            return Center();
          }
        },
      ),

    );
  }
}
