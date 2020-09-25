import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  String _name;
  String _Mobile;
  String _PIN;
  String _address1;
  String _address2;
  String _address3;
  String _sta;
  String _mailid;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(border: new OutlineInputBorder(borderRadius: const BorderRadius.all(const Radius.circular(100.0))),labelText: 'Full Name'),
      style: TextStyle(color: Colors.green, fontSize: 12),
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(border: new OutlineInputBorder(borderRadius: const BorderRadius.all(const Radius.circular(100.0))),labelText: 'Mobile number'),
      style: TextStyle(color: Colors.green, fontSize: 12),
      keyboardType: TextInputType.phone,
      onSaved: (String value) {
        _Mobile = value;
      },
    );
  }

  Widget _buildPIN() {
    return TextFormField(
      decoration: InputDecoration(border: new OutlineInputBorder(borderRadius: const BorderRadius.all(const Radius.circular(100.0))),labelText: 'PIN Code'),
      style: TextStyle(color: Colors.green, fontSize: 12),
      keyboardType: TextInputType.number,

      onSaved: (String value) {
        _PIN = value;
      },
    );
  }
  Widget _buildAddress1() {
    return TextFormField(
      decoration: InputDecoration(border: new OutlineInputBorder(borderRadius: const BorderRadius.all(const Radius.circular(100.0))),labelText: 'Flat, House no. Building, Comapny, Apartment'),
      style: TextStyle(color: Colors.green, fontSize: 12),

      onSaved: (String value) {
        _address1 = value;
      },
    );
  }
  Widget _buildAddress2() {
    return TextFormField(
      decoration: InputDecoration(border: new OutlineInputBorder(borderRadius: const BorderRadius.all(const Radius.circular(100.0))),labelText: 'Area, Colony ,Street, Sector, Village'),
      style: TextStyle(color: Colors.green, fontSize: 12),
      onSaved: (String value) {
        _address2 = value;
      },
    );
  }

  Widget _buildAddress3() {
    return TextFormField(
      decoration: InputDecoration(border: new OutlineInputBorder(borderRadius: const BorderRadius.all(const Radius.circular(100.0))),labelText: 'Landmark, E.g. Near Ram Koti'),
      style: TextStyle(color: Colors.green, fontSize: 12),
      onSaved: (String value) {
        _address3 = value;
      },
    );
  }
  Widget _buildsta() {
    return TextFormField(
      decoration: InputDecoration(border: new OutlineInputBorder(borderRadius: const BorderRadius.all(const Radius.circular(100.0))),labelText: 'State'),
      style: TextStyle(color: Colors.green, fontSize: 12),
      onSaved: (String value) {
        _sta = value;
      },
    );
  }
  Widget _buildmailid() {
    return TextFormField(
      decoration: InputDecoration(border: new OutlineInputBorder(borderRadius: const BorderRadius.all(const Radius.circular(100.0))),labelText: 'MAIL ID'),
      style: TextStyle(color: Colors.green, fontSize: 12),
      keyboardType: TextInputType.emailAddress,
      onSaved: (String value) {
        _mailid = value;
      },
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: Colors.green,title: Text("Add New Address")),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildName(),
              SizedBox(height: 10),
              _buildPhoneNumber(),
              SizedBox(height: 10),
              _buildAddress1(),
              SizedBox(height: 10),
              _buildAddress2(),
              SizedBox(height: 10),
              _buildAddress3(),
              SizedBox(height: 10),
              _buildsta(),
              SizedBox(height: 10),
              _buildPIN(),
              SizedBox(height: 10),
              _buildmailid(),
              SizedBox(height: 20),
              RaisedButton(
                color: Colors.lightGreen,
                child: Text(
                  'SAVE',
                  style: TextStyle(color: Colors.black, fontSize: 16),

                ),
                onPressed: () {
                  if (!_formKey.currentState.validate()) {
                    return;
                  }

                  _formKey.currentState.save();
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Add New Address'
                    ),
                  );
                  print(_name);                    // add code here to push data to common firestore.
                  print(_Mobile);
                  print(_address1);
                  print(_address2);
                  print(_address3);
                  print(_sta);
                  print(_PIN);
                  print(_mailid);
                  //Send to API
                },
              )
            ],
          ),
        ),
      ),
      )
    );
  }
}