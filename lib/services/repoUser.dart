import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nextfilm/const/consts.dart';
import 'package:nextfilm/helper/helper.dart';

class userRepository{



  nameToSub(String res){
    return res.substring(0,1);
  }
  Widget fetchUserDataFromRepo()  {

    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('User')
          .where('uid', isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator(color: Colors.blue));
        }

        var data = snapshot.data as QuerySnapshot;
        return ListView.builder(
          itemCount: data.docs.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: backgroudnColor,
                  child: Text(
                    nameToSub(data.docs[index]['username'].toString().toUpperCase()),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(data.docs[index]['username']),
                subtitle: Text(data.docs[index]['email']),
              ),
            );
          },
        );
      },
    );
  }
}




