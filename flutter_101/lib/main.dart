import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyEditProfile());
}

class MyEditProfile extends StatelessWidget {
  const MyEditProfile({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edit Profile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF039587)),
        // fontFamily: 'Magic Red',
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const MyEditProfilePage(title: 'Edit Profile'),
    );
  }
}

class MyEditProfilePage extends StatefulWidget {
  const MyEditProfilePage({super.key, required this.title});

  final String title;

  @override
  State<MyEditProfilePage> createState() => _MyEditProfileState();
}

class _MyEditProfileState extends State<MyEditProfilePage> {
  int _notiCount = 0;
  final TextEditingController _nameController = TextEditingController(
    text: 'Mr. Flutter Dev',
  );
  String _position = 'Developer';
  String _workPreference = 'Office';
  bool _subscribe = false;
  final TextEditingController _birthDateController = TextEditingController(
    text: '22/12/2025',
  );

  void _noti() {
    setState(() {
      _notiCount++;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _birthDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfff6ff),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: _noti,
            icon: Badge(
              label: Text('$_notiCount'),
              isLabelVisible: _notiCount > 0,
              child: const Icon(
                Icons.notifications_rounded,
                color: Color(0xFFFFFFFF),
                size: 30,
              ),
            ),
          ),
        ],
        actionsPadding: const EdgeInsets.only(right: 8),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Image.asset(
              'assets/images/flutter.png',
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 5),
            const Text(
              'Flutter',
              style: TextStyle(fontSize: 28, color: Color(0xFF7a737c)),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Full Name
                  const Text(
                    'Full Name',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Position
                  const Text(
                    'Position',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    value: _position,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.work),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    items: ['Developer', 'Designer', 'Manager', 'Tester'].map((
                      String value,
                    ) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _position = newValue!;
                      });
                    },
                  ),
                  const SizedBox(height: 20),

                  // Work Preference
                  const Text(
                    'Work Preference',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            _workPreference = 'Office';
                          });
                        },
                        child: Row(
                          children: [
                            Radio<String>(
                              value: 'Office',
                              groupValue: _workPreference,
                              onChanged: (value) {
                                setState(() {
                                  _workPreference = value!;
                                });
                              },
                            ),
                            const Text('Office'),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _workPreference = 'Remote';
                          });
                        },
                        child: Row(
                          children: [
                            Radio<String>(
                              value: 'Remote',
                              groupValue: _workPreference,
                              onChanged: (value) {
                                setState(() {
                                  _workPreference = value!;
                                });
                              },
                            ),
                            const Text('Remote'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Newsletter
                  InkWell(
                    onTap: () {
                      setState(() {
                        _subscribe = !_subscribe;
                      });
                    },
                    child: Row(
                      children: [
                        Checkbox(
                          value: _subscribe,
                          onChanged: (value) {
                            setState(() {
                              _subscribe = value!;
                            });
                          },
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Subscribe to Newsletter',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'Receive updates via email',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.email, color: Colors.black),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Birth Date
                  const Text(
                    'Birth Date',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _birthDateController,
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialEntryMode: DatePickerEntryMode.calendarOnly,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2019),
                        lastDate: DateTime(2050),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          _birthDateController.text =
                              "${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.year}";
                        });
                      }
                    },
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.calendar_today),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Save Changes Button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.save),
                      label: const Text('Save Changes'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        side: const BorderSide(
                          color: Color(0xFF039587),
                          width: 2,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        foregroundColor: const Color(0xFF6B5B95),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
