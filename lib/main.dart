import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/library_provider.dart';
import 'screens/books_screen.dart';
import 'screens/book_details_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LibraryProvider(),
      child: const LibraryApp(),
    ),
  );
}

class LibraryApp extends StatelessWidget {
  const LibraryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Library Management System',

      // Named routes
      initialRoute: '/',

      routes: {
        '/': (context) => const HomeScreen(),
        '/books': (context) => const BooksScreen(),
        '/details': (context) => const BookDetailsScreen(),
      },
    );
  }
}

// ------------------------------------------------------
// HOME SCREEN
// ------------------------------------------------------

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Library Management System'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      // Responsive UI
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return const MobileLayout();
          } else if (constraints.maxWidth < 900) {
            return const TabletLayout();
          } else {
            return const DesktopLayout();
          }
        },
      ),
    );
  }
}

// ------------------------------------------------------
// MOBILE LAYOUT
// ------------------------------------------------------

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Welcome to Digital Library',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 15),

            const Icon(Icons.library_books, size: 70, color: Colors.blue),

            const SizedBox(height: 15),

            Image.asset(
              'assets/images/library.jpg',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 15),

            const Text(
              'Browse books, manage records, and track your reading progress.',
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 15),

            // Provider state
            Consumer<LibraryProvider>(
              builder: (context, library, child) {
                return Text(
                  'Favorite Books: ${library.favoriteBooks.length}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/books');
              },
              child: const Text('Explore Books'),
            ),
          ],
        ),
      ),
    );
  }
}

// ------------------------------------------------------
// TABLET LAYOUT
// ------------------------------------------------------

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: Image.asset(
              'assets/images/library.jpg',
              height: 350,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 20),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.library_books, size: 80, color: Colors.blue),

                const SizedBox(height: 15),

                const Text(
                  'Welcome to Digital Library',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 15),

                const Text(
                  'Browse books, manage records, and track your reading progress.',
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 15),

                // Provider state
                Consumer<LibraryProvider>(
                  builder: (context, library, child) {
                    return Text(
                      'Favorite Books: ${library.favoriteBooks.length}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/books');
                  },
                  child: const Text('Explore Books'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------------------
// DESKTOP LAYOUT
// ------------------------------------------------------

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Image.asset(
              'assets/images/library.jpg',
              height: 450,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 30),

          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.library_books, size: 100, color: Colors.blue),

                const SizedBox(height: 20),

                const Text(
                  'Digital Library Management System',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 20),

                const Text(
                  'A responsive Flutter application that adapts to mobile, '
                  'tablet, and desktop screen sizes.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),

                const SizedBox(height: 15),

                // Provider state
                Consumer<LibraryProvider>(
                  builder: (context, library, child) {
                    return Text(
                      'Favorite Books: ${library.favoriteBooks.length}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/books');
                  },
                  child: const Text('Explore Books'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
