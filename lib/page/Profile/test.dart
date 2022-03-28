/* import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


void main() => runApp(SearchableDropdownApp());

class SearchableDropdownApp extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

List<String> localData = ['One' ,'Two' ,'Three' ,'Four' ,'Five' ,'Six' ,'Seven' ,'Eight' ,'Nine' ,'Ten' ,];

class _AppState extends State<SearchableDropdownApp> {
  Map<String, String> selectedValueMap = Map();

  @override
  void initState() {
    
    selectedValueMap["server"] = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Searchable Dropdown Example App'),
        ),
        body: new SingleChildScrollView(
          child: Container(
            height: 571,
            width: double.infinity,
            color: Colors.white.withOpacity(0.4),
            child: Container(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    child: new Text(
                      'Dropdown with local data : ',
                      style: new TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ),
                  // use local data for providing options and store selected value to the key "local"
                  getSearchableDropdown(localData, "local"),
                  new Container(
                    child: new Text(
                      'server data : ',
                      style: new TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ),
                  FutureBuilder<List>(
                    // get data from server and return a list of mapped 'name' fields
                    future: getServerData(), //sets getServerData method as the expected Future
                    builder: (context, snapshot) {
                      if (snapshot.hasData) { //checks if response returned valid data
                        // use mapped 'name' fields for providing options and store selected value to the key "server"
                        return getSearchableDropdown( snapshot.data , "server");
                      }
                      else if (snapshot.hasError) { //checks if the response threw error
                        return Text("${snapshot.error}");
                      }
                      return CircularProgressIndicator();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getSearchableDropdown(List<dynamic>? listData, mapKey) {
    List<DropdownMenuItem> items = [];
    for(int i=0; i < listData!.length; i++) {
      items.add(new DropdownMenuItem(
          child: new Text(
            listData[i],
          ),
          value: listData[i],
        )
      );
    }
    return new SearchableDropdown(
      items: items,
      value: selectedValueMap[mapKey],
      isCaseSensitiveSearch: false,
      hint: new Text(
        'Select One'
      ),
      searchHint: new Text(
        'Select One',
        style: new TextStyle(
            fontSize: 20
        ),
      ),
      onChanged: (value) {
        setState(() {
          selectedValueMap[mapKey] = value;
        });
      },
    );
  }

  Future<List> getServerData() async {
    String url = 'https://wwwdev.csmju.com/api/equipmentapp';
//    String url = 'http://192.168.43.34:3000/numbers';
    var authToken = '1257|7D3I1qDi4m28ZWRMJTvSmVJ3kOYwSsBvyzJdQm16';
    final response = await http.get(Uri.parse(url), headers: {"Accept": "application/json",
      "Authorization": "Bearer $authToken"});

    if (response.statusCode == 200) {
      print(response.body);
      List<dynamic> responseBody = json.decode(response.body);
      // ignore: deprecated_member_use
      List<String> countries = new List.from(responseBody.map((item) => item['Equipment_Name']));
      for(int i=0; i < responseBody.length; i++) {
        countries.add(responseBody[i]['Equipment_Name']);
      }
      return countries;
    }
    else {
      print("error from server : $response");
      throw Exception('Failed to load post');
    }
  }
} */