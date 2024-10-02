import 'package:flutter/material.dart';

void main() {
  runApp(SkincareFormApp());
}

class SkincareFormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Skincare',
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
      home: SkincareForm(),
    );
  }
}

class SkincareForm extends StatefulWidget {
  @override
  _SkincareFormState createState() => _SkincareFormState();
}

class _SkincareFormState extends State<SkincareForm> {
  // Variabel untuk menyimpan input dari form
  String _skinType = 'Normal';
  bool _hasAllergies = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _productsController = TextEditingController();
  final TextEditingController _allergiesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Skincare'),
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

              // Jenis Kulit
              Text('Jenis Kulit:', style: TextStyle(color: Colors.amber)),
              DropdownButton<String>(
                value: _skinType,
                items: <String>['Normal', 'Kering', 'Berminyak', 'Kombinasi']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: TextStyle(color: Colors.black)),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _skinType = newValue!;
                  });
                },
                dropdownColor: Colors.white,
              ),
              SizedBox(height: 16),

              // Produk Skincare
              Text('Produk Skincare yang Digunakan:', style: TextStyle(color: Colors.amber)),
              TextField(
                controller: _productsController,
                decoration: InputDecoration(
                  hintText: 'Masukkan produk skincare',
                  hintStyle: TextStyle(color: Colors.white54),
                ),
              ),
              SizedBox(height: 16),

              // Riwayat Alergi
              Text('Riwayat Alergi:', style: TextStyle(color: Colors.amber)),
              Row(
                children: [
                  Checkbox(
                    value: _hasAllergies,
                    onChanged: (bool? value) {
                      setState(() {
                        _hasAllergies = value!;
                      });
                    },
                  ),
                  Text('Ada alergi', style: TextStyle(color: Colors.white)),
                ],
              ),
              if (_hasAllergies) ...[
                TextField(
                  controller: _allergiesController,
                  decoration: InputDecoration(
                    hintText: 'Sebutkan alergi',
                    hintStyle: TextStyle(color: Colors.white54),
                  ),
                ),
                SizedBox(height: 16),
              ],

              // Tombol Submit
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Aksi submit bisa dilakukan di sini
                    String skincareData = '''
Nama: ${_nameController.text}
Umur: ${_ageController.text}
Jenis Kulit: $_skinType
Produk Skincare: ${_productsController.text}
Status Alergi: ${_hasAllergies ? "Ada Alergi: ${_allergiesController.text}" : "Tidak Ada Alergi"}
''';
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Data Skincare'),
                          content: Text(skincareData),
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
