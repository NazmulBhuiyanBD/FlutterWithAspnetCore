import 'package:flutter/material.dart';
import 'package:hello/add_user.dart';
import 'package:hello/api_handler.dart';
import 'package:hello/edit_page.dart';

import 'model.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ApiHandler apiHandler=ApiHandler();
  late List<User> data=[];
  void getData() async {
    data=await apiHandler.getUserData();
    setState(() {
      
    });
  }
  void deleteUser(int userId) async
  {
await apiHandler.deleteUser(userId: userId);
setState(() {
  
});
  }
  @override
  void initState()
  {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FlutterApi"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: MaterialButton(
        color: Colors.teal,
        textColor: Colors.white,
        padding: EdgeInsets.all(20),
        onPressed: getData,
      child: const Text("Refresh"),),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddUser()));
        },
        child: const Icon(Icons.add),),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (BuildContext context,int index){
              return ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>EditPage(user: data[index])));
                },
                leading: Text("${data[index].userId}"),
                title: Text(data[index].name),
                subtitle: Text(data[index].address),
                trailing: IconButton(onPressed: (){
                  deleteUser(data[index].userId);
                }, icon: const Icon(Icons.delete_outline))
                
              );
            }
            
            )
        ],
      ),
    );
  }
}