import 'package:flutter/material.dart';
import 'package:get/get.dart';

class historyPage extends StatelessWidget {
  final bool isFavoriteChecked;

  const historyPage({required this.isFavoriteChecked, super.key});

  @override
  Widget build(context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 117, 195, 219),
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: const Text("QR Service", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
              backgroundColor: Colors.black,
              bottom: const TabBar(
                tabs: [
                  Tab(
                    icon: Icon(Icons.history),
                    text: "History",
                  ),
                  Tab(
                    icon: Icon(Icons.star),
                    text: "Favorite",
                  ),
                ],
                indicatorColor: Colors.white,
                unselectedLabelColor: Colors.white,
                labelColor: Colors.blueAccent,
              ),
            ),
            body: TabBarView(
              children: [
                const his(),
                fav(isFavoriteChecked: isFavoriteChecked),
              ],
            ),
          ),
        ),
      ),
    );
  }    
}


class his extends StatelessWidget {
  const his({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 117, 195, 219),
        child: Column(
          children: <Widget>[const Row(
            mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 70.0,width: 20.0,),
            Text('History', style: TextStyle(fontSize: 25.0 , fontWeight: FontWeight.bold),),
            ],),

            const SizedBox(height: 400.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Text(
                      "Back",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        color: Colors.black
                        //decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

  
class fav extends StatelessWidget {
  final bool isFavoriteChecked;
  const fav({required this.isFavoriteChecked, super.key});
 
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 117, 195, 219),
        child: Column(
          children: <Widget>[const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 70.0,width: 20.0,),
              Text('Favorite', style: TextStyle(fontSize: 25.0 , fontWeight: FontWeight.bold),),
            ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 20.0),
                Text(
                      isFavoriteChecked ? 'Checked' : 'Not Checked',
                      style: const TextStyle(fontSize: 20.0),
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}