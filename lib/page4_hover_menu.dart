import 'package:flutter/material.dart';
import 'page4_overlay_menu.dart';

class HoverMenu extends StatefulWidget {
  @override
  _HoverMenuState createState() => _HoverMenuState();
}

class _HoverMenuState extends State<HoverMenu> {
  bool isHovered = false;
  bool isMenuVisible = false;
  late OverlayEntry overlayEntry;

  @override
  void initState() {
    super.initState();
    overlayEntry = _createOverlayEntry();
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => OverlayMenu(
        onApplyFilters: (selectedFilters) {
          print("Selected Filters: $selectedFilters");
          _toggleMenu();
        },
      ),
    );
  }

  void _toggleMenu() {
    setState(() {
      isMenuVisible = !isMenuVisible;
      if (isMenuVisible) {
        Overlay.of(context)!.insert(overlayEntry);
      } else {
        overlayEntry.remove();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
          if (!isMenuVisible) {
            Overlay.of(context)!.insert(overlayEntry);
          }
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
          if (!isMenuVisible) {
            overlayEntry.remove();
          }
        });
      },
      child: GestureDetector(
        onTap: () {
          _toggleMenu();
        },
        child: Stack(
          children: [
            Container(
              width: 150,
              height: 150,
              color: Colors.grey,
              child: Center(
                child: Text(
                  "Menu",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    overlayEntry.remove();
    super.dispose();
  }
}
