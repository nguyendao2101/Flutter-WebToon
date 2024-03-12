import 'package:flutter/material.dart';

import 'images/image_extension.dart';

class CardInfo {
  String cardNo;
  String nameCard;

  CardInfo(this.cardNo, this.nameCard);
}


class Sceen3 extends StatefulWidget {
  const Sceen3({super.key});


  @override
  State<Sceen3> createState() => _Sceen3State();
}

class _Sceen3State extends State<Sceen3> {
  late TextEditingController _cardNoController;
  late TextEditingController _fullNameController;

  ///declare state
  String cardNoCardShow = '';
  String fullNameCardShow = '';

  List<CardInfo> cards = [];

  @override
  void initState() {
    super.initState();
    _cardNoController = TextEditingController();
    _fullNameController = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Danh sách thẻ'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ItemCard(
                  cardNoCardShow: cardNoCardShow,
                  fullNameCardShow: fullNameCardShow),
              CommonTextField(
                labelText: 'Card No',
                hintText: 'Enter Card No',
                textEditingController: _cardNoController,
                onChange: (cardNo) {
                  setState(() {
                    cardNoCardShow = cardNo ?? '';
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CommonTextField(
                labelText: 'Full Name',
                hintText: 'Enter Full Name',
                textEditingController: _fullNameController,
                onChange: (fullName) {
                  setState(() {
                    fullNameCardShow = fullName ?? '';
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_cardNoController.text.isEmpty ||
                      _fullNameController.text.isEmpty) {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (dialogContext) {
                          return AlertDialog(
                            content: Column(
                              mainAxisSize: MainAxisSize
                                  .min, //Thêm vào để fit size dialog
                              children: [
                                const Text(
                                  'Kiểm tra lại các giá trị không được để trống!',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(dialogContext).pop();
                                  },
                                  child: const Text('Đóng'),
                                ),
                              ],
                            ),
                          );
                        });
                  } else {
                    ///Tạo một đối tượng card mới giá trị lấy từ
                    ///giá trị hiện thời của ô nhập liệu
                    CardInfo newCard = CardInfo(
                      _cardNoController.text,
                      _fullNameController.text,
                    );
                    cards.add(newCard);

                    ///cập nhật lại giá trị text
                    _cardNoController.clear();
                    _fullNameController.clear();

                    ///render lại UI
                    setState(() {});
                  }
                },
                child: const Text('Thêm'),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 80,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: cards.length,
                  itemBuilder: (context, index) {
                    final currentCard = cards[index];
                    return ItemCard(
                      cardNoCardShow: currentCard.cardNo,
                      fullNameCardShow: currentCard.nameCard,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 20,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.cardNoCardShow,
    required this.fullNameCardShow,
    this.heightCard,
    this.widthCard,
    this.fontSize = 10,
  });

  final String cardNoCardShow;
  final String fullNameCardShow;
  final double? heightCard;
  final double? widthCard;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          ImageAssest.imageCard,
          height: heightCard,
          width: widthCard,
        ),
        Positioned(
          left: 10,
          bottom: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cardNoCardShow,
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                fullNameCardShow,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.textEditingController,
    required this.onChange,
  });

  final String labelText;
  final String hintText;
  final TextEditingController textEditingController;
  final void Function(String? value) onChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      onChanged: onChange,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }
}