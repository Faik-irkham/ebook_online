// lib/widgets/ebook_audiobook_tabs.dart

import 'package:flutter/material.dart';

class EbookAudiobookTabs extends StatelessWidget {
  final int selectedTab;
  final ValueChanged<int> onTabChanged;

  const EbookAudiobookTabs({
    super.key,
    required this.selectedTab,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(200),
      ),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () => onTabChanged(0),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    selectedTab == 0
                        ? const Color(0xFFFFC700)
                        : Colors.grey[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15),
                elevation: 0,
              ),
              child: Text(
                'Ebooks',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight:
                      selectedTab == 0 ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: ElevatedButton(
              onPressed: () => onTabChanged(1),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    selectedTab == 1
                        ? const Color(0xFFFFC700)
                        : Colors.grey[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15),
                elevation: selectedTab == 1 ? 4 : 0,
              ),
              child: Text(
                'Audiobooks',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight:
                      selectedTab == 1 ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
