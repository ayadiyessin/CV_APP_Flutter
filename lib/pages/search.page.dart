
import 'package:flutter/material.dart';
import 'package:projet_cv/pages/listsearch.page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage ({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final controller = TextEditingController();
  List<ListSearch> lstsearch = allListSearch;
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(16),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'recherche',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.blue),
                )
              ),
              onChanged: searchList,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: lstsearch.length,
              itemBuilder: (context,index){
                final sear = lstsearch[index];

                return ListTile(
                  title: Text(sear.nom),
                  onTap: () => Navigator.pushNamed(context, '/${sear.id}'),
                );
              },
            ),
          )
        ],
      ),

    );
  }

  void searchList(String query){
    final suggestions = allListSearch.where((element){
      final lstNom = element.nom.toLowerCase();
      final input = query.toLowerCase();

      return lstNom.contains(input);
    }).toList();

    setState(() =>lstsearch = suggestions);
  }
}