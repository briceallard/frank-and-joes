import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class User {
  final String fName;
  final String lName;
  final String displayName;
  final String email;
  final String uid;
  final String phoneNumber;
  final bool isAdmin;
  final Timestamp registerDate;
  final Timestamp lastLoggedIn;
  final List<dynamic> favorites;
  final List<dynamic> orderHistory;
  final List<dynamic> reviews;

  User({
    @required this.fName,
    @required this.lName,
    @required this.displayName,
    @required this.email,
    @required this.uid,
    this.phoneNumber,
    this.isAdmin,
    @required this.registerDate,
    @required this.lastLoggedIn,
    this.favorites,
    this.orderHistory,
    this.reviews,
  });

  User.fromMap(Map<String, dynamic> data)
      : fName = data["fName"],
        lName = data["lName"],
        displayName = data["displayName"],
        email = data["email"],
        uid = data["uid"],
        phoneNumber = data["phoneNumber"],
        isAdmin = data['isAdmin'],
        registerDate = data["registerDate"],
        lastLoggedIn = data["lastLoggedIn"],
        favorites = data["favorites"],
        orderHistory = data["orderHistory"],
        reviews = data["reviews"] {
    assert(data['fName'] != null, "fName is missing");
    assert(data['lName'] != null, "lName is missing");
    assert(data['displayName'] != null, "displayName is missing");
    assert(data['email'] != null, "email is missing");
    assert(data['uid'] != null, "uid is missing");
    assert(data['phoneNumber'] != null, "phoneNumber is missing");
    assert(data['isAdmin'] != null, "isAdmin is missing");
    assert(data['registerDate'] != null, "registerDate is missing");
    assert(data['lastLoggedIn'] != null, "lastLoggedIn is missing");
    assert(data['favorites'] != null, "favorites is missing");
    assert(data['orderHistory'] != null, "orderHistory is missing");
    assert(data['reviews'] != null, "reviews is missing");
  }

  User.initial()
      : fName = 'No user',
        lName = 'No user',
        displayName = 'No user',
        email = 'No user',
        uid = 'No user',
        phoneNumber = 'No user',
        isAdmin = false,
        registerDate = null,
        lastLoggedIn = null,
        favorites = null,
        orderHistory = null,
        reviews = null;

  Map<String, dynamic> toMap() => {
        'fName': fName,
        'lName': lName,
        'displayName': displayName,
        'email': email,
        'uid': uid,
        'phoneNumber': phoneNumber ?? '(000)000-0000',
        'isAdmin': isAdmin ?? false,
        'registerDate': registerDate,
        'lastLoggedIn': lastLoggedIn,
        'favorites': favorites ?? [],
        'orderHistory': orderHistory ?? [],
        'reviews': reviews ?? [],
      };
}
