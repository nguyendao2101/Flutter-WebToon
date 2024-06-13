// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/fearure/settings/setting_controller.dart';
import 'package:untitled/images/image_extension.dart';
import 'package:untitled/themes/app_theme.dart';
import 'package:untitled/themes/theme_controller.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  final _scrollController = ScrollController();
  final controller = Get.find<SettingController>();

  late DatabaseReference _databaseReference;
  late DatabaseReference _favouritesReference;
  String? userId;

  @override
  void initState() {
    super.initState();
    _initFirebase();
  }

  Future<void> _initFirebase() async {
    // Khởi tạo FirebaseApp nếu chưa được khởi tạo
    await Firebase.initializeApp();
    // Lấy người dùng đã đăng nhập từ Firebase Authentication
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        userId = user.uid;
        _databaseReference =
            FirebaseDatabase.instance.reference().child('users').child(userId!);
        _favouritesReference = FirebaseDatabase.instance
            .reference()
            .child('users')
            .child('favourites');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final themeData = themeController.themeData;

    return Obx(
      () => Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              backgroundColor: themeData.value.color.lightBackground,
              toolbarHeight: 60,
              automaticallyImplyLeading: false,
              elevation: 0.0,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(0.0),
                child: Container(
                  color: const Color(0xFFB9B6B6),
                  height: 0.8,
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'More',
                    style: themeData.value.text.h25,
                  ),
                ],
              ),
            ),
            backgroundColor: themeData.value.color.lightBackground,
            body: SafeArea(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, top: 16.0, right: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'User Information',
                            style: themeData.value.text.h20,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                themeController.changeTheme();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    themeData.value.color.secondary,
                                foregroundColor:
                                    themeData.value.color.boldBackground,
                              ),
                              child: const Text('Change theme')),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _userInfo(),
                          Image.asset(
                            ImageAssest.porofilePicture,
                            height: 150,
                          )
                        ],
                      ),
                    ),
                    _divider400(),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 20, bottom: 15, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [_coin(), _textCoin()],
                          ),
                          _buyCoin(),
                        ],
                      ),
                    ),
                    _divider400(),
                    _getTakeFreeCoin(themeData),
                    _divider400(),
                    _webtoonShop(themeData),
                    _divider400(),
                    _logoFunction(themeData),
                    _divider400(),
                    const SizedBox(height: 10),
                    _textNotice(themeData),
                    const SizedBox(height: 10),
                    _divider400(),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, top: 16.0, right: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Favourite Manga',
                            style: themeData.value.text.h20,
                          ),
                        ],
                      ),
                    ),
                    _favouriteMangaList(),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
          _iconSetting(themeData),
        ],
      ),
    );
  }

  Widget _userInfo() {
    if (userId == null) {
      return const Center(child: Text('Không có dữ liệu người dùng'));
    }

    return StreamBuilder(
      stream: _databaseReference.onValue,
      builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return const Center(child: Text('Có lỗi xảy ra'));
        }

        if (!snapshot.hasData || snapshot.data!.snapshot.value == null) {
          return const Center(child: Text('Không có dữ liệu'));
        }

        final data = snapshot.data!.snapshot.value as Map<dynamic, dynamic>;
        final hoTen = data['HoTen'] ?? '';
        final address = data['AddRess'] ?? '';
        final sex = data['Sex'] ?? '';

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: $hoTen',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text('Address: $address',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text('Sex: $sex',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
        );
      },
    );
  }

  Widget _favouriteMangaList() {
    if (userId == null) {
      return const Center(child: Text('Không có dữ liệu người dùng'));
    }
    return StreamBuilder(
      stream: _favouritesReference.onValue,
      builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return const Center(child: Text('Có lỗi xảy ra'));
        }

        if (!snapshot.hasData || snapshot.data!.snapshot.value == null) {
          return const Center(child: Text('Không có dữ liệu'));
        }

        final data = snapshot.data!.snapshot.value as Map<dynamic, dynamic>;
        final favouriteMangaList = data.values.toList();

        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: favouriteMangaList.length,
          itemBuilder: (context, index) {
            final manga = favouriteMangaList[index];
            return Column(
              children: [
                ListTile(
                  leading: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(8.0), // Đặt bo góc là 8 pixel
                    child: Image.network(
                      manga['imageUrl'],
                      width: 50, // Đặt kích thước ảnh tùy ý
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(manga['name']),
                ),
                SizedBox(height: 10),
              ],
            );
          },
        );
      },
    );
  }

  Divider _divider400() {
    return Divider(
      thickness: 0.8,
      color: Colors.grey[400],
    );
  }

  Positioned _iconSetting(Rx<AppTheme> themeData) {
    return Positioned(
      top: 36,
      right: 20,
      child: GestureDetector(
        onTap: () {
          // Xử lý khi người dùng nhấn vào biểu tượng
        },
        child: Icon(
          Icons.settings,
          color: themeData.value.color.boldBackground,
          size: 30,
        ),
      ),
    );
  }

  Padding _textNotice(Rx<AppTheme> themeData) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Text(
            ' Notice',
            style: themeData.value.text.h13,
          ),
          Image.asset(
            ImageAssest.sangNgang,
            height: 25,
          ),
          const Text(
            'Comment Section Upgrade',
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Padding _logoFunction(Rx<AppTheme> themeData) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Icon(
                Icons.search,
                size: 50,
              ),
              Text(
                'Search',
                style: themeData.value.text.h13,
              )
            ],
          ),
          Column(
            children: [
              Image.asset(
                ImageAssest.auto_darklight,
                height: 40,
              ),
              const SizedBox(height: 10),
              Text(
                'Set Theme',
                style: themeData.value.text.h13,
              )
            ],
          ),
          Column(
            children: [
              Image.asset(ImageAssest.dich, height: 45),
              const SizedBox(height: 5),
              Text(
                'Fan Translation',
                style: themeData.value.text.h13,
              ),
            ],
          )
        ],
      ),
    );
  }

  Padding _webtoonShop(Rx<AppTheme> themeData) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black, fontSize: 14),
              children: [
                TextSpan(text: 'Visit the', style: themeData.value.text.h12),
                const TextSpan(
                  text: ' WEBTOON SHOP',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green),
                )
              ],
            ),
          ),
          Image.asset(
            ImageAssest.sangNgang,
            height: 25,
          ),
        ],
      ),
    );
  }

  Padding _getTakeFreeCoin(Rx<AppTheme> themeData) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Get Free Coins for inviting friends to WEBTOON!',
            style: themeData.value.text.h12,
          ),
          Image.asset(
            ImageAssest.sangNgang,
            height: 25,
          ),
        ],
      ),
    );
  }

  Container _buyCoin() {
    return Container(
      width: 100,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Align(
        alignment: Alignment.center,
        child: Text(
          'Buy Coins',
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  Row _textCoin() {
    return const Row(
      children: [
        Text(
          '  Purchased',
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        Text(
          ' 0',
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Text(
          '  Free',
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        Text(
          ' 100',
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ],
    );
  }

  Row _coin() {
    return Row(
      children: [
        Image.asset(
          ImageAssest.logocoint,
          height: 40,
        ),
        const Text(
          '100',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Image.asset(
          ImageAssest.sangNgang,
          height: 40,
        )
      ],
    );
  }
}
