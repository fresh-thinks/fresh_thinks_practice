import 'package:flutter/material.dart';
import 'package:fresh_thinks_practice/widgets/edit_profile.dart';
import 'package:fresh_thinks_practice/widgets/main_drawer.dart';


class ProfileScreen extends StatefulWidget {
String email = '';
String dob= ' ';
String gender ='';

ProfileScreen({this.email,this.dob,this.gender});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isEditingText = false;
TextEditingController _editingController;
String initialText = "Initial Text";


@override
void initState() {
  super.initState();
  _editingController = TextEditingController(text: initialText);
}
@override
void dispose() {
  _editingController.dispose();
  super.dispose();
}


  Widget _editTitleTextField() {
  if (_isEditingText)
    return Center(
      child: TextField(
        onSubmitted: (newValue){
          setState(() {
            initialText = newValue;
            _isEditingText =false;
          });
        },
        autofocus: true,
        controller: _editingController,
      ),
    );
  return InkWell(
    onTap: () {
      setState(() {
        _isEditingText = true;
      });
    },
    child: Text(
  initialText,
  style: TextStyle(
    color: Colors.black,
    fontSize: 18.0,
  ),
  ));
}

  bool _isEnabled = false;
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold (
      appBar: AppBar(
        title: Text("Profile",
        style: TextStyle(
          //fontWeight: FontWeight.bold,
          fontSize: 25.0
        ),),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.edit) ,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditName()));
            }
            )
        ],
      ),

      drawer: MainDrawer(),

      body: SingleChildScrollView(
              child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height*0.05),

            Container(
              height: height*0.25,
              child: Center(
                child: CircleAvatar(
                        radius: 140,
                       // backgroundColor: Colors.transparent,
                        child: CircleAvatar(
                          child: Image.asset("assets/fresh_logo.png",
                          fit: BoxFit.fill,
                          ),
                        radius: 130,
                        backgroundColor:Colors.transparent
                        ),
                ),
              ),




            ),

            SizedBox(height: 20.0,),

              Center(
                child: Text(
                  "Name" ,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: Divider(height: 30,thickness: 1.2,),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Mobile Number",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),),
            ),



              Padding(
              padding: const EdgeInsets.symmetric(horizontal : 40.0),
              child: Text("91XXX XXXXX",
              textAlign: TextAlign.left,
              style: TextStyle(
                //fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),),
            ),

             SizedBox(height: 20.0,),


            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Email",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal : 40.0),
              child: Text("abcxyz@gmail.com",
              textAlign: TextAlign.left,
              style: TextStyle(
                //fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),),
            ),

            ListTile(
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed:(){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditName(text: 'email')));
                }
                ),
              title: Text("Email Id :",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(horizontal :8.0),
                child: Text('${widget.email}',
                style: TextStyle(
                  fontSize: 20.0
                ),),
              ),
            ),















          ],
        ),
      ),





    );
  }
}








