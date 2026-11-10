
import 'package:flutter/material.dart';

class CustomBookCard extends StatelessWidget {
  final String title;
  final bool isFavorite;
  final VoidCallback onFavoritePressed;
  final VoidCallback onTap;

  const CustomBookCard({
    super.key,
    required this.title,
    required this.isFavorite,
    required this.onFavoritePressed,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),

      child: ListTile(
        contentPadding: const EdgeInsets.all(12),

        leading: const CircleAvatar(
          backgroundColor: Colors.blue,
          child: Icon(
            Icons.book,
            color: Colors.white,
          ),
        ),

        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),

        subtitle: const Text('Library Collection'),

        trailing: IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : Colors.grey,
          ),
          onPressed: onFavoritePressed,
        ),

        onTap: onTap,
      ),
    );
  }
}
