import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:project/Providers/category_provider.dart';
import 'package:project/Providers/city_provider.dart';
import 'package:project/Providers/order_product_provider.dart';
import 'package:project/Providers/order_provider.dart';
import 'package:project/Providers/product_provider.dart';
import 'package:project/Providers/user_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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

void main() {
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
              "/forgetPassword": (context) => const ForgetPasswordPage(),
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
    const CategoriesPage(),
    const CartPage(),
    const MyOrederPage(),
    const SplashScreen(),
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedLabelStyle:
            const TextStyle(fontSize: 15, color: Colors.black),
        selectedLabelStyle:
            const TextStyle(fontSize: 15, color: Color(0xFF222766)),
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        selectedItemColor: const Color(0xFF222766),
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
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
            ),
            label: "الاقسام",
          ),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentPage is MyHomePage
          ? SafeArea(
              child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 50,
                  color: Colors.black,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: InkWell(
                          child: const Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 30,
                          ),
                          onTap: () {
                            setState(() {
                              _currentPage = FliterPage(
                                onBack: () {
                                  setState(() {
                                    _currentPage = const MyHomePage();
                                  });
                                },
                              );
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ))
          : FliterPage(
              onBack: () {
                setState(() {
                  _currentPage = const MyHomePage();
                });
              },
            ),
    );
  }
}
