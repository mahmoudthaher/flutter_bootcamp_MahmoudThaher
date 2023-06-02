import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:project/Providers/category_provider.dart';
import 'package:project/Providers/city_provider.dart';
import 'package:project/Providers/order_product_provider.dart';
import 'package:project/Providers/order_provider.dart';
import 'package:project/Providers/product_provider.dart';
import 'package:project/Providers/user_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project/firebase_options.dart';
import 'package:project/models/category_model.dart';
import 'package:project/models/product_model.dart';
import 'package:project/views/Login/forget_password.dart';
import 'package:project/views/Login/verification_page.dart';
import 'package:project/views/cart_page.dart';
import 'package:project/views/category_page.dart';
import 'package:project/views/fliter.dart';
import 'package:project/views/Login/login_page.dart';
import 'package:project/views/my_order_page.dart';
import 'package:project/views/order_detail.dart';
import 'package:project/views/profile_page.dart';
import 'package:project/views/profile_page_basic.dart';
import 'package:project/views/reset_password_page.dart';
import 'package:project/views/shopping_cart_icon.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CityProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => OrderProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => OrderProductProvider(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ar', 'AE'),
          ],
          title: 'Flutter Demo',
          builder: EasyLoading.init(),
          theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFffffff)),
          initialRoute: "/",
          onGenerateRoute: (settings) {
            var routes = {
              "/": (context) => const BottomNavigation(),
              "/loginPage": (context) => const LoginPage(),
              "/profilePage": (context) => ProfilePage(
                    onBack: () {},
                  ),
              "/myhomepage": (context) => const MyHomePage(),
              "/bottomnavigation": (context) => const BottomNavigation(),
              "/categoryPage": (context) => const CategoriesPage(),
              "/cartPage": (context) => const CartPage(),
              "/fliterPage": (context) => FliterPage(
                    onBack: () {},
                  ),
              "/myOrderPage": (context) => const MyOrederPage(),
              "/orderdetail": (context) => OrderDetailPage(
                    onBack: () {},
                  ),
              "/profilepagebisic": (context) => const ProfilePageBasic(),
              "/forgetPassword": (context) => ForgetPasswordPage(
                    onBack: () {},
                  ),
              "/verificationPage": (context) => const VerificationPage(),
              "/resetPasswordPage": (context) => RestPasswordPage(
                    onBack: () {},
                  ),
            };
            WidgetBuilder builder = routes[settings.name]!;
            return MaterialPageRoute(builder: (ctx) => builder(ctx));
          }),
    );
  }
}

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  List pages = [
    const MyHomePage(),
    //const CategoriesPage(),
    const CartPage(),
    const MyOrederPage(),
    const SplashScreen(),
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
      _currentPage = pages[currentIndex];
    });
  }

  Widget? _currentPage;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    var products = productProvider.products;
    setState(() {
      if (_currentPage == null) {
        _currentPage = pages[currentIndex];
      }
    });

    return Scaffold(
      appBar: productProvider.hideAppBar
          ? null
          : AppBar(
              backgroundColor: Colors.blue[700],
              toolbarHeight: 47,
              actions: [
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 30,
                    ),
                    onTap: () {
                      setState(() {
                        products.clear();
                        productProvider.hideAppBar = true;
                        _currentPage = FliterPage(
                          onBack: () {
                            // products = [];
                            setState(() {
                              _currentPage = pages[currentIndex];
                            });
                          },
                        );
                      });
                    },
                  ),
                ),
              ],
              title: Row(
                children: [
                  SizedBox(
                    width: 180,
                    child: Provider.of<CategoryProvider>(context, listen: false)
                            .name
                            .isNotEmpty
                        ? Text(
                            Provider.of<CategoryProvider>(context,
                                    listen: false)
                                .name,
                            style: TextStyle(
                              fontSize: 17,
                            ),
                            maxLines: 2,
                          )
                        : Container(),
                  ),
                  Icon(Icons.access_alarms_outlined),
                ],
              ),
            ),
      body: _currentPage,
      bottomNavigationBar: BottomNavigationBar(
        unselectedLabelStyle:
            const TextStyle(fontSize: 15, color: Colors.black),
        selectedLabelStyle: TextStyle(fontSize: 15, color: Colors.blue[700]),
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue[700],
        type: BottomNavigationBarType.fixed,
        //type: BottomNavigationBarType.shifting,طريقة الكبسة
        onTap: onTap,
        currentIndex: currentIndex,
        // elevation: 0,الخط الفوق
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "الرئيسة",
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.category,
          //   ),
          //   label: "الاقسام",
          // ),
          BottomNavigationBarItem(
            icon: ShoppingCartIcon(),
            label: "السلة",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag_outlined,
            ),
            label: "طلباتي",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_rounded,
            ),
            label: "حسابي",
          ),
        ],
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Widget _currentPage = Container();
  bool exists = false;
  @override
  void initState() {
    super.initState();

    _checkLogin();
  }

  _checkLogin() async {
    exists = await const FlutterSecureStorage().containsKey(key: "token");
    setState(() {
      if (exists) {
        _currentPage = const ProfilePageBasic();
      } else {
        _currentPage = const LoginPage();

        EasyLoading.dismiss();
        EasyLoading.showError("انت غير مسجل الرجاء قم بتسجيل الدخول");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _currentPage);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _currentPage = const MyHomePage();
  final List<String> imageUrls = [
    'https://mahmoud.nyc3.cdn.digitaloceanspaces.com/home/home23.png',
    'https://mahmoud.nyc3.cdn.digitaloceanspaces.com/home/home21.png',
    'https://mahmoud.nyc3.cdn.digitaloceanspaces.com/home/home3.png',
  ];
  final List<String> imageUrls2 = [
    'https://mahmoud.nyc3.cdn.digitaloceanspaces.com/home/home22.png',
    'https://mahmoud.nyc3.cdn.digitaloceanspaces.com/home/home123.png',
    'https://mahmoud.nyc3.cdn.digitaloceanspaces.com/home/home2.png',
  ];
  PageController _pageController = PageController();
  PageController _pageController2 = PageController();
  int _currentPageIndex = 0;
  int _currentPageIndex2 = 0;

  void _pageListener() {
    setState(() {
      _currentPageIndex = _pageController.page!.round() % imageUrls.length;
    });
  }

  void _pageListener2() {
    setState(() {
      _currentPageIndex2 = _pageController2.page!.round() % imageUrls2.length;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _pageController2.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<CategoryProvider>(context, listen: false);
    provider.getAllCategory();
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    setState(() {
      productProvider.getAllProductsByCategoryID();
    });

    _pageController = PageController(
      initialPage: imageUrls.length * 1000,
    )..addListener(_pageListener);
    _pageController2 = PageController(
      initialPage: imageUrls2.length * 1000,
    )..addListener(_pageListener2);

    showName();
  }

  String? name;
  Future<void> showName() async {
    if (await const FlutterSecureStorage().containsKey(key: 'token')) {
      String? fistName = await FlutterSecureStorage().read(key: 'fistName');
      String? gender = await FlutterSecureStorage().read(key: 'genderId');
      if (int.parse(gender!) == 1) {
        name = "اهلا السيد $fistName";
      } else if (int.parse(gender) == 2) {
        name = "اهلا السيدة $fistName";
      }
      setState(() {
        final provider = Provider.of<CategoryProvider>(context, listen: false);
        provider.name = name!;
      });
    }
  }

  bool hideAppBar = false;
  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final category = categoryProvider.categories;
    final productProvider = Provider.of<ProductProvider>(context);
    var products = productProvider.products;
    return Scaffold(
      body: SafeArea(
        child: _currentPage is MyHomePage
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20, top: 10),
                      child: Row(
                        children: const [
                          Text(
                            "وصل حديثا",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 200,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: imageUrls.length * 10000,
                        itemBuilder: (BuildContext context, int index) {
                          final int imageIndex = index % imageUrls.length;
                          return InteractiveViewer(
                            minScale: 0.1,
                            maxScale: 5.0,
                            child: Center(
                              child: Image.network(
                                imageUrls[imageIndex],
                                fit: BoxFit.fill,
                                width: double.infinity,
                                height: 200,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(imageUrls.length, (index) {
                        return Container(
                          width: 15,
                          height: 5,
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: _currentPageIndex == index
                                ? Colors.blue
                                : Colors.grey,
                          ),
                        );
                      }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, top: 10),
                      child: Row(
                        children: const [
                          Text(
                            "قريبا",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      child: PageView.builder(
                        controller: _pageController2,
                        itemCount: imageUrls2.length * 10000,
                        itemBuilder: (BuildContext context, int index) {
                          final int imageIndex = index % imageUrls2.length;
                          return InteractiveViewer(
                            minScale: 0.1,
                            maxScale: 5.0,
                            child: Center(
                              child: Image.network(
                                imageUrls2[imageIndex],
                                fit: BoxFit.fill,
                                width: double.infinity,
                                height: 200,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(imageUrls2.length, (index) {
                        return Container(
                          width: 15,
                          height: 5,
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: _currentPageIndex2 == index
                                ? Colors.blue
                                : Colors.grey,
                          ),
                        );
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, top: 10),
                      child: Row(
                        children: const [
                          Text(
                            "الأقسام",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      // height: 120,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: SizedBox(
                          height: 60,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: category.length,
                            itemBuilder: (context, index) {
                              CategoryModel categories = category[index];
                              return Consumer(
                                builder: (context,
                                    ProductProvider productProvider, child) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        productProvider.id = categories.id;
                                        productProvider
                                            .getAllProductsByCategoryID();
                                      });
                                    },
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 12),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                    color: productProvider.id ==
                                                            categories.id
                                                        ? Colors.black
                                                        : Colors.transparent,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                              child: Text(
                                                categories.category,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w900,
                                                  color: productProvider.id ==
                                                          categories.id
                                                      ? Colors.black
                                                      : Colors.grey,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 600,
                      child: products.isEmpty
                          ? const Center(
                              child: SizedBox(
                              width: 80,
                              height: 80,
                              child: CircularProgressIndicator(),
                            ))
                          : GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.65,
                              ),
                              itemCount: products.length,
                              itemBuilder: (context, index) {
                                ProductModel product = products[index];

                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Card(
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            side: BorderSide(
                                                color: Colors.black26)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, top: 10, right: 10),
                                          child: Wrap(
                                            children: [
                                              Image.network(
                                                product.image,
                                                width: 200,
                                                height: 100,
                                              ),
                                              Row(
                                                children: const [
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                height: 70,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Text(
                                                  product.name,
                                                  maxLines: 2,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 18),
                                                ),
                                              ),
                                              Row(
                                                children: const [
                                                  SizedBox(
                                                    height: 35,
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 10),
                                                    child: Text(
                                                      "${product.finalPrice.toStringAsFixed(2)} د.أ",
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18),
                                                    ),
                                                  ),
                                                  IconButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                            // borderRadius:
                                                            //     BorderRadius.circular(40),
                                                            ),
                                                        backgroundColor:
                                                            Colors.white,
                                                      ),
                                                      onPressed: () {
                                                        productProvider
                                                            .addToCart(product);
                                                        EasyLoading.dismiss();
                                                        EasyLoading.showSuccess(
                                                            "تم الاضافة الى السلة");
                                                      },
                                                      icon: Icon(
                                                        Icons.add_shopping_cart,
                                                        size: 30,
                                                      )),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                    )
                  ],
                ),
              )
            : FliterPage(
                onBack: () {
                  setState(() {
                    _currentPage = const MyHomePage();
                  });
                },
              ),
      ),
    );
  }
}
