import 'package:flutter/material.dart';
import 'app_text.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Center(
              child: AppText(
                "Navigation Drawer",
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
          ),
          const ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text("Shop"),
          ),
          const ListTile(
            leading: Icon(Icons.favorite),
            title: Text("Favorite"),
          ),
        ],
      ),
    );
  }
}
