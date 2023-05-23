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
import 'package:project/views/cart_page.dart';
import 'package:project/views/category_page.dart';
import 'package:project/views/fliter.dart';
import 'package:project/views/login_page.dart';
import 'package:project/views/my_order_page.dart';
import 'package:project/views/order_detail.dart';
import 'package:project/views/profile_page.dart';
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
              "/profilePage": (context) => const ProfilePage(),
              "/myhomepage": (context) => const MyHomePage(),
              "/bottomnavigation": (context) => const BottomNavigation(),
              "/categoryPage": (context) => const CategoriesPage(),
              "/cartPage": (context) => const CartPage(),
              "/fliterPage": (context) => const FliterPage(),
              "/myOrderPage": (context) => const MyOrederPage(),
              "/orderdetail": (context) => const OrderDetailPage(),
              // "/resetPassword": (context) => const resetPasswordPage(),
              // "/fordotPassword": (context) => const ForgotPaswwordPage(),
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
            icon: Icon(
              Icons.card_travel,
            ),
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
  @override
  void initState() {
    super.initState();

    _checkLogin();
  }

  _checkLogin() async {
    // Future.delayed(
    //   const Duration(milliseconds: 700),
    //   () async {
    bool exists = await const FlutterSecureStorage().containsKey(key: "token");

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => exists ? ProfilePage() : LoginPage(),
        ));
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          width: 80,
          height: 80,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.search),
          onTap: () {
            Navigator.pushNamed(context, "/fliterPage");
          },
        ),
      ),

      // body: DesignProductsPage(
      //   future: ProductController().getProducts(),
      // ),
    );
  }
}
