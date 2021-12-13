import 'package:flutter/material.dart';
import 'Aboutus.dart';
import 'package:get/get.dart';
// import 'package:flutter_email_sender/flutter_email_sender.dart';
// 
void main(){
  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GetMaterialApp(debugShowCheckedModeBanner: false,
      title: "AudioBook",
      home: Audiobook(),
);
  }
}



class Audiobook extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return AudiobookState();
  }
}


class AudiobookState extends State<Audiobook>{

  // Future<void> _launchEmail(string url)

  // _launchEmail()async{
  //   // launch()
  //   launch("mailto:alokj335@gmail.com?subject=FeedBack=ia m typing this");
  // }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(

        title: Text("AudioBook",
        style: TextStyle(fontWeight: FontWeight.bold),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications)),
          IconButton(onPressed: (){
            showSearch(context: context, delegate: CustomSearchDelegate(),);
          }, 
          icon: Icon(Icons.search_sharp)),
          SizedBox(height: 10,),
          IconButton(onPressed: (){}, icon: Icon(Icons.logout),),
          // IconButton(onPressed: (){}, icon: ),
        ],
        ),
        body: Column(children: [
          Center(child: IconButton(
            onPressed: (){
              Get.isDarkMode?
              Get.changeTheme(ThemeData.light()):
              Get.changeTheme(ThemeData.dark());
            },
          icon: Icon(Icons.dark_mode),
          iconSize: 30
          ),),
          
          
          ]),


        drawer: Drawer(
          
          child:  ListView(
            padding: EdgeInsets.all(10),
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  // color: Colors.black,
                  image: DecorationImage(
                  image: AssetImage("assets/a.png",
                  // width: 300,
                                        // height: 150,
                                        // fit:BoxFit.fill  ),
                  )
                    //  fit: BoxFit.fitWidth
                     
                     )
                ),
                child: Text("Audio Book")
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("privacy policy"),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => About(),
              ));
                })
            ],
          ),),

    );

}


  }

  class CustomSearchDelegate extends SearchDelegate{
    List<String> searchTerms = [
      "Robin sharma ",
      "david Goggins",
      "Richard branson",
      "bill gates",
      "water melons",
      "Jay shetty ",
      "Raj shamani ",
      "Swetabh gangwar",
      "Divyanshu Damani",
    ];
    @override
    List<Widget> buildActions(BuildContext context){
      return[
        IconButton(onPressed: (){
          query = '';
        }, icon: Icon(Icons.clear)
        )
      ];
    }
    @override
    Widget buildLeading(BuildContext context){
      return IconButton(onPressed: (){
        close(context, null);
      }, icon: Icon(Icons.arrow_back)
      );
    }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
   List<String> matchQuery = [];
   for (var fruit in searchTerms){
     if (fruit.toLowerCase().contains(query.toLowerCase()));{
       matchQuery.add(fruit);
     }
   }
   return ListView.builder(
    itemCount: matchQuery.length,
    itemBuilder: (context, index) {

     var result= matchQuery[index];
     return ListTile(
       title: Text(result)
       );

   });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    List<String> matchQuery = [];
   for (var fruit in searchTerms){
     if (fruit.toLowerCase().contains(query.toLowerCase()));{
       matchQuery.add(fruit);
     }
   }
   return ListView.builder(
    itemCount: matchQuery.length,
    itemBuilder: (context, index) {

     var result= matchQuery[index];
     return ListTile(
       title: Text(result)
       );

  }
  
   );
  }}