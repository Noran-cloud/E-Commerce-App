import 'package:flutter/material.dart';
import 'package:rwad2/DataBase/firebaseDB.dart';

class CrudFirebase extends StatefulWidget {
  const CrudFirebase({super.key});

  @override
  State<CrudFirebase> createState() => _CrudFirebaseState();
}

class _CrudFirebaseState extends State<CrudFirebase> {
  @override
  Widget build(BuildContext context) {
    var firebaseDB = FirebaseDB();
    var nameController = TextEditingController();
    var ageController = TextEditingController();
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('CRUD Firebase',style: TextStyle(fontFamily: 'LibreBaskerville',fontSize: 25,fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 12, 44, 70)),),
            SizedBox(height: 30,),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hint: Text('Enter Name',style: TextStyle(fontFamily: 'LibreBaskerville'),),
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: ageController,
              decoration: InputDecoration(
                hint: Text('Enter Age',style: TextStyle(fontFamily: 'LibreBaskerville'),),
              ),
            ),
            SizedBox(height: 40,),
            ElevatedButton(
              onPressed: () async{
                await firebaseDB.addUser(nameController.text, int.parse(ageController.text));
                nameController.clear();
                ageController.clear();
              }, 
              child: Text('Add',style: TextStyle(fontFamily: 'LibreBaskerville'),)),

              Expanded(
                child: StreamBuilder(
                  stream: firebaseDB.getUsers(), 
                  builder: (context, snapshot){
                    if(snapshot.hasError)
                    return Text('Error Loading Users !!!');
                    
                    if(snapshot.connectionState == ConnectionState.waiting)
                    return Center(child: CircularProgressIndicator(),);
                  
                   final data = snapshot.data!.docs;
                   return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context,index){
                      final doc = data[index];
                      final user = doc.data() as Map<String,dynamic>;
                      return ListTile(
                        title: Text(user['name']),
                        subtitle: Text('Age: ${user['age']}'),
                        trailing: Row( mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(onPressed: ()async{
                              await firebaseDB.updateUser(doc.id, user['name'], user['age']+1);
                            }, icon: Icon(Icons.edit)),
                            IconButton(onPressed: ()async{
                              await firebaseDB.deleteUser(doc.id);
                            }, icon: Icon(Icons.delete))
                          ],
                        ),
                      );
                    });
                  }))
          ],
        ),
      ),
    );
  }
}