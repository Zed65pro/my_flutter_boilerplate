import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../common/widgets/appbar.dart';

class MyFormView extends StatefulWidget {
  const MyFormView({super.key});

  @override
  _MyFormViewState createState() => _MyFormViewState();
}

class _MyFormViewState extends State<MyFormView> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _email = '';
  String _password = '';
  String? _gender;
  final List<String> _hobbies = [];
  DateTime? _selectedDate;
  double _sliderValue = 50.0;
  bool _termsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) => _name = value!,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                onSaved: (value) => _email = value!,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
                onSaved: (value) => _password = value!,
              ),
              const SizedBox(height: 24),
              const Text('Gender:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              RadioListTile(
                title: const Text('Male'),
                value: 'male',
                groupValue: _gender,
                onChanged: (value) => setState(() => _gender = value as String),
              ),
              RadioListTile(
                title: const Text('Female'),
                value: 'female',
                groupValue: _gender,
                onChanged: (value) => setState(() => _gender = value as String),
              ),
              const SizedBox(height: 24),
              const Text('Hobbies:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              CheckboxListTile(
                title: const Text('Reading'),
                value: _hobbies.contains('reading'),
                onChanged: (value) {
                  setState(() {
                    if (value!) {
                      _hobbies.add('reading');
                    } else {
                      _hobbies.remove('reading');
                    }
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Sports'),
                value: _hobbies.contains('sports'),
                onChanged: (value) {
                  setState(() {
                    if (value!) {
                      _hobbies.add('sports');
                    } else {
                      _hobbies.remove('sports');
                    }
                  });
                },
              ),
              const SizedBox(height: 24),
              const Text('Date of Birth:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextButton.icon(
                icon: const Icon(Icons.calendar_today),
                label: Text(_selectedDate == null ? 'Select Date' : DateFormat('yyyy-MM-dd').format(_selectedDate!)),
                onPressed: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate ?? DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (picked != null && picked != _selectedDate) {
                    setState(() {
                      _selectedDate = picked;
                    });
                  }
                },
              ),
              const SizedBox(height: 24),
              const Text('Rate your experience:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Slider(
                value: _sliderValue,
                min: 0,
                max: 100,
                divisions: 100,
                label: _sliderValue.round().toString(),
                onChanged: (value) {
                  setState(() {
                    _sliderValue = value;
                  });
                },
              ),
              SwitchListTile(
                title: const Text('I accept the terms and conditions'),
                value: _termsAccepted,
                onChanged: (value) {
                  setState(() {
                    _termsAccepted = value;
                  });
                },
              ),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  onPressed: _submitForm,
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      String? errorMessage;

      if (_gender == null) {
        errorMessage = 'Please select a gender';
      } else if (_hobbies.isEmpty) {
        errorMessage = 'Please select at least one hobby';
      } else if (_selectedDate == null) {
        errorMessage = 'Please select your date of birth';
      } else if (!_termsAccepted) {
        errorMessage = 'Please accept the terms and conditions';
      }

      if (errorMessage != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
        return;
      }

      // Process the form data
      print('Form submitted');
      print('Name: $_name');
      print('Email: $_email');
      print('Password: $_password');
      print('Gender: $_gender');
      print('Hobbies: $_hobbies');
      print('Date of Birth: $_selectedDate');
      print('Experience Rating: $_sliderValue');
    }
  }
}
