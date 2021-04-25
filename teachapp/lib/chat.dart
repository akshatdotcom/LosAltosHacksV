import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Widget> _messages = [];

  Container _getMessages(String name, String message) {
    return Container(
      width: 400,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.transparent,
      ),
      child: Column(
        children: [
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(message),
        ],
      ),
    );
  }

  _ChatPageState() {
    _messages = [_getMessages('Bob', 'Hi everyone.'), _getMessages('Molly', 'Yo whats up bob'), _getMessages('Shelly', 'Oi bob, what are yall learning in physics this week?'),
      _getMessages('Bob', 'acceleration.'), _getMessages('Shelly', 'Sweet, then ill teach derivitaves!')
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView.builder(
          itemCount: _messages.length,
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 10, bottom: 10),
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
              child: _messages[index],
            );
          },
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
            height: 60,
            width: double.infinity,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(hintText: "Write message...", hintStyle: TextStyle(color: Colors.black54), border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                FloatingActionButton(
                  onPressed: () {
                    ///////
                    setState(() {
                      _messages.add(
                        Container(
                          width: 400,
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.transparent,
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Me',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('Hello!'),
                            ],
                          ),
                        ),
                      );
                    });
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                    size: 18,
                  ),
                  backgroundColor: Colors.white,
                  elevation: 0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
