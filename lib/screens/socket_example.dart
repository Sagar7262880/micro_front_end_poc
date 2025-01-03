import 'dart:io';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:utility/utility.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  final _channel = WebSocketChannel.connect(
    Uri.parse('wss://echo.websocket.events'),
  );
  var db = DBService();
  var dio = DioService();
  var sf = SharedService();
  var no = 1;
  var ws = WebSocketService();

  @override
  void initState() {
    super.initState();
    // sf.setString("accessToken",
    //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbGllbnQiOiI1ZmUxY2M0MDM2NTQyMzIwMzU5MTFlOWYiLCJpZCI6IjY2ZjkzYjVmY2UzNDhmMjIwMmE2YjZlNyIsInVzZXJuYW1lIjoiSUlQTCBBRE1JTiBBRE1JTiAtIDIwMDAwMDAxIiwicm9sZSI6IjVmYzQ4ZjdjMTM3MzZlMTcxOGYzZDg2NiIsInJvbGVOYW1lIjoiU1VQRVIgQURNSU4iLCJmdWxsQWNjZXNzIjp0cnVlLCJkb21haW4iOiJkZW1vIiwiY29tcGFueSI6IjVmMTFmMWI1N2ZmNzc5MmNiZDAyZjRkNyIsImRlcGFydG1lbnQiOiI1ZmJmNTM0ZmQ2NjVjNTA2YjE0MTNmYTgiLCJsb2NhdGlvbiI6IjVmMWZjYThkYWEyNmFkMzQ4M2YwYTJlMiIsImRlc2lnbmF0aW9uIjoiNWZiZjUzM2RjY2FkZjMwNmIyYTBkNTY4IiwiZW1wbG95ZWVUeXBlIjoiNWZiZjUzNDljY2FkZjMwNmIyYTBkNWZmIiwiZW1wbG95ZWVDYXRlZ29yeSI6IjVmYzRhNGQ1MTNhM2JiMTc0NjJhOGM3MyIsImNvc3RDZW50ZXIiOiIiLCJzM0J1Y2tldCI6ImRlbW8tbmV3LWFlZjdlYmQzLWJhZjgtNGNhNi04YzRiLTZjMjNmNGYxZWNiOSIsImlwIjoiNjEuMi4yMjYuMTQyIiwiYWNjZXNzX21haW5fdHlwZSI6eyJfaWQiOiI1ZmJmNTQ1MWIzNDQ4MDA2ZDQ1ZGY1M2UiLCJuYW1lIjoiRU5URVJQUklTRVMifSwiYWNjZXNzX3N1Yl90eXBlIjp7Im1hc3Rlcl9mbGFnIjo5OTksIm5hbWUiOiJBbGwifSwiYWNjZXNzX21haW5fdHlwZV9kYXRhIjpbIjVmYmY1NDUxYjM0NDgwMDZkNDVkZjUzZSJdLCJhY2Nlc3Nfc3ViX3R5cGVfZGF0YSI6W10sImVtcGxveW1lbnRfdHlwZSI6W10sImRvbWFpbkFjY2Vzc1R5cGUiOiJFTVBMT1lNRU5UIFRZUEUiLCJpc19tYWluX2RvbWFpbiI6dHJ1ZSwibG9naW5fYXR0ZW5kYW5jZV9wb2xpY3kiOnsiZ3JvdXAiOnsiX2lkIjoiNjA0YjQ5YWViMGNlOTA3ZjQ5MGEzZWIxIiwibmFtZSI6IkxPR0lOIEFORCBBVFRFTkRBTkNFIn0sImlzX2VuYWJsZSI6dHJ1ZSwiX2lkIjoiNjA0OWFlYmYwYmE2MWY0OWYzMDliZjJiIiwibW9iaWxlX2xvZ2luIjp0cnVlLCJ3ZWJfbG9naW4iOnRydWUsIm1vYmlsZV9hdHRlbmRhbmNlIjp0cnVlLCJ3ZWJfYXR0ZW5kYW5jZSI6dHJ1ZSwibW9iaWxlX3Zpc2l0b3IiOnRydWUsIndlYl92aXNpdG9yIjp0cnVlLCJzaG9ydF9jb2RlIjoiTE5BIiwiY3JlYXRlZEF0IjoiMjAyMS0wMy0xMVQwNTo0NjozOS41OThaIiwidXBkYXRlZEF0IjoiMjAyNC0xMS0yNlQxMjoyODowNS4zNjdaIiwiX192IjowLCJtb2JpbGVfYXR0ZW5kYW5jZV9hcHByb3ZhbCI6dHJ1ZSwibW9iaWxlX2xvY2F0aW9uX3RyYWNraW5nIjp0cnVlLCJtb2JpbGVfbG9jYXRpb25fdHJhY2tpbmdfdGltZSI6bnVsbCwicXJfY29kZV9hdHRlbmRhbmNlX2FwcGx5Ijp0cnVlfSwibWFpbkRvbWFpbiI6ImRlbW8iLCJhY2Nlc3NEb21haW4iOiJkZW1vIiwiaXNNb2JpbGVSZXF1ZXN0IjpmYWxzZSwic3ViRG9tYWluRnVsbEFjY2VzcyI6ZmFsc2UsInNob3dSZWd1bGFyU2FsYXJ5U3ViRG9tYWluIjpmYWxzZSwiaWF0IjoxNzM1NzI4MjgxLCJleHAiOjE3MzU3MzU0ODEsImlzcyI6IkluZm9yZ2lyZCBJbmZvcm1hdHJpY3MifQ.DVUOPlA8mXTEhOOjX9z6_udy37KnDqIAF68O6LIRGoQ");
  }

  @override
  Widget build(BuildContext context) {
    // GetUtils.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              child: TextFormField(
                controller: _controller,
                decoration: const InputDecoration(labelText: 'Send a message'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: CustomElevatedButton(
                onPressed: () {
                  domainApi();
                },
                label: "Send domain",
              ),
            ),
            Center(
              child: CustomElevatedButton(
                onPressed: () async {
                  // db.openBox(Box.TEST);
                  db.putValue(Box.TEST, "students", [
                    {"name": "Sagar salunke", "id": no, "address": "pune"}
                  ]);
                  no++;
                },
                label: "add",
              ),
            ),
            Center(
              child: CustomElevatedButton(
                onPressed: () async {
                  // db.openBox(Box.TEST);
                  db.clearBox(Box.TEST);
                },
                label: "close box",
              ),
            ),
            Center(
              child: CustomElevatedButton(
                onPressed: () async {
                  // db.openBox(Box.TEST);
                  db.getValue(
                    Box.TEST,
                    "students",
                  );
                },
                label: "get",
              ),
            ),
            Center(
              child: CustomElevatedButton(
                onPressed: () async {
                  ws.connect(
                    onConnect: () => print("connect................."),
                    onDisconnect: () => print("Disconnected............"),
                  );
                  // ws.emit("", data)
                  ws.on("lkimlkmfxvs", (_) => print(_.toString()));
                },
                label: "connect",
              ),
            ),
            Center(
              child: CustomElevatedButton(
                onPressed: () async {
                  ws.disconnect();
                },
                label: "disconnect",
              ),
            ),
            Center(
              child: CustomElevatedButton(
                onPressed: () async {
                  // var path = await PathProvider.getPath(PathType.temporary);
                  // var file = await ImagePicker.pickImage(isFromFile: true);

                  // print(file.path);
                  const url = "https://gbihr.org/images/docs/test.pdf";
                  // var res = await dio.download(
                  //   url,
                  //   file.path ?? "",
                  // );
                  // print("Response: " + res.toString());

                  // Get.to(PdfViewer(file.path));
                  var path = await PathProvider.getExternalFolder(
                      folder: Folder.InfogirdApp);
                  print("Path===> " + path.toString());

                  // path = path + "/demo.txt";
                  // var f = File(path);
                  // f.writeAsString("hello");
                },
                label: "view pdf",
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: 'Send message',
        child: const Icon(Icons.send),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      _channel.sink.add(_controller.text);
    }
  }

  void domainApi() async {
    String baseUrl = "https://api.infogird.com/prod/api/"; //  Live

    String masterApi = "saas/" + "v1" + "/master-data/?enable=true";

    // var response = await dio.get("http://192.168.0.124:8080/api/v1/test");
    var response = await dio.get(masterApi, isShowLoading: true);
    print("=======" + response.toString());
  }

  @override
  void dispose() {
    _channel.sink.close();
    _controller.dispose();
    super.dispose();
  }
}
