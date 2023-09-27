import 'package:flutter/material.dart';

class Product {
  final String name;
  final int price;

  Product(this.name, this.price);
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String title = 'サンプル百貨店';

  @override
  Widget build(BuildContext context) {
    final data = [
      Product('商品A', 100),
      Product('商品B', 200),
      Product('商品C', 300),
      Product('商品D', 400),
      Product('商品E', 500),
      Product('商品F', 600),
      Product('商品G', 800),
      Product('商品H', 900),
      Product('商品I', 1000),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        toolbarHeight: 100,
        // タイトルをもう少し下に表示するためにCenterウィジェットでラップし、alignmentを調整
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 50.0, top: 20.0),
            child: Text(title),
          ),
        ),
        // AppBarの高さを80に設定
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 5.0),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                // ショッピングカートが押されたときの処理を追加
              },
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, // 横幅いっぱいに広げる
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildMenuItem('限定'),
                _buildMenuItem('目玉商品'),
                _buildMenuItem('人気'),
                _buildMenuItem('先行'),
                _buildMenuItem('プレ先行'),
                _buildMenuItem('クーポン'),
                _buildMenuItem('抽選'),
                _buildMenuItem('履歴'),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: data.asMap().entries.map((entry) {
                int index = entry.key;
                Product product = entry.value;
                Color color = index % 2 == 0 ? Colors.yellow : Colors.blue;
                return _buildColorfulBox(color, product.price, product.name);
              }).toList(),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: const Footer(),
    );
  }

  Widget _buildMenuItem(String title) {
    return InkWell(
      onTap: () {
        // タップされたときの処理を記述
      },
      child: Container(
        padding: const EdgeInsets.only(left: 12, right: 12),
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget _buildColorfulBox(Color color, int price, String productName) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black, //枠線の色
            width: 1, //枠線の太さ
          ),
        ),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                color: Colors.grey,
                width: 150,
                height: 100,
                alignment: Alignment.center,
                child: const Text(
                  '商品画像',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Expanded(
                child: Container(
                  color: color,
                  height: 100,
                ),
              ),
            ],
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                productName,
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            top: 38,
            right: 50,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                '$price円',
                style: const TextStyle(fontSize: 16),
              ),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
