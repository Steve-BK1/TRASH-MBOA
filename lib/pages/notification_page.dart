import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import '../routes/app_routes.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  int _selectedIndex = 2; // Index pour l'onglet Notifications

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    } else if (index == 1) {
      Navigator.pushReplacementNamed(context, AppRoutes.subscription);
    } else if (index == 3) {
      Navigator.pushReplacementNamed(context, AppRoutes.profile);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final fontSize16 = screenWidth * 0.04;

    // Liste de notifications simulées
    final List<Map<String, dynamic>> notifications = [
      {
        'title': 'Ramassage confirmé',
        'message': 'Votre ramassage a été confirmé pour demain à 9h00',
        'time': 'Il y a 5 minutes',
        'isRead': false,
        'type': 'success',
      },
      {
        'title': 'Points verts ajoutés',
        'message':
            'Vous avez gagné 50 points verts pour votre dernier ramassage',
        'time': 'Il y a 2 heures',
        'isRead': true,
        'type': 'points',
      },
      {
        'title': 'Rappel de ramassage',
        'message': 'N\'oubliez pas de sortir vos poubelles demain matin',
        'time': 'Il y a 1 jour',
        'isRead': true,
        'type': 'reminder',
      },
      {
        'title': 'Promotion spéciale',
        'message': 'Profitez de -20% sur votre prochain abonnement mensuel',
        'time': 'Il y a 2 jours',
        'isRead': true,
        'type': 'promo',
      },
    ];

    return Scaffold(
      appBar: const CustomAppBar(
        onSignInPressed: null,
        showSignInButton: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.08,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(130, 234, 164, 1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Center(
                child: Text(
                  'Notifications',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: fontSize16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(screenWidth * 0.04),
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  Color notificationColor;

                  // Définir la couleur en fonction du type de notification
                  switch (notification['type']) {
                    case 'success':
                      notificationColor =
                          const Color.fromRGBO(130, 234, 164, 1);
                      break;
                    case 'points':
                      notificationColor = const Color.fromRGBO(72, 129, 54, 1);
                      break;
                    case 'reminder':
                      notificationColor = const Color.fromRGBO(117, 249, 76, 1);
                      break;
                    case 'promo':
                      notificationColor = const Color.fromRGBO(255, 193, 7, 1);
                      break;
                    default:
                      notificationColor = Colors.grey;
                  }

                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: Container(
                        width: 12,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: notificationColor,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      title: Row(
                        children: [
                          Expanded(
                            child: Text(
                              notification['title'],
                              style: TextStyle(
                                fontWeight: notification['isRead']
                                    ? FontWeight.normal
                                    : FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          if (!notification['isRead'])
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          Text(
                            notification['message'],
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            notification['time'],
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        // Logique pour marquer la notification comme lue
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
