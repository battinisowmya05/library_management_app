import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/library_provider.dart';

class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen({super.key});

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  // Local state variable
  bool showDescription = false;

  @override
  Widget build(BuildContext context) {
    const String bookTitle = 'Flutter Development';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Details'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.menu_book, size: 80, color: Colors.blue),

              const SizedBox(height: 20),

              const Text(
                bookTitle,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              // Provider state
              Consumer<LibraryProvider>(
                builder: (context, library, child) {
                  final isFavorite = library.isFavorite(bookTitle);

                  return IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.grey,
                      size: 35,
                    ),

                    onPressed: () {
                      context.read<LibraryProvider>().toggleFavorite(bookTitle);
                    },
                  );
                },
              ),

              const SizedBox(height: 15),

              // setState()
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    showDescription = !showDescription;
                  });
                },

                child: Text(
                  showDescription ? 'Hide Description' : 'Show Description',
                ),
              ),

              const SizedBox(height: 20),

              // Dynamic UI controlled by setState()
              if (showDescription)
                const Text(
                  'Flutter Development is a book about building '
                  'cross-platform applications using Flutter and Dart.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
