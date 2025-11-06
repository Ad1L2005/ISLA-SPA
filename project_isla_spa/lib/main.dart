import 'package:flutter/material.dart';

void main() {
  runApp(const SpaApp());
}

class SpaApp extends StatelessWidget {
  const SpaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spa App',
      theme: ThemeData(
        primaryColor: Colors.amber,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    ServiceScreen(), 
    PlaceholderScreen(title: "Абонемент"),
    PlaceholderScreen(title: "QR код"),
    PlaceholderScreen(title: "Бронь"),
    PlaceholderScreen(title: "Профиль"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_membership), label: 'Абонемент'),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: 'QR'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: 'Бронь'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
        ],
      ),
    );
  }
}

class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "$title страница",
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  final List<Map<String, dynamic>> extraServices = [
  {
    "name": "Массаж головы",
    "price": 8000,
    "image": "https://plus.unsplash.com/premium_photo-1683134297492-cce5fc6dae31?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8c3BhfGVufDB8fDB8fHww&auto=format&fit=crop&q=60&w=900",
    "added": false
  },
  {
    "name": "Ароматерапия",
    "price": 6000,
    "image": "https://plus.unsplash.com/premium_photo-1679430672295-3846f0cf0503?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fHNwYXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&q=60&w=900",
    "added": false
  },
  {
    "name": "Пилинг лица",
    "price": 7000,
    "image": "https://images.unsplash.com/photo-1570172619644-dfd03ed5d881?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fHNwYXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&q=60&w=900",
    "added": false
  },
  {
    "name": "SPA для ног",
    "price": 5000,
    "image": "https://plus.unsplash.com/premium_photo-1723532450234-b1ab127c0cba?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8c3BhJTIwZm9vdHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&q=60&w=900",
    "added": false
  },
];


  int total = 25000; 

  void toggleService(int index) {
    setState(() {
      extraServices[index]["added"] = !extraServices[index]["added"];
      if (extraServices[index]["added"]) {
        total += extraServices[index]["price"] as int;
      } else {
        total -= extraServices[index]["price"] as int;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("ISLA Spa"),
        backgroundColor: Colors.grey.shade200,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                'https://images.unsplash.com/photo-1630595632518-8217c0bceb8f?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTh8fHNwYXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&q=60&w=900',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),

            Center(
  child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      const Text(
        "Программа восстановления и релаксации",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 8),
      const Text(
        "3 часа удовольствия с элементами ароматерапии, массажа и пилинга. Подходит для восстановления после напряжённой недели.",
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 16),
    ],
  ),
),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                InfoItem(icon: Icons.timer, text: "Длительность: 3 часа"),
                InfoItem(icon: Icons.spa, text: "Тип: Расслабляющий"),
              ],
            ),
            const SizedBox(height: 24),

            const Text(
              "Что входит в программу",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: width > 500 ? 3 : 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: const [
                ProgramCard(title: "5-этапное прогревание"),
                ProgramCard(title: "Сухой пилинг тела"),
                ProgramCard(title: "Аромамассаж"),
                ProgramCard(title: "Чайная церемония"),
              ],
            ),
            const SizedBox(height: 24),

            const Text(
              "Дополнительные услуги",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Column(
              children: List.generate(extraServices.length, (index) {
                final item = extraServices[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 1,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: ListTile(
  leading: CircleAvatar(
    radius: 25,
    backgroundImage: NetworkImage(item["image"]),
  ),
  title: Text(item["name"]),
  subtitle: Text("${item["price"]} ₸"),
  trailing: ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: item["added"]
          ? Colors.amber.shade700
          : Colors.grey.shade200,
      foregroundColor:
          item["added"] ? Colors.white : Colors.black,
    ),
    onPressed: () => toggleService(index),
    child: Text(item["added"] ? "Добавлено" : "Добавить"),
  ),
),
                );
              }),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey, width: 0.2)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Итого: $total ₸",
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Бронирование оформлено"),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Text("Бронировать",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InfoItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoItem({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.amber),
        const SizedBox(width: 6),
        Text(text),
      ],
    );
  }
}

class ProgramCard extends StatelessWidget {
  final String title;

  const ProgramCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
