import 'package:flutter/material.dart';
import '../models/book_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTab = 0;

  int _selectedNavItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 255, 239, 158), Colors.white],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 0.5],
                ),
              ),
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 50, 20, 120),
                children: [
                  _buildSearchAndProfile(),
                  const SizedBox(height: 30),
                  _buildTabs(),
                  const SizedBox(height: 30),
                  _buildBookSection(
                    title: 'Popular Books',
                    books: popularBooks,
                    bookHeight: 220,
                  ),
                  const SizedBox(height: 30),
                  _buildBookSection(
                    title: 'Big Books of Spring',
                    books: springBooks,
                    bookHeight: 180,
                  ),
                  const SizedBox(height: 30),
                  _buildBookSection(
                    title: 'Top Selling',
                    books: topSellingBooks,
                    bookHeight: 180,
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: _buildBottomNavBar(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchAndProfile() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search books',
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 15),
            ),
          ),
        ),
        const SizedBox(width: 15),
        const CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(
            'https://placehold.co/100x100/EFEFEF/3A3A3A?text=User',
          ),
        ),
      ],
    );
  }

  Widget _buildTabs() {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(200),
      ),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () => setState(() => _selectedTab = 0),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    _selectedTab == 0
                        ? const Color(0xFFFFC700)
                        : Colors.grey[200],
                foregroundColor:
                    _selectedTab == 0 ? Colors.white : Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15),
                elevation: 0,
              ),
              child: const Text(
                'Ebooks',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: ElevatedButton(
              onPressed: () => setState(() => _selectedTab = 1),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    _selectedTab == 1
                        ? const Color(0xFFFFC700)
                        : Colors.grey[200],
                foregroundColor:
                    _selectedTab == 1 ? Colors.white : Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15),
                elevation: _selectedTab == 1 ? 4 : 0,
              ),
              child: const Text('Audiobooks'),
            ),
          ),
        ],
      ),
    );
  }

  // Widget reusable untuk membangun setiap seksi buku
  Widget _buildBookSection({
    required String title,
    required List<Book> books,
    required double bookHeight,
  }) {
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

  // Widget untuk menampilkan satu item buku (cover)
  Widget _buildBookItem({required Book book, required double height}) {
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

  // Widget untuk membangun bilah navigasi bawah kustom
  Widget _buildBottomNavBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem(Icons.home_filled, 0),
          _buildNavItem(Icons.menu_book_rounded, 1),
          _buildNavItem(Icons.bookmark, 2),
          _buildNavItem(Icons.shopping_bag_rounded, 3),
        ],
      ),
    );
  }

  // Widget untuk membuat satu item di bilah navigasi
  Widget _buildNavItem(IconData icon, int index) {
    bool isSelected = _selectedNavItem == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedNavItem = index),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFC700) : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.grey[400],
          size: 28,
        ),
      ),
    );
  }
}
