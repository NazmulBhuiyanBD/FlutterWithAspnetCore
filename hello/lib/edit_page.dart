import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hello/api_handler.dart';
import 'package:hello/model.dart';
import 'package:http/http.dart' as http;

class EditPage extends StatefulWidget {
  final User user;
  const EditPage({super.key ,required this.user});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final _formkey=GlobalKey<FormBuilderState>();
   ApiHandler apiHandler=ApiHandler();
   late http.Response response;
  void updateData() async
  {
    if(_formkey.currentState!.saveAndValidate())
    {
      final data=_formkey.currentState!.value;

      final user=User(
        userId: widget.user.userId,
        name: data['name'],
        address: data['address'],
      );
      response=await apiHandler.updateUser(userId: widget.user.userId, user: user);
    }
        if (!mounted) return;
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Page"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
            bottomNavigationBar: MaterialButton(
        color: Colors.teal,
        textColor: Colors.white,
        padding: EdgeInsets.all(20),
        onPressed: updateData,
      child: const Text("Update"),),
      body: Padding(padding: const EdgeInsets.all(10),
      child: FormBuilder(
        key: _formkey,
        initialValue: {
          'name':widget.user.name,
          'address':widget.user.address,
        },
        child: Column(
        children: [
          FormBuilderTextField(name: "name",
        decoration: const InputDecoration(
          labelText: 'Name'
        ),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
        ]),
        ),
        const SizedBox(
          height: 10,
        ),
        FormBuilderTextField(name: "address",
        decoration: const InputDecoration(
          labelText: 'Address'
        ),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
        ]),
        ),
        ],
      )),
      ),
    );
  }
}