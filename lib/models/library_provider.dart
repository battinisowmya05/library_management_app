import 'package:flutter/foundation.dart';

class LibraryProvider extends ChangeNotifier {
  final List<String> _favoriteBooks = [];

  List<String> get favoriteBooks => List.unmodifiable(_favoriteBooks);

  bool isFavorite(String book) {
    return _favoriteBooks.contains(book);
  }

  void toggleFavorite(String book) {
    if (_favoriteBooks.contains(book)) {
      _favoriteBooks.remove(book);
    } else {
      _favoriteBooks.add(book);
    }

    notifyListeners();
  }
}
