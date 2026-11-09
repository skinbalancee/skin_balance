import 'package:flutter/material.dart';
import 'home_screen.dart';

class ProfileSetupScreen extends StatefulWidget {
  final String userName;
  ProfileSetupScreen({super.key, this.userName = "Pengguna"});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  String selectedGender = "Perempuan";
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.userName);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F8F6),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Langkah 1 dari 2",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFD97059),
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Lengkapi profilmu",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Data ini disimpan di profil SkinBalance. Usia dipakai untuk menyesuaikan rekomendasi bahan aktif.",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                  height: 1.4,
                ),
              ),
              SizedBox(height: 24),
              Text(
                "Nama",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black87),
              ),
              SizedBox(height: 8),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: "Nama lengkap",
                  hintStyle: TextStyle(color: Colors.black38, fontSize: 14),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xFFE0E0E0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xFFFFD3C6), width: 1.5),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Usia",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black87),
              ),
              SizedBox(height: 8),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "cth. 21",
                  hintStyle: TextStyle(color: Colors.black38, fontSize: 14),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xFFE0E0E0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xFFFFD3C6), width: 1.5),
                  ),
                ),
              ),
              SizedBox(height: 4),
              Text(
                "Wajib diisi sebelum scan wajah",
                style: TextStyle(fontSize: 11, color: Colors.black45),
              ),
              SizedBox(height: 24),
              Text(
                "Jenis kelamin",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black87),
              ),
              SizedBox(height: 12),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _buildGenderChip("Perempuan"),
                  _buildGenderChip("Laki-laki"),
                  _buildGenderChip("Lainnya"),
                  _buildGenderChip("Tidak ingin menyebut"),
                ],
              ),
              SizedBox(height: 24),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFFFFF0EC),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.info_outline, color: Color(0xFFD97059), size: 20),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        "Hanya disimpan sebagai data. Tidak memengaruhi hasil scan, bahan aktif, maupun rekomendasi produk.",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFFD97059),
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFD3C6),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 0,
                  ),
                  onPressed: () {
                    // Mengarahkan langsung ke Beranda dan menghapus tumpukan riwayat halaman sebelumnya
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(
                          userName: _nameController.text.trim(),
                        ),
                      ),
                      (route) => false,
                    );
                  },
                  child: Text(
                    "Simpan",
                    style: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGenderChip(String title) {
    bool isSelected = selectedGender == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = title;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFFFD3C6) : Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected ? Color(0xFFFFD3C6) : Color(0xFFE0E0E0),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}