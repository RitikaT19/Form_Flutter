import 'package:flutter/material.dart';
import '../models/user.dart';

class HomeMaterial extends StatefulWidget {
  @override
  _HomeMaterialState createState() => _HomeMaterialState();
}

class _HomeMaterialState extends State<HomeMaterial> {
  final _user = User();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Profile')),
        body: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Builder(
                builder: (context) => Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            decoration:
                                InputDecoration(labelText: 'First Name'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your first name';
                              }
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Last Name'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your last name';
                              }
                            },
                          ),
                          Container(
                              padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                              child: Text('Subscribe')),
                          SwitchListTile(
                              title: const Text('Monthly Newsletter'),
                              value: _user.newsletter,
                              onChanged: (bool val) =>
                                  setState(() => _user.newsletter = val)),
                          Container(
                              padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                              child: Text('Interests')),
                          CheckboxListTile(
                              title: const Text('Cooking'),
                              value: _user.passions[User.PassionCooking],
                              onChanged: (val) {
                                setState(() =>
                                    _user.passions[User.PassionCooking] = val!);
                              }),
                          CheckboxListTile(
                              title: const Text('Hiking'),
                              value: _user.passions[User.PassionHiking],
                              onChanged: (val) {
                                setState(() =>
                                    _user.passions[User.PassionHiking] = val!);
                              }),
                          CheckboxListTile(
                              title: const Text('Traveling'),
                              value: _user.passions[User.PassionTraveling],
                              onChanged: (val) {
                                setState(() => _user
                                    .passions[User.PassionTraveling] = val!);
                              }),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 16.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    final form = _formKey.currentState;
                                    if (form!.validate()) {
                                      form.save();
                                      _user.save();
                                      _showDialog(context);
                                    }
                                  },
                                  child: Text('Save'))),
                        ])))));
  }
}

// ignore: camel_case_types
class _showDialog {
  _showDialog(BuildContext context);
}
