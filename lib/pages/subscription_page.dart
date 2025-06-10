import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import '../routes/app_routes.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key});

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  bool isWeekly = true; // true pour semaines, false pour mois
  int _selectedIndex = 1; // Index pour l'onglet Abonnements

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, AppRoutes.home);
        break;
      case 1:
        // Déjà sur la page d'abonnement
        break;
      case 2:
        Navigator.pushNamed(context, AppRoutes.notification);
        break;
      case 3:
        Navigator.pushNamed(context, AppRoutes.profile);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final fontSize16 = screenWidth * 0.04;

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
                  'Abonnements',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: fontSize16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.06),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 200,
                          height: 40,
                          margin: const EdgeInsets.only(top: 20),
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(72, 129, 54, 1),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(14),
                              bottomRight: Radius.circular(14),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Points verts:1400',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.04),
                      Container(
                        width: screenWidth * 0.7,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isWeekly = true;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: isWeekly
                                        ? const Color.fromRGBO(130, 234, 164, 1)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Semaines',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isWeekly = false;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: !isWeekly
                                        ? const Color.fromRGBO(130, 234, 164, 1)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Mois',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.04),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(130, 234, 164, 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Abonnement Basique',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              isWeekly
                                  ? '5000 FCFA / semaine'
                                  : '15000 FCFA / mois',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              '• Ramassage 2 fois par semaine\n• Points verts: 100 points\n• Support prioritaire',
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(117, 249, 76, 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Abonnement Premium',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              isWeekly
                                  ? '8000 FCFA / semaine'
                                  : '25000 FCFA / mois',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              '• Ramassage 3 fois par semaine\n• Points verts: 200 points\n• Support VIP\n• Service prioritaire',
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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
