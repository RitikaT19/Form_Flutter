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
                          TextFormField(),
                          TextFormField(),
                          TextFormField(),
                          Container(
                              padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                              child: Text('Subscribe')),
                          SwitchListTile(
                              title: const Text('Monthly Newsletter'),
                              value: _user.newsletter,
                              onChanged: (bool val) =>
                                  setState(() => _user.newsletter = val)),
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
                        ])))));
  }
}
