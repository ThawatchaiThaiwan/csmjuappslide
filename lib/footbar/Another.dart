import 'package:appcsmju/page/Activity%20log.dart';
import 'package:appcsmju/page/Appeal.dart';
import 'package:appcsmju/page/Borrow_back.dart';
import 'package:appcsmju/page/Profile.dart';
import 'package:appcsmju/page/Repair.dart';
import 'package:flutter/material.dart';

class Another extends StatefulWidget {
  const Another({Key? key}) : super(key: key);

  @override
  _AnotherState createState() => _AnotherState();
}

class _AnotherState extends State<Another> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[75],
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "บริการอื่นๆ",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.person),
          color: Colors.black, //ยังไม่ได้เชื่อปุ่ม icons
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_active),
            color: Colors.black,
          ),
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: GridView(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profile()));
                  },
                  child: Container(
                    width: 120,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0x237dc0f3),
                        border: Border.all(color: Color(0x237dc0f3))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_circle,
                          size: 50,
                          color: Colors.grey,
                        ),
                        Text(
                          "โปรไฟล์",
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Repair()));
                  },
                  child: Container(
                    width: 120,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0x237dc0f3),
                        border: Border.all(color: Color(0x237dc0f3))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.library_books,
                          size: 50,
                          color: Colors.grey,
                        ),
                        Text(
                          "แจ้งตกค้าง",
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Appeal()));
                  },
                  child: Container(
                    width: 120,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0x237dc0f3),
                        border: Border.all(color: Color(0x237dc0f3))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.feedback_outlined,
                          size: 50,
                          color: Colors.grey,
                        ),
                        Text(
                          "ติดต่อหลักสูตร",
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Borrow_Back()));
                  },
                  child: Container(
                    width: 120,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0x237dc0f3),
                        border: Border.all(color: Color(0x237dc0f3))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.compare_arrows,
                          size: 50,
                          color: Colors.grey,
                        ),
                        Text(
                          "ยืม-คืน",
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Activity_log()));
                  },
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0x237dc0f3),
                        border: Border.all(color: Color(0x237dc0f3))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.data_saver_on,
                          size: 50,
                          color: Colors.grey,
                        ),
                        Text(
                          "บันทึกกิจกรรม",
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profile()));
                  },
                  child: Container(
                    width: 120,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0x237dc0f3),
                        border: Border.all(color: Color(0x237dc0f3))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_circle,
                          size: 50,
                          color: Colors.red[700],
                        ),
                        Text(
                          "ออกจากระบบ",
                          style:
                              TextStyle(color: Colors.red[700], fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
              ],
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10)),
        ),
      ),
    );
  }
}















/* class _AnotherState extends State<Another> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('บริการอื่น ๆ'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('โปรไฟล์', style: Theme.of(context).textTheme.title),
            trailing: Icon(Icons.arrow_forward_ios),
            leading: Icon(Icons.account_circle),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title:
                Text('แจ้งซ่อม', style: Theme.of(context).textTheme.title),
            trailing: Icon(Icons.arrow_forward_ios),
            leading: Icon(Icons.shopping_cart),
            onTap: () {
            
            },
          ),
          Divider(),
          ListTile(
            title: Text('ระบบบันทึกกิจกรรม', style: Theme.of(context).textTheme.title),
            trailing: Icon(Icons.arrow_forward_ios),
            leading: Icon(Icons.settings),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text('ร้องเรียนออนไลน์', style: Theme.of(context).textTheme.title),
            trailing: Icon(Icons.arrow_forward_ios),
            leading: Icon(Icons.info),
            onTap: () {},
          ),
           ListTile(
            title: Text('ยืม-คืน', style: Theme.of(context).textTheme.title),
            trailing: Icon(Icons.arrow_forward_ios),
            leading: Icon(Icons.info),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text('ออกจากระบบ', style: Theme.of(context).textTheme.title),
            trailing: Icon(Icons.arrow_forward_ios),
            leading: Icon(Icons.exit_to_app),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
 */
    