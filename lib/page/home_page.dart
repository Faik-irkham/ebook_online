import 'package:ebook_online/models/book_model.dart';
import 'package:ebook_online/widgets/navbar.dart';
import 'package:ebook_online/widgets/search_and_profile.dart';
import 'package:ebook_online/widgets/section_book.dart';
import 'package:ebook_online/widgets/tabs.dart';
import 'package:flutter/material.dart';

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
              decoration: BoxDecoration(
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
                  const SearchAndProfile(),
                  const SizedBox(height: 30),
                  EbookAudiobookTabs(
                    selectedTab: _selectedTab,
                    onTabChanged: (index) {
                      setState(() {
                        _selectedTab = index;
                      });
                    },
                  ),
                  const SizedBox(height: 30),
                  BookSection(
                    title: 'Buku Populer',
                    books: popularBooks,
                    bookHeight: 220,
                  ),
                  const SizedBox(height: 30),
                  BookSection(
                    title: 'Rekomendasi Kami',
                    books: springBooks,
                    bookHeight: 220,
                  ),
                  const SizedBox(height: 30),
                  BookSection(
                    title: 'Paling Laris',
                    books: topSellingBooks,
                    bookHeight: 220,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: CustomBottomNavBar(
              selectedIndex: _selectedNavItem,
              onItemTapped: (index) {
                setState(() {
                  _selectedNavItem = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
