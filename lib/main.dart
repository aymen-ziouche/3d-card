import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 3D Card',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter 3D Card experiment'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  double posX = 00, posY = 00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.black38,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        title: Text(widget.title),
      ),
      body: StreamBuilder<GyroscopeEvent>(
          stream: SensorsPlatform.instance.gyroscopeEvents,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              posX = posX + (snapshot.data!.x * 0.1);
              posY = posY + (snapshot.data!.y * 0.1);
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    width: double.infinity,
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Transform(
                      alignment: FractionalOffset.center,
                      transform: Matrix4.identity()
                        ..rotateX(posX)
                        ..rotateY(posY),
                      child: Container(
                        width: double.infinity - 40,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [
                                posY,
                                posX / posX,
                                // 0.5,
                              ],
                              colors: const [
                                Colors.purple,
                                Colors.orangeAccent,
                              ]),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 15,
                                spreadRadius: 10,
                                offset: Offset(posY * 10, posX * 10)),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text("Paysera",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Column(
                              children: [
                                const Align(
                                  alignment: Alignment.center,
                                  child: Text("0123 4567 8901 2345",
                                      style: TextStyle(
                                          letterSpacing: 2,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ),
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 57, top: 0.5),
                                    child: Text("1234",
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.white)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: const [
                                      SizedBox(width: 2),
                                      Text(
                                        "02/21",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                      SizedBox(width: 30),
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                                text: "Expires date  ",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white)),
                                            TextSpan(
                                                text: "02/24",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 2),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const [
                                    Text("John Doe",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                    SizedBox(width: 30),
                                    Text("VISA",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "All transactions :",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          SizedBox(
                            height: 500,
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.white,
                              child: ListView.builder(
                                itemBuilder: (_, __) => Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        width: 70.0,
                                        height: 70.0,
                                        color: Colors.white,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(top: 5)),
                                            Container(
                                              width: double.infinity,
                                              height: 10.0,
                                              color: Colors.white,
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5.0),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              height: 10.0,
                                              color: Colors.white,
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5.0),
                                            ),
                                            Container(
                                              width: 40.0,
                                              height: 8.0,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                itemCount: 10,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
