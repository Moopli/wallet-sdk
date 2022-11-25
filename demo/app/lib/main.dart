import 'package:flutter/material.dart';
import 'demo_method_channel.dart';
import 'dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Image.asset('lib/assets/images/logo.png', fit: BoxFit.scaleDown),
            toolbarHeight: 120.0,
            leadingWidth: 80,
            centerTitle: true,
            backgroundColor: Colors.deepPurple[800],
            ),
        body: const MyStatefulWidget(),
        backgroundColor:Colors.deepPurple[800] ,
      ),
      debugShowCheckedModeBanner: false, //Removing Debug Banner
    );
  }
}

var WalletSDKPlugin = MethodChannelWallet();

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _createDid() async {
   var did = await WalletSDKPlugin.createDID();
   print("created did:$did");
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            SizedBox(height: size.height * 0.02),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                style: const TextStyle(fontSize: 20, color: Colors.black),
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  labelText: 'Enter Username',
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                  ),                  onPressed: () {
                   _createDid();
                   Navigator.push(
                       context, MaterialPageRoute(builder: (_) => Dashboard()));
                    print("did is created successfully");
                  },
                  child: const Text('Register', style: TextStyle(fontSize: 22, color: Colors.deepPurple)
                  ),
                )
            ),
          ],
        ));
  }
}