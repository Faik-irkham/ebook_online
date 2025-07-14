// lib/models/book_model.dart

class Book {
  final String title;
  final String author;
  final String imageUrl;

  const Book({
    required this.title,
    required this.author,
    required this.imageUrl,
  });
}

// --- Data Buku Best-Seller Indonesia ---
// Path gambar sekarang mengarah ke folder assets lokal.
// Pastikan Anda memiliki gambar dengan nama yang sesuai di folder assets/images/.

final List<Book> popularBooks = [
  const Book(
    title: 'Laut Bercerita',
    author: 'Leila S. Chudori',
    imageUrl: 'assets/images/laut_bercerita.jpeg',
  ),
  const Book(
    title: 'Hujan',
    author: 'Tere Liye',
    imageUrl: 'assets/images/hujan.jpg',
  ),
];

final List<Book> springBooks = [
  const Book(
    title: 'Cantik Itu Luka',
    author: 'Eka Kurniawan',
    imageUrl: 'assets/images/cantik_itu_luka.jpg',
  ),
  const Book(
    title: 'Laskar Pelangi',
    author: 'Andrea Hirata',
    imageUrl: 'assets/images/laskar_pelangi.jpg',
  ),
  const Book(
    title: 'Bumi Manusia',
    author: 'Pramoedya Ananta Toer',
    imageUrl: 'assets/images/bumi_manusia.jpg',
  ),
];

final List<Book> topSellingBooks = [
  const Book(
    title: 'Filosofi Kopi',
    author: 'Dee Lestari',
    imageUrl: 'assets/images/filosofi_kopi.jpg',
  ),
  const Book(
    title: 'Gadis Kretek',
    author: 'Ratih Kumala',
    imageUrl: 'assets/images/gadis_kretek.jpg',
  ),
  const Book(
    title: 'Atomic Habits',
    author: 'James Clear (Terjemahan)',
    imageUrl: 'assets/images/atomic_habits.jpg',
  ),
];
