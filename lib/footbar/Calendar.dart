import 'dart:convert';
import 'dart:io';
import 'package:appcsmju/APImodel/Activity.dart';
import 'package:appcsmju/api/API_activity.dart';
import 'package:appcsmju/model/carouselmodel/Activitycustombelow.dart';
import 'package:appcsmju/page/Profile/Profile.dart';
import 'package:appcsmju/page/notifications/notifications.dart';
import 'package:http/http.dart' as http;

import 'package:appcsmju/model/calendarmodel/evencalendar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  const Calendar({
    Key? key,
  }) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    selectedEvents = {};
    findUser();
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  var ID;
  var image;
  var studentcode;
//////////////////////////////////////////////////////////////////////>>>>>>>>get user
  //ProfileP? profileP;
  Future<dynamic> findUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    studentcode = preferences.getString('Studentcode');
    var authToken = '1257|7D3I1qDi4m28ZWRMJTvSmVJ3kOYwSsBvyzJdQm16';
    var response = await http.get(
      Uri.parse("https://wwwdev.csmju.com/api/student/$studentcode"),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $authToken',
      },
    );
    var getuser = json.decode(response.body);
    var user = getuser['data'];
    print(user);
    for (var dataStudent in user) {
      setState(() {
        image = dataStudent['PictureProfile'];
      });

      print(image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[75],
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Profile();
            }));
          },
          child: ClipRRect(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: new BoxDecoration(
                      border: Border.all(
                          width: 2.5,
                          color: Color(0xff24a878)),
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.scaleDown,
                          image: new NetworkImage(image == null
                              ? 'https://wwwdev.csmju.com/images/news/thumbnail/no_img.jpg'
                              : image)))),
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "ปฏิทินกิจกรรม",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.blueGrey[900],
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Notifications();
              }));
            },
            icon: Icon(
              Icons.notifications,
              color: Colors.blueGrey[800],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TableCalendar(
              focusedDay: selectedDay,
              firstDay: DateTime(1990),
              lastDay: DateTime(2050),
              calendarFormat: format,
              onFormatChanged: (CalendarFormat _format) {
                setState(() {
                  format = _format;
                });
              },
              startingDayOfWeek: StartingDayOfWeek.monday,

              daysOfWeekVisible: true,
              daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  weekendStyle: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),

              //Day Changed
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                setState(() {
                  selectedDay = selectDay;
                  focusedDay = focusDay;
                });
                print(focusedDay);
              },
              selectedDayPredicate: (DateTime date) {
                return isSameDay(selectedDay, date);
              },

              eventLoader: _getEventsfromDay,

              //To style the Calendar
              calendarStyle: CalendarStyle(
                /* rangeStartTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Sarabun',
                ), */
                isTodayHighlighted: true,
                outsideTextStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Sarabun',
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                selectedTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Sarabun',
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                todayTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Sarabun',
                ),
                defaultDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                defaultTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Sarabun',
                ),
                weekendDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                weekendTextStyle: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Sarabun',
                ),
              ),
              headerStyle: HeaderStyle(
                titleTextStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Sarabun'),
                formatButtonVisible: true,
                titleCentered: true,
                formatButtonShowsNext: false,
                formatButtonDecoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                formatButtonTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Sarabun',
                ),
              ),
            ),
            ..._getEventsfromDay(selectedDay).map(
              (Event event) => ListTile(
                title: Text(
                  event.title,
                ),
              ),
            ),
            SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                physics: ScrollPhysics(),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: FutureBuilder(
                    future: ActivityApiService.getsActivity(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Activity>> snapshot) {
                      if (snapshot.hasData) {
                        List<Activity>? data = snapshot.data;
                        return Align(
                          alignment: Alignment.topCenter,
                          child: ListView.builder(
                            cacheExtent: 2000,
                            reverse: true,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(
                              parent: BouncingScrollPhysics(),
                            ),
                            itemCount: data!.length < 5 ? data.length : 5,
                            itemBuilder: (context, index) =>
                                customActivityBelow(data[index], context),
                          ),
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ))
          ],
        ),
      ),
      /* floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("เพิ่มกิจกรรมของคุณ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Sarabun',
                )),
            content: TextFormField(
              controller: _eventController,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            actions: [
              TextButton(
                child: Text("ยกเลิก",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sarabun',
                    )),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                child: Text("ตกลง",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sarabun',
                    )),
                onPressed: () {
                  if (_eventController.text.isEmpty) {
                    style:
                    TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sarabun',
                    );
                  } else {
                    if (selectedEvents[selectedDay] != null) {
                      selectedEvents[selectedDay]!.add(
                        Event(title: _eventController.text),
                      );
                    } else {
                      selectedEvents[selectedDay] = [
                        Event(title: _eventController.text)
                      ];
                    }
                  }
                  Navigator.pop(context);
                  _eventController.clear();
                  setState(() {});
                  return;
                },
              ),
            ],
          ),
        ),
        label: Text("เพิ่มกิจกรรม"),
        icon: Icon(Icons.add),
      ), */
    );
  }
}
