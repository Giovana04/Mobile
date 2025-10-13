import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../database/helper/contact_helper.dart' show ContactHelper;
import '../database/model/contact_model.dart' show Contact;

class ContactPage extends StatefulWidget {
  final Contact? contact;
  const ContactPage({Key? key, this.contact}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  Contact? _editContact;
  bool _userEdited = false;
  final _nameControler = TextEditingController();
  final _emailControler = TextEditingController();
  final _phoneControler = TextEditingController();
  final _imgControler = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  final ContactHelper _helper = ContactHelper();

  @override
  void initState() {
    super.initState();
    if (widget.contact == null) {
      _editContact = Contact(name: "", email: "", phone: "", img: "");
    } else {
      _editContact = widget.contact;
      _nameControler.text = _editContact?.name ?? "";
      _emailControler.text = _editContact?.email ?? "";
      _phoneControler.text = _editContact?.phone ?? "";
      _imgControler.text = _editContact?.img ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(_editContact?.name ?? "Novo Contato"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _saveContact();
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.save),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () => _selectImage(),
              child: Container(
                width: 140.0,
                height: 140.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image:
                        _editContact?.img != null &&
                            _editContact!.img!.isNotEmpty
                        ? FileImage(File(_editContact!.img!))
                        : AssetImage("assets/imgs/image.png") as ImageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            TextField(
              controller: _nameControler,
              decoration: InputDecoration(labelText: "Nome"),
              onChanged: (text) {
                _userEdited = true;
                setState(() {
                  _editContact?.name = text;
                });
              },
            ),
            TextField(
              controller: _emailControler,
              decoration: InputDecoration(labelText: "Email"),
              onChanged: (email) {
                _userEdited = true;
                setState(() {
                  _editContact?.email = email;
                });
              },
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _phoneControler,
              decoration: InputDecoration(labelText: "Telefone"),
              onChanged: (phone) {
                _userEdited = true;
                setState(() {
                  _editContact?.phone = phone;
                });
              },
              keyboardType: TextInputType.phone,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _editContact?.img = image.path;
      });
    }
  }

  void _saveContact() {
    String name = _nameControler.text.trim();
    String email = _emailControler.text.trim();
    String phone = _phoneControler.text.trim();

    

    if (_editContact?.img == "") {
      _editContact!.img = null;
    }
    if (_editContact?.name != null && _editContact!.name.isNotEmpty) {
      if (_editContact?.id != null) {
        _helper.updateContact(_editContact!);
      } else {
        _helper.saveContact(_editContact!);
      }
      Navigator.pop(context, _editContact);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Nome é Obrigatório")));
    }
  }
}
