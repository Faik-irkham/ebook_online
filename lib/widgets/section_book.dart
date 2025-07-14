// lib/widgets/book_section.dart

import 'package:flutter/material.dart';
import '../models/book_model.dart';

class BookSection extends StatelessWidget {
  final String title;
  final List<Book> books;
  final double bookHeight;

  const BookSection({
    super.key,
    required this.title,
    required this.books,
    required this.bookHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'See All',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: bookHeight,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: books.length,
            itemBuilder: (context, index) {
              return _buildBookItem(book: books[index], height: bookHeight);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBookItem({required Book book, required double height}) {
    return Container(
      width: height * 0.7,
      margin: const EdgeInsets.only(right: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Image.asset(
          book.imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[300],
              child: Center(
                child: Text(
                  book.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black54),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
