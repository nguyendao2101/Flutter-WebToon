import 'package:flutter/material.dart';

class ReadDetailView extends StatefulWidget {
  const ReadDetailView({Key? key}) : super(key: key);

  @override
  State<ReadDetailView> createState() => _ReadDetailViewState();
}

class _ReadDetailViewState extends State<ReadDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: Text('Tên truyện'),
              floating: true,
              snap: true,
              elevation: 0,
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 100,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Chương trước',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              Container(
                width: 100,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Danh sách',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              Container(
                width: 100,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Chương sau',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
