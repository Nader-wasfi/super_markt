import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  int _currentIndex = 4;
  bool _isDarkMode = false;
  bool _isEditingName = false;
  
  String _username = 'Nader';
  final _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = _username;
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color bgModeColor = _isDarkMode ? const Color(0xff121212) : AppColors.white;
    Color tileBgColor = _isDarkMode ? const Color(0xff1E1E1E) : AppColors.white;
    Color textModeColor = _isDarkMode ? AppColors.white : AppColors.black;
    Color subTextModeColor = _isDarkMode ? const Color(0xffB3B3B3) : AppColors.grey;
    Color dividerModeColor = _isDarkMode ? const Color(0xff2D2D2D) : AppColors.lightGrey;

    return Scaffold(
      backgroundColor: bgModeColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 32,
                    backgroundColor: AppColors.lightGrey,
                    backgroundImage: AssetImage('assets/images/god-ryomen-sukuna-zy.jpg'),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _isEditingName
                            ? Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 40,
                                      child: TextField(
                                        controller: _nameController,
                                        style: TextStyle(color: textModeColor, fontSize: 16),
                                        decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.symmetric(vertical: 8),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: AppColors.mainGreen),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: AppColors.mainGreen, width: 2),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.check, color: AppColors.mainGreen),
                                    onPressed: () {
                                      setState(() {
                                        if (_nameController.text.trim().isNotEmpty) {
                                          _username = _nameController.text.trim();
                                        }
                                        _isEditingName = false;
                                      });
                                    },
                                  ),
                                ],
                              )
                            : GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isEditingName = true;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      _username,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: textModeColor,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    const Icon(
                                      Icons.edit_outlined,
                                      color: AppColors.mainGreen,
                                      size: 18,
                                    ),
                                  ],
                                ),
                              ),
                        const SizedBox(height: 5),
                        Text(
                          'nader@gmail.com',
                          style: TextStyle(
                            fontSize: 14,
                            color: subTextModeColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: dividerModeColor, height: 1),
            Expanded(
              child: ListView(
                children: [
                  _buildListTile(Icons.card_travel, 'Orders', textModeColor, dividerModeColor, tileBgColor),
                  _buildListTile(Icons.badge_outlined, 'My Details', textModeColor, dividerModeColor, tileBgColor),
                  _buildListTile(Icons.location_on_outlined, 'Delivery Address', textModeColor, dividerModeColor, tileBgColor),
                  _buildListTile(Icons.payment_outlined, 'Payment Methods', textModeColor, dividerModeColor, tileBgColor),
                  _buildListTile(Icons.local_offer_outlined, 'Promo Cord', textModeColor, dividerModeColor, tileBgColor),
                  _buildListTile(Icons.notifications_none_outlined, 'Notifecations', textModeColor, dividerModeColor, tileBgColor),
                  _buildThemeToggleTile(textModeColor, dividerModeColor, tileBgColor),
                  _buildListTile(Icons.help_outline, 'Help', textModeColor, dividerModeColor, tileBgColor),
                  _buildListTile(Icons.info_outline, 'About', textModeColor, dividerModeColor, tileBgColor),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
              child: Container(
                width: double.infinity,
                height: 65,
                decoration: BoxDecoration(
                  color: _isDarkMode ? const Color(0xff2A2A2A) : AppColors.buttonGrey,
                  borderRadius: BorderRadius.circular(19),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 25),
                    const Icon(
                      Icons.logout,
                      color: AppColors.mainGreen,
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Log Out',
                          style: TextStyle(
                            color: AppColors.mainGreen,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 50),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: dividerModeColor, width: 1),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: tileBgColor,
          selectedItemColor: AppColors.mainGreen,
          unselectedItemColor: textModeColor,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Shop',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: 'Favourite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title, Color textColor, Color dividerColor, Color tileBg) {
    return Container(
      color: tileBg,
      child: Column(
        children: [
          ListTile(
            leading: Icon(icon, color: textColor, size: 24),
            title: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: textColor,
              size: 16,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
            onTap: () {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Divider(color: dividerColor, height: 1),
          ),
        ],
      ),
    );
  }

  Widget _buildThemeToggleTile(Color textColor, Color dividerColor, Color tileBg) {
    return Container(
      color: tileBg,
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              _isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
              color: textColor,
              size: 24,
            ),
            title: Text(
              _isDarkMode ? 'Dark Mode' : 'Light Mode',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            trailing: Switch(
              value: _isDarkMode,
              activeColor: AppColors.mainGreen,
              onChanged: (value) {
                setState(() {
                  _isDarkMode = value;
                });
              },
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Divider(color: dividerColor, height: 1),
          ),
        ],
      ),
    );
  }
}