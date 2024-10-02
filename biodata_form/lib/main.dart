import 'package:flutter/material.dart';

void main() {
  runApp(BiodataFormApp());
}

class BiodataFormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Biodata',
      theme: ThemeData(
        brightness: Brightness.dark, // Tema hitam
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.amber, // Warna AppBar emas
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber, // Warna tombol emas
          ),
        ),
      ),
      home: BiodataForm(),
    );
  }
}

class BiodataForm extends StatefulWidget {
  @override
  _BiodataFormState createState() => _BiodataFormState();
}

class _BiodataFormState extends State<BiodataForm> {
  // Variabel untuk menyimpan input dari form
  String _gender = 'Laki-laki';
  bool _isMarried = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _birthPlaceController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Biodata'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nama
              Text('Nama:', style: TextStyle(color: Colors.amber)),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Masukkan nama',
                  hintStyle: TextStyle(color: Colors.white54),
                ),
              ),
              SizedBox(height: 16),

              // Tempat Tanggal Lahir
              Text('Tempat Tanggal Lahir:', style: TextStyle(color: Colors.amber)),
              TextField(
                controller: _birthPlaceController,
                decoration: InputDecoration(
                  hintText: 'Masukkan tempat lahir',
                  hintStyle: TextStyle(color: Colors.white54),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _birthDateController,
                decoration: InputDecoration(
                  hintText: 'Masukkan tanggal lahir',
                  hintStyle: TextStyle(color: Colors.white54),
                ),
              ),
              SizedBox(height: 16),

              // Umur
              Text('Umur:', style: TextStyle(color: Colors.amber)),
              TextField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Masukkan umur',
                  hintStyle: TextStyle(color: Colors.white54),
                ),
              ),
              SizedBox(height: 16),

              // Jenis Kelamin
              Text('Jenis Kelamin:', style: TextStyle(color: Colors.amber)),
              Row(
                children: [
                  Radio<String>(
                    value: 'Laki-laki',
                    groupValue: _gender,
                    onChanged: (String? value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                  Text('Laki-laki', style: TextStyle(color: Colors.white)),
                  Radio<String>(
                    value: 'Perempuan',
                    groupValue: _gender,
                    onChanged: (String? value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                  Text('Perempuan', style: TextStyle(color: Colors.white)),
                ],
              ),
              SizedBox(height: 16),

              // Status
              Row(
                children: [
                  Checkbox(
                    value: _isMarried,
                    onChanged: (bool? value) {
                      setState(() {
                        _isMarried = value!;
                      });
                    },
                  ),
                  Text('Menikah', style: TextStyle(color: Colors.white)),
                ],
              ),
              SizedBox(height: 16),

              // Pekerjaan
              Text('Pekerjaan:', style: TextStyle(color: Colors.amber)),
              TextField(
                controller: _jobController,
                decoration: InputDecoration(
                  hintText: 'Masukkan pekerjaan',
                  hintStyle: TextStyle(color: Colors.white54),
                ),
              ),
              SizedBox(height: 16),

              // Alamat
              Text('Alamat:', style: TextStyle(color: Colors.amber)),
              TextField(
                controller: _addressController,
                decoration: InputDecoration(
                  hintText: 'Masukkan alamat',
                  hintStyle: TextStyle(color: Colors.white54),
                ),
              ),
              SizedBox(height: 16),

              // Tombol Submit
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Aksi submit bisa dilakukan di sini
                    String biodata = '''
Nama: ${_nameController.text}
Tempat/Tanggal Lahir: ${_birthPlaceController.text}, ${_birthDateController.text}
Umur: ${_ageController.text}
Jenis Kelamin: $_gender
Status: ${_isMarried ? "Menikah" : "Belum Menikah"}
Pekerjaan: ${_jobController.text}
Alamat: ${_addressController.text}
''';
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Data Biodata'),
                          content: Text(biodata),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
