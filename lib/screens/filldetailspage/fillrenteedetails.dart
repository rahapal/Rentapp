import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rentapp/controller/provider.dart';
import 'package:rentapp/model/payment.dart';
import 'package:rentapp/model/property.dart';
import 'package:rentapp/model/rentee.dart';
import 'package:rentapp/route/route.dart' as route;

import '../../common/global_variables.dart';

class FillRenteeDetails extends StatefulWidget {
  Property getDetails;
  FillRenteeDetails({Key? key, required this.getDetails}) : super(key: key);

  @override
  State<FillRenteeDetails> createState() => _FillRenteeDetailsState();
}

class _FillRenteeDetailsState extends State<FillRenteeDetails> {
  TextEditingController _renteeName = TextEditingController();
  TextEditingController _renteeContact = TextEditingController();
  TextEditingController _renteeEmail = TextEditingController();
  TextEditingController _renteeBusinessName = TextEditingController();
  TextEditingController _renteeDueAmount = TextEditingController();
  TextEditingController _renteePanNumber = TextEditingController();
  TextEditingController _renteeAdvanceDeposit = TextEditingController();

  @override
  void dispose() {
    _renteeName.dispose();
    _renteeContact.dispose();
    _renteeEmail.dispose();
    _renteeBusinessName.dispose();
    _renteeDueAmount.dispose();
    _renteePanNumber.dispose();
    _renteeAdvanceDeposit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PropertyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0),
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(
            bottom: 8,
            left: 16,
            top: 8,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: const Color(0xFFE0E5FF),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 3),
              child: IconButton(
                color: const Color(0xFFBDC1FF),
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pushNamed(context, route.RouteManager.home);
                },
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 43, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/user.png',
                    height: 23,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    'Add new Profile',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 38,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 17),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Rentee Name',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      controller: _renteeName,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: GlobalVariables.textFieldbackgroundColor,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        hintText: 'Enter full name',
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: GlobalVariables.textFieldborderColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 17),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Mobile number',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      controller: _renteeContact,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: GlobalVariables.textFieldbackgroundColor,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        hintText: '+977',
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: GlobalVariables.textFieldborderColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 17),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'E-mail',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      controller: _renteeEmail,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: GlobalVariables.textFieldbackgroundColor,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: GlobalVariables.textFieldborderColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 17),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Business name',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      controller: _renteeBusinessName,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: GlobalVariables.textFieldbackgroundColor,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: GlobalVariables.textFieldborderColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 17),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Rentee Due Amount',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      controller: _renteeDueAmount,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: GlobalVariables.textFieldbackgroundColor,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: GlobalVariables.textFieldborderColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 12),
                              child: Text(
                                'Pan number',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                              ),
                            ),
                            TextFormField(
                              textAlign: TextAlign.end,
                              controller: _renteePanNumber,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    GlobalVariables.textFieldbackgroundColor,
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: GlobalVariables.textFieldborderColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 12),
                              child: Text(
                                'Advance deposit',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                              ),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: _renteeAdvanceDeposit,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    GlobalVariables.textFieldbackgroundColor,
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: GlobalVariables.textFieldborderColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 17),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Documents',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Citizenship',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16),
                        ),
                        const SizedBox(
                          width: 66,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Upload an image'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Rentee Agreement',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Upload an image'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  final property = Property(
                    propertyId: widget.getDetails.propertyId,
                    propertyName: widget.getDetails.propertyName,
                    price: widget.getDetails.price,
                    address: widget.getDetails.address,
                    size: widget.getDetails.size,
                    index: widget.getDetails.index,
                    fieldStatus: widget.getDetails.fieldStatus,
                    rentee: Rentee(
                        renteeId: widget.getDetails.rentee.renteeId,
                        renteeName: _renteeName.text,
                        renteeEmail: _renteeEmail.text,
                        renteeContact: _renteeContact.text,
                        businessdetail: _renteeBusinessName.text,
                        agreementimage: '',
                        citizenimage: '',
                        dueAmount: int.parse(_renteeDueAmount.text),
                        renteePayment: Payment(
                          paymentId: '',
                          paymentDate: DateTime.now(),
                          paymentNote: '',
                          fieldIndex: widget.getDetails.index,
                        )),
                    description: '',
                    image: '',
                    status: widget.getDetails.status,
                  );

                  provider.addProperty(property);
                  Navigator.pushNamed(context, route.RouteManager.home);
                },
                child: const Text('Save Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
