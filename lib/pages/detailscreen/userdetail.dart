import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rentapp/model/rentee.dart';

class UserDetail extends StatefulWidget {
  const UserDetail({super.key});

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  late Box<Rentee> Rbox;
  String name = 'Reena Parajuli';
  String contact = '9816273940';

  @override
  void initState() {
    Rbox = Hive.box<Rentee>('rentee');
    //add details of rentee
    Rbox.add(
      Rentee(
        renteeContact: contact,
        renteeEmail: '',
        renteeName: name,
        agreementimage: '',
        citizenimage: '',
        businessdetail: '',
        renteeId: '',
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 25,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(35),
                    child: Image.asset(
                      'assets/user.png',
                      // height: 58,
                      // width: 58,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      Rbox.getAt(1)!.renteeName,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      Rbox.getAt(1)!.renteeContact,
                      style: TextStyle(
                        color: Color(0xFF9f9f9f),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            PhysicalModel(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              elevation: 5.0,
              shadowColor: Color(0xFF69AC65),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFF69AC65),
                ),
                child: IconButton(
                  onPressed: () {
                    setState(() {});
                    //show details name which is at index 0
                    //print(Rbox.getAt(0)!.name);
                  },
                  icon: const Icon(
                    Icons.message_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
