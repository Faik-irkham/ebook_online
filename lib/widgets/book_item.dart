import 'package:ebook_online/models/book_model.dart';
import 'package:flutter/material.dart';

Widget buildBookItem({required Book book, required double height}) {
  return Container(
    width: height * 0.7, // Menjaga rasio aspek cover buku
    margin: const EdgeInsets.only(right: 15),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Image.asset(
        book.imageUrl,
        fit: BoxFit.cover,
        // Menambahkan error builder jika gambar gagal dimuat
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
