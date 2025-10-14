import 'package:flutter/material.dart';
import 'package:rwad2/lists/doctorUI_list.dart';

class DoctorUI extends StatelessWidget {
  const DoctorUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back),
        title: Text('Favorites'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: doctor_list.length,
        itemBuilder: (context, index) {
          final item = doctor_list[index];
          return Stack(
            children: [
              SizedBox(
                height: 210,
                width: 290,
                child: Stack(
                  children: [
                    Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(item['image'], fit: BoxFit.fill),
                            Text(
                              item['title'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Icon(Icons.location_on_outlined, size: 20),
                                Text(
                                  item['location'],
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '${item['rate']}  ',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Image.asset('assets/images/rate.png'),
                                Text(
                                  item['review'],
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            Container(
                              color: const Color.fromARGB(255, 212, 212, 212),
                              height: 1,
                              width: double.infinity,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset('assets/images/speed.png'),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Image.asset('assets/images/clinicIcon.png'),
                                    Text(
                                      item['type'],
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: Image.asset('assets/images/fav.png'),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
