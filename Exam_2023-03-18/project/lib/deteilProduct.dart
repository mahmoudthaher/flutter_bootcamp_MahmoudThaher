import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DeteilProductPage extends StatefulWidget {
  const DeteilProductPage({super.key});

  @override
  State<DeteilProductPage> createState() => _DeteilProductPageState();
}

class _DeteilProductPageState extends State<DeteilProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Color(0xFFffffff),
            child: Wrap(
              children: [
                Row(
                  children: const [
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 120,
                    ),
                    const Text(
                      'Detail Product',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 55,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Icon(Icons.arrow_forward),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Icon(Icons.shopping_cart_outlined),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  height: 0.5,
                  child: Container(color: Colors.grey),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 70, vertical: 30),
                  child: Image(
                    image: AssetImage('assets/images/product.png'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 55),
                  child: Row(
                    children: [
                      const Text(
                        '1/5 Foto',
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 22),
                  child: Row(
                    children: [
                      Text(
                        'Keripik Pasang Dahlia',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  margin: EdgeInsets.only(left: 22),
                  child: Row(
                    children: [
                      Text(
                        'Rp. 30.000',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.red[400],
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  margin: EdgeInsets.only(left: 12),
                  child: Row(
                    children: [
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.star,
                          size: 18,
                          color: Colors.yellow[800],
                        ),
                        label: Text(
                          '4.6',
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 17),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          '86 Reviews  ',
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 17),
                        ),
                      ),
                      SizedBox(
                        width: 90,
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          child: Text(
                            'Tersedia : 250',
                            style: TextStyle(
                                color: Color(0xFF3a9b7a), fontSize: 15),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFeefaf6),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: const [
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 27),
                  child: SizedBox(
                    width: double.infinity,
                    height: 0.5,
                    child: Container(color: Colors.grey),
                  ),
                ),
                Row(
                  children: const [
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                ListTile(
                  leading: const CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/detail_product.png'),
                  ),
                  title: const Text(
                    'BUMDES Desa Sidosari',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      const Text(
                        'Verified',
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.verified_user,
                        color: Colors.blue.shade800,
                        size: 18,
                      ),
                    ],
                  ),
                  trailing: InkWell(
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                      color: Colors.black,
                    ),
                    onTap: () {},
                  ),
                ),
                Row(
                  children: const [
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 27),
                  child: SizedBox(
                    width: double.infinity,
                    height: 0.5,
                    child: Container(color: Colors.grey),
                  ),
                ),
                Row(
                  children: const [
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 27),
                  child: Row(
                    children: const [
                      Text(
                        'Description Product',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: const [
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                const Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 27),
                  child: Text(
                    'Jenis tanaman pisang memang bermacam macam, namun tidak semua jenis bisa diolah menjadi kripik pisang hanya jenis jenis tertentu saja yang bagus digunakan sebagai bahan baku.Kripik pisang bisa diolah secara tradisionil atau melalui penggorengan biasa dan bisa juga diolah melalui mesin keripik buah. Kali ini kami akan memperkenalkan jenis kripik pisang yang diolah secara tradisionil, cara pengolahannya tidaklah rumit resep khususnya juga sudah diketahui umum karena cara pengolahan tradisionil keripik pisang adalah salah satu warisan yang turun temurun dikenalkan oleh generasi pendahulu kita.',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Row(
                  children: const [
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 27),
                  child: SizedBox(
                    width: double.infinity,
                    height: 0.5,
                    child: Container(color: Colors.grey),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 28),
                  child: Row(
                    children: [
                      Text(
                        'Ulasan (86)',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 230,
                      ),
                      Icon(
                        Icons.star,
                        size: 18,
                        color: Colors.yellow[700],
                      ),
                      Text('4.6', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
                ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/pictrue_1.png'),
                  ),
                  title: const Text(
                    'Andi',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 18,
                        color: Colors.yellow[700],
                      ),
                      Icon(
                        Icons.star,
                        size: 18,
                        color: Colors.yellow[700],
                      ),
                      Icon(
                        Icons.star,
                        size: 18,
                        color: Colors.yellow[700],
                      ),
                      Icon(
                        Icons.star,
                        size: 18,
                        color: Colors.yellow[700],
                      ),
                      Icon(
                        Icons.star_border_outlined,
                        size: 18,
                      ),
                    ],
                  ),
                  trailing: InkWell(
                    child: Text(
                      '2 Minggu yang lalu',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 71),
                  child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
                ),
                ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/pictrue_2.png'),
                  ),
                  title: const Text(
                    'Wijaya',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 18,
                        color: Colors.yellow[700],
                      ),
                      Icon(
                        Icons.star,
                        size: 18,
                        color: Colors.yellow[700],
                      ),
                      Icon(
                        Icons.star,
                        size: 18,
                        color: Colors.yellow[700],
                      ),
                      Icon(
                        Icons.star_border_outlined,
                        size: 18,
                      ),
                      Icon(
                        Icons.star_border_outlined,
                        size: 18,
                      ),
                    ],
                  ),
                  trailing: InkWell(
                    child: Text(
                      '1 Bulan yang lalu',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 71),
                  child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
                ),
                ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/pictrue_3.png'),
                  ),
                  title: const Text(
                    'Krisna',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 18,
                        color: Colors.yellow[700],
                      ),
                      Icon(
                        Icons.star,
                        size: 18,
                        color: Colors.yellow[700],
                      ),
                      Icon(
                        Icons.star,
                        size: 18,
                        color: Colors.yellow[700],
                      ),
                      Icon(
                        Icons.star,
                        size: 18,
                        color: Colors.yellow[700],
                      ),
                      Icon(
                        Icons.star_border_outlined,
                        size: 18,
                      ),
                    ],
                  ),
                  trailing: InkWell(
                    child: Text(
                      '2 Bulan yang lalu',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 71),
                  child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: const BorderSide(
                          color: Colors.black,
                        ),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Lihat Semua Ulasan',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.grey[100],
                  child: Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          children: [
                            Text(
                              'Featured Product',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 12, bottom: 12),
                              child: Card(
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Container(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 15),
                                        child: const Image(
                                          image: AssetImage(
                                              'assets/images/pictrue_4.png'),
                                          width: 100,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 20),
                                        child: const Text(
                                          'Keripik Pisang Pre..',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 90),
                                        child: Text(
                                          'Rp. 50.000',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.red[500],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            TextButton.icon(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.star,
                                                size: 15,
                                                color: Colors.yellow[800],
                                              ),
                                              label: Text(
                                                '4.6',
                                                style: TextStyle(
                                                    color: Colors.grey[700]),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              child: Text(
                                                '86 Reviews  ',
                                                style: TextStyle(
                                                  color: Colors.grey[700],
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              child: Icon(Icons.more_vert,
                                                  color: Colors.grey[600]),
                                              onTap: () {},
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, bottom: 12),
                              child: Card(
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Container(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 15),
                                        child: const Image(
                                          image: AssetImage(
                                              'assets/images/pictrue_5.png'),
                                          width: 143,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 15),
                                        child: const Text(
                                          '[Promo] Beras Koki..',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 90),
                                        child: Text(
                                          'Rp. 50.000',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.red[500],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            TextButton.icon(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.star,
                                                size: 15,
                                                color: Colors.yellow[800],
                                              ),
                                              label: Text(
                                                '4.6',
                                                style: TextStyle(
                                                    color: Colors.grey[700]),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              child: Text(
                                                '86 Reviews  ',
                                                style: TextStyle(
                                                  color: Colors.grey[700],
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              child: Icon(Icons.more_vert,
                                                  color: Colors.grey[600]),
                                              onTap: () {},
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 170,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    backgroundColor: Color(0xFFFE3A30)),
                                onPressed: () {},
                                child: Row(
                                  children: const [
                                    Text(
                                      'Added',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      width: 70,
                                    ),
                                    Icon(Icons.heart_broken),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 170,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    backgroundColor: Color(0xFF3669C9)),
                                onPressed: () {},
                                child: const Text(
                                  'Tambah Ke Keranjang',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
