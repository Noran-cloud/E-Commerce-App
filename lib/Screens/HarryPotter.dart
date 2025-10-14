import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rwad2/Services/harryPotter_service.dart';
import 'package:rwad2/cubit/harry_potter_cubit.dart';
import 'package:rwad2/models/harryPotterModel.dart';

class Harrypotter extends StatefulWidget {
  const Harrypotter({super.key});

  @override
  State<Harrypotter> createState() => _HarrypotterState();
}

class _HarrypotterState extends State<Harrypotter> {
  //final harryPotterService = HarryPotterService();
  //List<HarryPotterModel> harry_potter = [];

  // Future<void> getBooksFromServer() async {
  //   try {
  //     harry_potter = await harryPotterService.getHarryBooks();
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   setState(() {});
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getBooksFromServer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Harry Potter',
          style: TextStyle(
            color: Colors.orangeAccent,
            fontSize: 40,
            fontFamily: 'LibreBaskerville',
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<HarryPotterCubit, HarryPotterState>(
        builder: (context, state) {
          if (state is HarryPotterLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is HarryPotterLoaded) {
            return ListView.builder(
              itemCount: state.harryPotterModel.length,
              itemBuilder: (context, index) {
                final item = state.harryPotterModel[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        child: Image.network(
                          item.cover ?? 'no image',
                          height: 200,
                          width: 200,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title ?? 'no title',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'LibreBaskerville',
                              color: const Color.fromARGB(255, 11, 42, 68),
                            ),
                          ),
                          SizedBox(
                            width: 700,
                            child: Text(
                              item.description ?? 'no description',
                              style: TextStyle(fontFamily: 'LibreBaskerville'),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.date_range,
                                color: const Color.fromARGB(255, 238, 48, 34),
                                size: 15,
                              ),
                              Text(
                                item.releaseDate ?? 'no date',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return Container(child: Text('No items to show'));
        },
      ),
    );
  }
}
