
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/library_provider.dart';
import '../widgets/custom_book_card.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({super.key});

  static const List<String> books = [
    'Flutter Development',
    'Dart Programming',
    'Mobile App Development',
    'Database Management',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Books'),
      ),

      body: Consumer<LibraryProvider>(
        builder: (context, library, child) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: books.length,

            itemBuilder: (context, index) {
              final book = books[index];

              return CustomBookCard(
                title: book,

                isFavorite: library.isFavorite(book),

                onFavoritePressed: () {
                  context
                      .read<LibraryProvider>()
                      .toggleFavorite(book);
                },

                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/details',
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
