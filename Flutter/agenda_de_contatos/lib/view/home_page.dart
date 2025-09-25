import 'dart:io';

import 'package:agenda_de_contatos/database/helper/contact_helper.dart';
import 'package:agenda_de_contatos/database/model/contact_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ContactHelper helper = ContactHelper();
  List<Contact> contacts = [];
  @override
  void initState() {
    super.initState();
    // // teste para ver se o back funfa
    // // Contact g = Contact(name: "gigi", email: "bah@gmail.com", phone: "11964461333", img: null);
    // // helper.saveContact(g);
    // helper.getAllContact().then((list) {
    //   print(list);
    // });

    helper.getAllContact().then((list) {
      setState(() {
        contacts = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agenda de Contatos"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return _contactCard(context, index);
        },
      ),
    );
  }

  Widget _contactCard(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: Row(
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: contacts[index].img != null
                        ? FileImage(File(contacts[index].img!))
                        : AssetImage("assets/imgs/image.png") as ImageProvider,
                  ),
                ),
              ),
              Padding(padding: EdgeInsetsGeometry.only(left: 12), 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(contacts[index].name ?? "", style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),),
                  Text(contacts[index].email ?? "", style: TextStyle(
                    fontSize: 18,
                  ),),
                  Text(contacts[index].phone ?? "", style: TextStyle(
                    fontSize: 18,
                  ),),
                ],
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
