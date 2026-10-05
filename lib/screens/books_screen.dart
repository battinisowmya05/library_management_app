import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/library_provider.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({super.key});

  final List<String> books = const [
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
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Consumer<LibraryProvider>(
        builder: (context, library, child) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: books.length,

            itemBuilder: (context, index) {
              final book = books[index];
              final isFavorite = library.isFavorite(book);

              return Card(
                child: ListTile(
                  leading: const Icon(Icons.book, color: Colors.blue),

                  title: Text(book),

                  trailing: IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.grey,
                    ),

                    onPressed: () {
                      context.read<LibraryProvider>().toggleFavorite(book);
                    },
                  ),

                  onTap: () {
                    Navigator.pushNamed(context, '/details');
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
