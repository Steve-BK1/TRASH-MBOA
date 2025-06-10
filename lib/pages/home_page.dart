import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../routes/app_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        // Déjà sur la page d'accueil
        break;
      case 1:
        Navigator.pushNamed(context, AppRoutes.subscription);
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

    // Calcul des dimensions adaptatives
    final containerWidth = (screenWidth - 48 - 20) /
        2; // 48 pour le padding total, 20 pour l'espace entre les images
    final containerHeight = containerWidth * 0.68; // Ratio hauteur/largeur
    final headerHeight = screenHeight * 0.08; // 8% de la hauteur de l'écran
    final fontSize16 = screenWidth * 0.04; // 4% de la largeur de l'écran
    final fontSize12 = screenWidth * 0.03; // 3% de la largeur de l'écran

    // Dimensions pour les nouveaux conteneurs
    final distanceContainerWidth =
        (screenWidth - 48 - 20) / 2; // Même largeur que les images
    final distanceContainerHeight =
        distanceContainerWidth * 1.01; // Ratio pour obtenir 197px
    final textContainerHeight =
        distanceContainerWidth * 0.215; // Ratio pour obtenir 42px

    // Dimensions pour le triangle
    final triangleWidth =
        distanceContainerWidth * 0.7; // 70% de la largeur du conteneur
    final triangleHeight =
        triangleWidth * 0.2; // Légère augmentation de la hauteur du triangle

    return Scaffold(
      appBar: const CustomAppBar(
        onSignInPressed: null,
        showSignInButton: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: headerHeight,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(130, 234, 164, 1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Center(
                child: Text(
                  'TRASH SMART',
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
                  padding: EdgeInsets.all(
                      screenWidth * 0.06), // 6% de la largeur de l'écran
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              'assets/images/rejoindre.png',
                              width: containerWidth,
                              height: containerHeight,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                print(
                                    'Erreur de chargement de l\'image rejoindre.png: $error');
                                return Container(
                                  width: containerWidth,
                                  height: containerHeight,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: const Center(
                                    child: Icon(Icons.error_outline,
                                        color: Colors.red),
                                  ),
                                );
                              },
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              'assets/images/signale.png',
                              width: containerWidth,
                              height: containerHeight,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                print(
                                    'Erreur de chargement de l\'image signale.png: $error');
                                return Container(
                                  width: containerWidth,
                                  height: containerHeight,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: const Center(
                                    child: Icon(Icons.error_outline,
                                        color: Colors.red),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: screenHeight *
                              0.02), // 2% de la hauteur de l'écran
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Decharges les plus proches',
                                  style: TextStyle(
                                    fontSize: fontSize16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                    height: screenHeight *
                                        0.005), // 0.5% de la hauteur de l'écran
                                Text(
                                  'Allez! Il est temps de mettre ces locaux propre.',
                                  style: TextStyle(
                                    fontSize: fontSize12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Voir plus',
                              style: TextStyle(
                                color: const Color.fromRGBO(3, 158, 225, 1),
                                fontSize: fontSize12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: distanceContainerWidth,
                                height: distanceContainerHeight +
                                    textContainerHeight +
                                    4,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color:
                                        const Color.fromRGBO(217, 217, 217, 1),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: textContainerHeight,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      decoration: const BoxDecoration(
                                        color: Color.fromRGBO(117, 249, 76, 1),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(15),
                                          bottomRight: Radius.circular(15),
                                        ),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          '~ 250m de distance',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                  width: triangleWidth,
                                  height: triangleHeight,
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(217, 217, 217, 1),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(6),
                                      bottomRight: Radius.circular(6),
                                    ),
                                  ),
                                  child: const Text(
                                    'Ndogpassi',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            children: [
                              Container(
                                width: distanceContainerWidth,
                                height: distanceContainerHeight +
                                    textContainerHeight +
                                    4,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color:
                                        const Color.fromRGBO(217, 217, 217, 1),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: textContainerHeight,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      decoration: const BoxDecoration(
                                        color: Color.fromRGBO(117, 249, 76, 1),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(15),
                                          bottomRight: Radius.circular(15),
                                        ),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          '~ 500m de distance',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                  width: triangleWidth,
                                  height: triangleHeight,
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(217, 217, 217, 1),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(6),
                                      bottomRight: Radius.circular(6),
                                    ),
                                  ),
                                  child: const Text(
                                    'Logbaba',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Nouvelles et mises a jour',
                            style: TextStyle(
                              fontSize: fontSize16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Voir plus',
                              style: TextStyle(
                                color: const Color.fromRGBO(3, 158, 225, 1),
                                fontSize: fontSize12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Container(
                        width: screenWidth - 48, // 383px équivalent
                        height: screenHeight * 0.2, // 156px équivalent
                        margin: const EdgeInsets.symmetric(horizontal: 22),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(217, 217, 217, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/453d25a86b9a39826adb23005b9327747c5359b7.png',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              print(
                                  'Erreur de chargement de l\'image actualite.png: $error');
                              return Container(
                                color: const Color.fromRGBO(217, 217, 217, 1),
                                child: const Center(
                                  child: Icon(Icons.error_outline,
                                      color: Colors.red),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Container(
                        width: screenWidth - 48,
                        margin: const EdgeInsets.symmetric(horizontal: 22),
                        child: Material(
                          color: const Color.fromRGBO(117, 249, 76, 1),
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: const Center(
                                child: Text(
                                  'COMMANDER LE RAMASAGE DES DECHETS',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Container(
                        width: screenWidth - 48,
                        margin: const EdgeInsets.symmetric(horizontal: 22),
                        child: Material(
                          color: const Color.fromRGBO(117, 249, 76, 1),
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: const Center(
                                child: Text(
                                  'SIGNALEZ UN DEPOT D\'ORDURES',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Container(
                        width: screenWidth - 48,
                        height: screenHeight * 0.15,
                        margin: const EdgeInsets.symmetric(horizontal: 22),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(217, 217, 217, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/633a2c2c6ee1f67306dd1dabb4e50ef42396f488.png',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              print(
                                  'Erreur de chargement de l\'image promo.png: $error');
                              return Container(
                                color: const Color.fromRGBO(217, 217, 217, 1),
                                child: const Center(
                                  child: Icon(Icons.error_outline,
                                      color: Colors.red),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: screenHeight * 0.08, // 8% de la hauteur de l'écran
              color: const Color.fromRGBO(217, 217, 217, 1),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions),
            label: 'Abonnements',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromRGBO(130, 234, 164, 1),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
