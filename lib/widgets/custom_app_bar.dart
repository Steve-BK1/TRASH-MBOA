import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onSignInPressed;
  final bool showSignInButton;

  const CustomAppBar({
    super.key,
    this.onSignInPressed,
    this.showSignInButton = true,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey[200]?.withOpacity(0.8),
      elevation: 0,
      leading: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
      ),
      title: Center(
        child: Image.asset(
          'assets/icons/6c6327619c4ac8a31ee9865731309f5da8bbd6ba.png',
          height: 40,
          errorBuilder: (context, error, stackTrace) {
            print('Erreur de chargement de l\'icône: $error');
            return const SizedBox.shrink();
          },
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ),
        if (showSignInButton)
          Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextButton(
              onPressed: onSignInPressed,
              child: const Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
