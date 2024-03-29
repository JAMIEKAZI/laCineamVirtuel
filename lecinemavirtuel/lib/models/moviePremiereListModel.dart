class MoviePremiereListModel {
  String? message;
  String? status;
  int? statusCode;
  Data? data;

  MoviePremiereListModel(
      {this.message, this.status, this.statusCode, this.data});

  MoviePremiereListModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    statusCode = json['statusCode'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['statusCode'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Docs>? docs;

  Data({this.docs});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['docs'] != null) {
      docs = <Docs>[];
      json['docs'].forEach((v) {
        docs!.add(new Docs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.docs != null) {
      data['docs'] = this.docs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Docs {
  String? sId;
  String? movieId;
  String? premiereDatetime;
  String? userId;
  String? createdAt;
  String? updatedAt;
  int? iV;
  Movie? movie;
  User? user;
  int? ticketCount;
  String? id;

  Docs(
      {this.sId,
      this.movieId,
      this.premiereDatetime,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.movie,
      this.user,
      this.ticketCount,
      this.id});

  Docs.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    movieId = json['movieId'];
    premiereDatetime = json['premiereDatetime'];
    userId = json['userId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    movie = json['movie'] != null ? new Movie.fromJson(json['movie']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    ticketCount = json['ticketCount'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['movieId'] = this.movieId;
    data['premiereDatetime'] = this.premiereDatetime;
    data['userId'] = this.userId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.movie != null) {
      data['movie'] = this.movie!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['ticketCount'] = this.ticketCount;
    data['id'] = this.id;
    return data;
  }
}

class Movie {
  String? coverImageUrl;
  String? trailerUrl;
  String? fullMovieLength;
  int? fullMovieBytes;
  String? categoryId;
  String? approvedAt;
  bool? isPublished;
  bool? allowMovieMakerControl;
  String? sId;
  String? title;
  String? tags;
  String? synopsis;
  String? cast;
  String? genreId;
  String? movieMakerId;
  String? slug;
  String? creatorId;
  String? createdAt;
  String? updatedAt;
  int? iV;
  Category? category;
  Genre? genre;
  String? id;

  Movie(
      {this.coverImageUrl,
      this.trailerUrl,
      this.fullMovieLength,
      this.fullMovieBytes,
      this.categoryId,
      this.approvedAt,
      this.isPublished,
      this.allowMovieMakerControl,
      this.sId,
      this.title,
      this.tags,
      this.synopsis,
      this.cast,
      this.genreId,
      this.movieMakerId,
      this.slug,
      this.creatorId,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.category,
      this.genre,
      this.id});

  Movie.fromJson(Map<String, dynamic> json) {
    coverImageUrl = json['coverImageUrl'];
    trailerUrl = json['trailerUrl'];
    fullMovieLength = json['fullMovieLength'];
    fullMovieBytes = json['fullMovieBytes'];
    categoryId = json['categoryId'];
    approvedAt = json['approvedAt'];
    isPublished = json['isPublished'];
    allowMovieMakerControl = json['allowMovieMakerControl'];
    sId = json['_id'];
    title = json['title'];
    tags = json['tags'];
    synopsis = json['synopsis'];
    cast = json['cast'];
    genreId = json['genreId'];
    movieMakerId = json['movieMakerId'];
    slug = json['slug'];
    creatorId = json['creatorId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    genre = json['genre'] != null ? new Genre.fromJson(json['genre']) : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coverImageUrl'] = this.coverImageUrl;
    data['trailerUrl'] = this.trailerUrl;
    data['fullMovieLength'] = this.fullMovieLength;
    data['fullMovieBytes'] = this.fullMovieBytes;
    data['categoryId'] = this.categoryId;
    data['approvedAt'] = this.approvedAt;
    data['isPublished'] = this.isPublished;
    data['allowMovieMakerControl'] = this.allowMovieMakerControl;
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['tags'] = this.tags;
    data['synopsis'] = this.synopsis;
    data['cast'] = this.cast;
    data['genreId'] = this.genreId;
    data['movieMakerId'] = this.movieMakerId;
    data['slug'] = this.slug;
    data['creatorId'] = this.creatorId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.genre != null) {
      data['genre'] = this.genre!.toJson();
    }
    data['id'] = this.id;
    return data;
  }
}

class Category {
  String? sId;
  String? name;
  String? slug;
  String? baseCurrency;
  int? basePrice;
  String? createdAt;
  String? updatedAt;
  int? iV;
  List<Pricings>? pricings;
  String? id;

  Category(
      {this.sId,
      this.name,
      this.slug,
      this.baseCurrency,
      this.basePrice,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.pricings,
      this.id});

  Category.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    baseCurrency = json['baseCurrency'];
    basePrice = json['basePrice'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    if (json['pricings'] != null) {
      pricings = <Pricings>[];
      json['pricings'].forEach((v) {
        pricings!.add(new Pricings.fromJson(v));
      });
    }
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['baseCurrency'] = this.baseCurrency;
    data['basePrice'] = this.basePrice;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.pricings != null) {
      data['pricings'] = this.pricings!.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    return data;
  }
}

class Pricings {
  String? countryId;
  String? sId;
  int? price;
  String? currency;
  String? categoryId;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? id;

  Pricings(
      {this.countryId,
      this.sId,
      this.price,
      this.currency,
      this.categoryId,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.id});

  Pricings.fromJson(Map<String, dynamic> json) {
    countryId = json['countryId'];
    sId = json['_id'];
    price = json['price'];
    currency = json['currency'];
    categoryId = json['categoryId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['countryId'] = this.countryId;
    data['_id'] = this.sId;
    data['price'] = this.price;
    data['currency'] = this.currency;
    data['categoryId'] = this.categoryId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['id'] = this.id;
    return data;
  }
}

class Genre {
  String? imageUrl;
  String? sId;
  String? name;
  String? slug;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? id;

  Genre(
      {this.imageUrl,
      this.sId,
      this.name,
      this.slug,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.id});

  Genre.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['id'] = this.id;
    return data;
  }
}

class User {
  String? sId;
  String? firstName;
  String? lastName;
  String? id;

  User({this.sId, this.firstName, this.lastName, this.id});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['id'] = this.id;
    return data;
  }
}
