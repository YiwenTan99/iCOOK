import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iCOOK/Screens/recipes.dart';
import 'package:iCOOK/components/list_recipe.dart';

class RecipesScreen extends StatefulWidget {
  @override
  _RecipesScreenState createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  Future<bool> _onBackPressed(){
    return showDialog(
      context: context,
      builder: (context)=>AlertDialog(
        title: Text("Do you really want to exit the app?"),
        actions: <Widget>[
          FlatButton(
            child: Text("No",style: TextStyle(color: Colors.lightGreen)),
            onPressed: ()=>Navigator.pop(context,false),
          ),
          FlatButton(
            child: Text("Yes",style: TextStyle(color: Colors.lightGreen)),
            onPressed: ()=>Navigator.pop(context,true),
          )
        ],
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
        backgroundColor: Colors.grey[800],
          appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          title: Text(
            'iCOOK - Recipes',
            style: GoogleFonts.specialElite(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.black,
            ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          actions:<Widget>[
            IconButton( 
              onPressed: (){
                showSearch(context: context, delegate: RecipeSearch());
              },icon: Icon(Icons.search, color:Colors.white,size:30.0),
            ),
          ],
        ),
        body: Container(
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child:Column(
                children: <Widget>[
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      primary: false,
                      children: <Widget>[
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 10,
                          child: GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/tomatoegg.jpg"),
                                  fit: BoxFit.fitWidth,
                                  colorFilter: 
                                  ColorFilter.mode(Colors.black.withOpacity(0.7), 
                                  BlendMode.dstATop),
                                  alignment: Alignment.topCenter,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Tomato Eggs',
                                  textAlign: TextAlign.center,
                                  style:GoogleFonts.russoOne(
                                    //fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.grey[900],
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context){
                                  return RecipeDetail();
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 10,
                          child: GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/tomatoegg.jpg"),
                                  fit: BoxFit.fitWidth,
                                  colorFilter: 
                                  ColorFilter.mode(Colors.black.withOpacity(0.7), 
                                  BlendMode.dstATop),
                                  alignment: Alignment.topCenter,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Tomato Eggs',
                                  textAlign: TextAlign.center,
                                  style:GoogleFonts.russoOne(
                                    //fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.grey[900],
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context){
                                  return null;
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                      crossAxisCount: 2,
                    ),
                  ),
                ],
              ),
            ),
        )
      ),
    );
  }
}

class RecipeSearch extends SearchDelegate<RecipeItem>{
  @override
  List<Widget> buildActions(BuildContext context) {
      return [
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query="";
          },
        ),
      ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
       return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        },
      );
    }
  
    @override
    Widget buildResults(BuildContext context) {
      return Center(child: Text(query, style: TextStyle(fontSize: 20),));
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
      
      final mylist = query.isEmpty? loadRecipeItem()
      : loadRecipeItem().where((p)=>p.category.startsWith(query)).toList();

      return mylist.isEmpty? Text('No Results Found...', style: TextStyle(fontSize:20),): ListView.builder(
        itemCount: mylist.length,
        itemBuilder: (context,index){
          final RecipeItem listitem = mylist[index];
          return ListTile(
            onTap: (){
              showResults(context);
            },
            title: 
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(listitem.title,style:TextStyle(fontSize:20),),
                Text(listitem.category,style:TextStyle(color:Colors.grey),),
                Divider()
              ],
            ),);
        }
      );
    }

}