class HabilidadRating{
  String habilidad;
  int rating;

  HabilidadRating({this.habilidad, this.rating});

  String getHabilidad(){
    return habilidad;
  }

  void setRating(int ratingUser){
    rating=ratingUser;
  }

  int getRating(){
    return rating;
  }

  void printHabilidad(){
    print("Habilidad: ${habilidad}, rating: ${rating}");
  }
}

class HabilidadesPorCarrera{
  String carrera;
  List<HabilidadRating> habilidadesRating;

  HabilidadesPorCarrera({this.carrera, this.habilidadesRating});

  HabilidadRating getHabilidad(int indexHabilidad){
    return habilidadesRating[indexHabilidad];
  }

  String getCarrera(){
    return carrera;
  }

  void printHabCar(){
    print("Carrara: ${carrera} \n");
    for(int i=0;i<habilidadesRating.length;i++){
      habilidadesRating[i].printHabilidad();
      print("\n");
    }
  }

  double getPromedio(){
    double promedio = 0;
    for(int i=0;i<habilidadesRating.length;i++){
      promedio += habilidadesRating[i].getRating().toDouble();
    }
    return promedio/habilidadesRating.length;
  }
}