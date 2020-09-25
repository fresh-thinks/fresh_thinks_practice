import 'package:flutter/material.dart';
import 'package:fresh_thinks_practice/shared/stringCollection.dart';

class AddressBook extends StatefulWidget {
  _AddressBook createState() => _AddressBook();
}

class _AddressBook extends State<AddressBook> {
  //Size of the viewport
  Size size;

  //Add Address Dialog Variables
  bool bDialogVisible = false;
  bool bHomeSelected = false;
  bool bOfficeSelected = false;
  Color homeIconColor = Colors.grey;
  Color officeIconColor = Colors.grey;

  //List of user's address
  List<List<String>> address;

  Widget build(BuildContext context) {
    //Initialize List of addresses
    address = new List<List<String>>();
    address.add(["String", "String", "String", "String"]);
    address.add(["String", "String", "String", "String"]);
    address.add(["String", "String", "String", "String"]);
    address.add(["String", "String", "String", "String"]);

    //Get the size of Viewport
    size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          StringCollection.title_,
          style: TextStyle(color: Colors.lightGreen),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.fromLTRB(size.width * 0.05, size.height * 0.025,
                size.width * 0.05, size.height * 0.025),
            child: Stack(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      //Title Text
                      Container(
                        height: size.height * 0.05,
                        child: Center(
                          child: Text(
                            "Address Book",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.025),
                      //List of addresses
                      getAddressBlocks(),
                      SizedBox(height: size.height * 0.025),
                      //To show the add address dialog
                      addNewAddressButton(),
                    ],
                  ),
                ),
                //Hidden dialog to add address
                addNewAddressDialog(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getAddressBlocks() {
    return Container(
      height: size.height * 0.675,
      child: ListView.builder(
        itemCount: address.length,
        itemBuilder: (BuildContext context, int index) {
          //print(index);
          return getAddressBlock();
        },
      ),
    );
  }

  Widget getAddressBlock() {
    return Stack(
      children: [
        Column(
          children: <Widget>[
            Container(
              height: size.height * 0.2,
              width: size.width * 0.9,
              padding: EdgeInsets.fromLTRB(size.width * 0.025,
                  size.height * 0.025, size.width * 0.025, size.height * 0.025),
              decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(5.0)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                          width: size.width * 0.55,
                          child:
                              Text("HOME 1", style: TextStyle(fontSize: 20))),
                      Container(
                        child: Row(
                          children: [
                            Container(
                                width: size.width * 0.15,
                                child: Center(child: Text("Default"))),
                            Container(
                                width: size.width * 0.075,
                                child: Center(child: Icon(Icons.home))),
                            Container(
                                width: size.width * 0.06,
                                child: Center(
                                    child: Icon(Icons.local_convenience_store)))
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: size.width * 0.55,
                        child: Column(
                          children: [
                            SizedBox(height: size.height * 0.025),
                            Container(
                                child: Text("JaMaharashtrawnjwkenkjvnkwewewej",
                                    maxLines: 1)),
                            Container(
                                alignment: Alignment.topLeft,
                                child: Text("Jai Maharashtra", maxLines: 1)),
                            Container(
                                alignment: Alignment.topLeft,
                                child: Text("Jai Maharashtra", maxLines: 1)),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.25,
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: size.height * 0.025),
          ],
        ),
      ],
    );
  }

  Widget addNewAddressButton() {
    return Container(
      height: size.height * 0.05,
      width: size.width * 0.5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 3.0, spreadRadius: 1.0)
          ],
          color: Colors.white),
      child: Center(
        child: GestureDetector(
          onTap: () {
            setState(
              () {
                bDialogVisible = true;
              },
            );
          },
          child: InkWell(
            child: Container(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Text(StringCollection.addNewAddress,
                    style: TextStyle(
                        color: Colors.lightGreen,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ),
      ),
    );
  }

//------------------------- ADD NEW ADDRESS DIALOG BOX------------------------\\
  Widget addNewAddressDialog() {
    bHomeSelected = false;
    bOfficeSelected = false;

    return Visibility(
      visible: bDialogVisible,
      child: Positioned(
        top: size.height * 0.075,
        left: size.width * 0.005,
        child: Center(
          child: Container(
            padding: EdgeInsets.fromLTRB(size.width * 0.01, size.height * 0.01,
                size.width * 0.01, size.height * 0.01),
            width: size.width * 0.89,
            height: size.height * 0.75,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.grey,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, blurRadius: 5.0, spreadRadius: 3.0)
              ],
            ),
            child: Column(
              children: <Widget>[
                getDialogTitleBar(),
                SizedBox(height: size.height * 0.025),
                Container(
                  height: size.height * 0.525,
                  padding: EdgeInsets.only(
                      left: size.width * 0.025, right: size.width * 0.025),
                  child: Column(
                    children: [
                      getDialogAddressTypeSection(),
                      SizedBox(height: size.height * 0.005),
                      getDialogTextFields(),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  color: Colors.lightGreen,
                  height: size.height * 0.05,
                  width: size.width * 0.2,
                  child: Center(
                    child: Text(
                      "ADD",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getDialogTitleBar() {
    return Container(
      height: size.height * 0.1,
      width: size.width * 0.88,
      child: Center(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  setState(
                    () {
                      bDialogVisible = false;
                      bHomeSelected = false;
                      bOfficeSelected = false;
                    },
                  );
                },
              ),
            ),
            Container(
              child: Center(
                child: Text(
                  "Add New Address",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getDialogAddressTypeSection() {
    return Container(
      height: size.height * 0.1,
      width: size.width * 0.8,
      child: Column(
        children: [
          Container(
            height: size.height * 0.05,
            child: Row(
              children: [
                Container(
                    width: size.width * 0.3, child: Text("Address Type :")),
                GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          bHomeSelected = true;
                          bOfficeSelected = false;
                          repaintIcons();
                        },
                      );
                    },
                    child: Container(
                        width: size.width * 0.05,
                        child: Icon(Icons.home, color: homeIconColor))),
                SizedBox(
                  width: size.width * 0.02,
                ),
                Container(
                    width: size.width * 0.4,
                    child: Text("7 AM - 9 PM Delivery")),
              ],
            ),
          ),
          Container(
            height: size.height * 0.05,
            child: Row(
              children: [
                SizedBox(
                  width: size.width * 0.3,
                ),
                GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        bHomeSelected = false;
                        bOfficeSelected = true;
                        repaintIcons();
                      },
                    );
                  },
                  child: Container(
                    width: size.width * 0.05,
                    child: Icon(
                      Icons.local_convenience_store,
                      color: officeIconColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                Container(
                    width: size.width * 0.4,
                    child: Text("10 AM - 6 PM Delivery")),
              ],
            ),
          ),
        ],
      ),
    );
  }

  repaintIcons() {
    if (bHomeSelected) {
      homeIconColor = Colors.black;
      officeIconColor = Colors.grey;
    } else if (bOfficeSelected) {
      homeIconColor = Colors.grey;
      officeIconColor = Colors.black;
    } else {
      homeIconColor = Colors.grey;
      officeIconColor = Colors.grey;
    }
  }

  Widget getDialogTextFields() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: size.height * 0.05,
          decoration: BoxDecoration(border: Border.all(width: 1)),
          padding: EdgeInsets.only(left: 10),
          child: Center(
            child: TextField(
              onSubmitted: (_) => FocusScope.of(context).nextFocus(),
              maxLines: 1,
              textInputAction: TextInputAction.next,
              style: TextStyle(height: 1.0),
              decoration: InputDecoration(
                hintText: "Full Name",
                hintStyle: TextStyle(fontSize: 16),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.01),
        Container(
          height: size.height * 0.05,
          decoration: BoxDecoration(border: Border.all(width: 1)),
          padding: EdgeInsets.only(left: 10),
          child: Center(
            child: TextField(
              maxLines: 1,
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => FocusScope.of(context).nextFocus(),
              style: TextStyle(height: 1.0),
              decoration: InputDecoration(
                hintText: "Mobile Number",
                hintStyle: TextStyle(fontSize: 16),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.01),
        Container(
          height: size.height * 0.05,
          decoration: BoxDecoration(border: Border.all(width: 1)),
          padding: EdgeInsets.only(left: 10),
          child: Center(
            child: TextField(
              maxLines: 1,
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => FocusScope.of(context).nextFocus(),
              style: TextStyle(height: 1.0),
              decoration: InputDecoration(
                hintText: "PIN Code",
                hintStyle: TextStyle(fontSize: 16),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.01),
        Container(
          height: size.height * 0.05,
          decoration: BoxDecoration(border: Border.all(width: 1)),
          padding: EdgeInsets.only(left: 10),
          child: Center(
            child: TextField(
              maxLines: 1,
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => FocusScope.of(context).nextFocus(),
              style: TextStyle(height: 1.0),
              decoration: InputDecoration(
                hintText: "Flat, House no, Building",
                hintStyle: TextStyle(fontSize: 16),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.01),
        Container(
          height: size.height * 0.05,
          decoration: BoxDecoration(border: Border.all(width: 1)),
          padding: EdgeInsets.only(left: 10),
          child: Center(
            child: TextField(
              maxLines: 1,
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => FocusScope.of(context).nextFocus(),
              style: TextStyle(height: 1.0),
              decoration: InputDecoration(
                hintText: "Area, Colony",
                hintStyle: TextStyle(fontSize: 16),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.01),
        Container(
          height: size.height * 0.05,
          decoration: BoxDecoration(border: Border.all(width: 1)),
          padding: EdgeInsets.only(left: 10),
          child: Center(
            child: TextField(
              maxLines: 1,
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => FocusScope.of(context).nextFocus(),
              style: TextStyle(height: 1.0),
              decoration: InputDecoration(
                hintText: "Landmark",
                hintStyle: TextStyle(fontSize: 16),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.01),
        Container(
          height: size.height * 0.05,
          decoration: BoxDecoration(border: Border.all(width: 1)),
          padding: EdgeInsets.only(left: 10),
          child: Center(
            child: TextField(
              maxLines: 1,
              style: TextStyle(height: 1.0),
              decoration: InputDecoration(
                hintText: "State",
                hintStyle: TextStyle(fontSize: 16),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.01),
      ],
    );
  }
}