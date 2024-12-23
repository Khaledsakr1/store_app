/*
class ProductsModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RatingModel rating;

  ProductsModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductsModel.fromJson(jsonData) {
    return ProductsModel(
      price: _parsePrice (jsonData['price']),
      id: jsonData['id'],
      title: jsonData['title'],
      description: jsonData['description'],
      category: jsonData['category'],
      image: jsonData['image'],
      rating: RatingModel.fromJson(jsonData['rating']),
    );
  }

  // Function to handle mixed types (int and double)
  static double _parsePrice(dynamic priceValue) {
    if (priceValue is int) {
      return priceValue.toDouble(); // Convert int to double
    } else if (priceValue is double) {
      return priceValue; // If it's already double, return as is
    }
    return 0.0; // Default value if price is not int or double
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(jsonData) {
    return RatingModel(
   rate: _parseRate(jsonData ['rate']),
    count: jsonData['count']);
  }
  // Function to handle mixed types for rate
  static double _parseRate(dynamic rateValue) {
    if (rateValue is int) {
      return rateValue.toDouble(); // Convert int to double
    } else if (rateValue is double) {
      return rateValue; // If it's already double, return as is
    }
    return 0.0; // Default value if rate is not int or double
  }
}
*/

class ProductsModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RatingModel rating;

  ProductsModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductsModel.fromJson(jsonData) {
    return ProductsModel(
      price: _parsePrice(jsonData['price']),
      id: jsonData['id'],
      title: jsonData['title'],
      description: jsonData['description'],
      category: jsonData['category'],
      image: jsonData['image'],
      rating: jsonData['rating'] != null
          ? RatingModel.fromJson(jsonData['rating'])
          : RatingModel(rate: 0.0, count: 0),
    );
  }

  static double _parsePrice(dynamic priceValue) {
    if (priceValue is int) {
      return priceValue.toDouble();
    } else if (priceValue is double) {
      return priceValue;
    }
    print('Unexpected price type: $priceValue');
    return 0.0;
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(jsonData) {
    return RatingModel(
      rate: _parseRate(jsonData['rate'] ?? 0.0),
      count: jsonData['count'] ?? 0,
    );
  }

  static double _parseRate(dynamic rateValue) {
    if (rateValue is int) {
      return rateValue.toDouble();
    } else if (rateValue is double) {
      return rateValue;
    }
    print('Unexpected rate type: $rateValue');
    return 0.0;
  }
}
