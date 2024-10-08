class MovieModel {
    int id;
    String movie;
    double rating;
    String image;
    String imdbUrl;

    MovieModel({
        required this.id,
        required this.movie,
        required this.rating,
        required this.image,
        required this.imdbUrl,
    });

    factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json["id"],
        movie: json["movie"],
        rating: json["rating"]?.toDouble(),
        image: json["image"],
        imdbUrl: json["imdb_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "movie": movie,
        "rating": rating,
        "image": image,
        "imdb_url": imdbUrl,
    };
}
