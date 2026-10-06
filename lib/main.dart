import 'package:flutter/material.dart';
void main()=>runApp(const RedSecurity());
class RedSecurity extends StatelessWidget{
  const RedSecurity({super.key});
  @override Widget build(BuildContext context){
    return MaterialApp(debugShowCheckedModeBanner: false, theme: ThemeData.dark(), home: const MainNav());
  }
}
class MainNav extends StatefulWidget{
  const MainNav({super.key});
  @override State<MainNav> createState()=>_MainNavState();
}
class _MainNavState extends State<MainNav>{
  int index=0;
  final pages=[const SecurityPage(), const BoostPage()];
  @override Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black, selectedItemColor: Colors.cyanAccent, unselectedItemColor: Colors.white54,
        currentIndex: index, onTap: (i)=>setState(()=>index=i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.security), label: "Security"),
          BottomNavigationBarItem(icon: Icon(Icons.rocket_launch), label: "Game Boost"),
        ],
      ),
    );
  }
}
class SecurityPage extends StatelessWidget{
  const SecurityPage({super.key});
  @override Widget build(BuildContext context){
    return SafeArea(child: ListView(padding: const EdgeInsets.all(16), children: [
      const SizedBox(height: 20),
      Center(child: Container(width:180,height:180,decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white, boxShadow: [BoxShadow(color: Colors.blue.withOpacity(0.3), blurRadius: 30)]), child: const Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text("100", style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Colors.black)), Text("Optimized", style: TextStyle(color: Colors.black54))]))),
      const SizedBox(height: 30),
      GridView.count(crossAxisCount: 2, shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 1.5, children: [
        _card(Icons.delete, Colors.redAccent, "Cleaner", "Good"),
        _card(Icons.verified, Colors.tealAccent, "Security", "No virus"),
        _card(Icons.battery_charging_full, Colors.lightGreen, "Battery", "2h more"),
        _card(Icons.rocket, Colors.lightBlue, "Boost", "Fast"),
        _card(Icons.android, Colors.cyan, "Manage apps", "Update"),
        _card(Icons.cleaning_services, Colors.orangeAccent, "Deep clean", "Free space"),
      ]),
    ]));
  }
  static Widget _card(IconData icon, Color color, String title, String sub){
    return Container(decoration: BoxDecoration(color: const Color(0xFF1A1A1A), borderRadius: BorderRadius.circular(18)), padding: const EdgeInsets.all(14), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Icon(icon, color: color), const Spacer(), Text(title, style: const TextStyle(fontWeight: FontWeight.bold)), Text(sub, style: const TextStyle(color: Colors.white54, fontSize: 11))]));
  }
}
class BoostPage extends StatefulWidget{
  const BoostPage({super.key});
  @override State<BoostPage> createState()=>_BoostPageState();
}
class _BoostPageState extends State<BoostPage>{
  bool boosting=false;
  @override Widget build(BuildContext context){
    return SafeArea(child: Column(children: [
      const Padding(padding: EdgeInsets.all(20), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("BOOST", style: TextStyle(color: Colors.cyanAccent, fontSize: 24, fontWeight: FontWeight.bold)), Icon(Icons.gamepad, color: Colors.cyanAccent)])),
      const SizedBox(height: 20),
      Container(width:200,height:200,decoration: BoxDecoration(border: Border.all(color: Colors.cyanAccent), borderRadius: BorderRadius.circular(12), color: Colors.white10), child: const Center(child: Text("PUBG\nMOBILE", textAlign: TextAlign.center, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)))),
      const Spacer(),
      GestureDetector(onTap: ()=>setState(()=>boosting=!boosting), child: Container(width:200,height:45, decoration: BoxDecoration(border: Border.all(color: Colors.cyanAccent), borderRadius: BorderRadius.circular(6)), child: Center(child: Text(boosting?"BOOSTED 60FPS":"Open Game", style: const TextStyle(color: Colors.cyanAccent, fontWeight: FontWeight.bold))))),
      const SizedBox(height: 60),
    ]));
  }
}
