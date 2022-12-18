import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'my_encryption.dart';
import 'package:firebase_database/firebase_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  TextEditingController name = TextEditingController();
  TextEditingController IC = TextEditingController();
  TextEditingController DOB = TextEditingController();
  TextEditingController marital = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController race = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController debit = TextEditingController();
  TextEditingController health = TextEditingController();

  var encryptedname,
      encryptedIC,
      encryptedDOB,
      encryptedMS,
      encryptedPhone,
      encryptedRace,
      encryptedGender,
      encryptedAge,
      encryptedDebit,
      encryptedHS;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Privacy Engineering"),
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'Isi Form'),
              Tab(text: 'Display Information'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(40.0),
                child: Center(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: name,
                        decoration: const InputDecoration(hintText: "Name"),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: IC,
                        decoration: const InputDecoration(hintText: "IC"),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: DOB,
                        decoration: const InputDecoration(hintText: "DOB"),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: marital,
                        decoration:
                            const InputDecoration(hintText: "marital Status"),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: phone,
                        decoration: const InputDecoration(hintText: "PhoneNo"),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: race,
                        decoration: const InputDecoration(hintText: "Race"),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: gender,
                        decoration: const InputDecoration(hintText: "Gender"),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: age,
                        decoration: const InputDecoration(hintText: "Age"),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: debit,
                        decoration:
                            const InputDecoration(hintText: "Debit Card"),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: health,
                        decoration:
                            const InputDecoration(hintText: "Health History"),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),

                      //Button
                      ElevatedButton(
                        onPressed: () async {
                          encryptedname =
                              MyEncryptionDecryption.encryptAES(name.text);
                          encryptedIC =
                              MyEncryptionDecryption.encryptAES(IC.text);
                          encryptedDOB =
                              MyEncryptionDecryption.encryptAES(DOB.text);
                          encryptedMS =
                              MyEncryptionDecryption.encryptAES(marital.text);
                          encryptedPhone =
                              MyEncryptionDecryption.encryptAES(phone.text);
                          encryptedRace =
                              MyEncryptionDecryption.encryptAES(race.text);
                          encryptedGender =
                              MyEncryptionDecryption.encryptAES(gender.text);
                          encryptedAge =
                              MyEncryptionDecryption.encryptAES(age.text);
                          encryptedDebit =
                              MyEncryptionDecryption.encryptAES(debit.text);
                          encryptedHS =
                              MyEncryptionDecryption.encryptAES(health.text);

                          // Convert the Encrypted objects to base64-encoded strings
                          String encryptednameBase64 =
                              base64Encode(encryptedname.bytes);
                          String encryptedICBase64 =
                              base64Encode(encryptedIC.bytes);
                          String encryptedDOBBase64 =
                              base64Encode(encryptedIC.bytes);
                          String encryptedMSBase64 =
                              base64Encode(encryptedIC.bytes);
                          String encryptedPhoneBase64 =
                              base64Encode(encryptedIC.bytes);
                          String encryptedRaceBase64 =
                              base64Encode(encryptedIC.bytes);
                          String encryptedGenderBase64 =
                              base64Encode(encryptedIC.bytes);
                          String encryptedAgeBase64 =
                              base64Encode(encryptedIC.bytes);
                          String encryptedDebitBase64 =
                              base64Encode(encryptedIC.bytes);
                          String encryptedHSBase64 =
                              base64Encode(encryptedIC.bytes);

                          Map<String, dynamic> data = {
                            "Name": encryptednameBase64,
                            "IC": encryptedICBase64,
                            "DOB": encryptedDOBBase64,
                            "Marital Status": encryptedMSBase64,
                            "PhoneNo": encryptedPhoneBase64,
                            "Race": encryptedRaceBase64,
                            "Gender": encryptedGenderBase64,
                            "Age": encryptedAgeBase64,
                            "Debit Card": encryptedDebitBase64,
                            "Health History": encryptedHSBase64
                          };
                          final databaseReference = FirebaseFirestore.instance
                              .collection('encrypted_text')
                              .doc();
                          await databaseReference.set(data);

                          // FirebaseFirestore.instance.collection("Encrypted").add(data);
                        },
                        child: Text("Submit"),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Text('Display Content on Tab 2'),
          ],
        ));
  }
}
