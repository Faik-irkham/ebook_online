// lib/widgets/search_and_profile.dart

import 'package:flutter/material.dart';

class SearchAndProfile extends StatelessWidget {
  const SearchAndProfile({super.key});

  @override
  Widget build(BuildContext context) {
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
}
