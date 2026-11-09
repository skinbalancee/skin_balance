import 'package:flutter/material.dart';

class SleepPatternScreen extends StatefulWidget {
  SleepPatternScreen({super.key});

  @override
  State<SleepPatternScreen> createState() => _SleepPatternScreenState();
}

class _SleepPatternScreenState extends State<SleepPatternScreen> {
  String selectedQuality = "Cukup";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F8F6),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header: Tombol Kembali & Judul "Pola tidur"
              Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xFFE0E0E0)),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios_new, color: Colors.black87, size: 18),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  SizedBox(width: 16),
                  Text(
                    "Pola tidur",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),

              // Kartu Ringkasan 7 Hari (Bar Chart & Rata-rata Durasi)
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Color(0xFFE8E8E8)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "RINGKASAN 7 HARI",
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(height: 20),
                    // Ilustrasi Diagram Batang
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _buildBar(45),
                        _buildBar(60),
                        _buildBar(35),
                        _buildBar(75),
                        _buildBar(65),
                        _buildBar(55),
                        _buildBar(70),
                      ],
                    ),
                    SizedBox(height: 24),
                    Divider(height: 1, color: Color(0xFFF0F0F0)),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Rata-rata durasi",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          "[-] jam",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Input Waktu Tidur
              Text(
                "Waktu tidur",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black87),
              ),
              SizedBox(height: 8),
              TextField(
                readOnly: true,
                decoration: InputDecoration(
                  hintText: "--.--",
                  hintStyle: TextStyle(color: Colors.black38, fontSize: 14),
                  suffixIcon: Icon(Icons.access_time, color: Colors.black54),
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
                onTap: () {
                  print("Pilih waktu tidur diklik");
                },
              ),
              SizedBox(height: 16),

              // Input Waktu Bangun
              Text(
                "Waktu bangun",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black87),
              ),
              SizedBox(height: 8),
              TextField(
                readOnly: true,
                decoration: InputDecoration(
                  hintText: "--.--",
                  hintStyle: TextStyle(color: Colors.black38, fontSize: 14),
                  suffixIcon: Icon(Icons.access_time, color: Colors.black54),
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
                onTap: () {
                  print("Pilih waktu bangun diklik");
                },
              ),
              SizedBox(height: 20),

              // Pilihan Kualitas Tidur
              Text(
                "Kualitas tidur",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black87),
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  _buildQualityChip("Kurang"),
                  SizedBox(width: 10),
                  _buildQualityChip("Cukup"),
                  SizedBox(width: 10),
                  _buildQualityChip("Baik"),
                ],
              ),
              SizedBox(height: 24),

              // Catatan Edukasi Bawah
              Text(
                "Edukasi tidur teratur untuk kesehatan umum, bukan penyebab langsung kondisi kulit.",
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.black45,
                  height: 1.4,
                ),
              ),
              SizedBox(height: 24),

              // Tombol Simpan Catatan
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
                    print("Simpan catatan tidur diklik");
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Simpan catatan",
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

  Widget _buildBar(double height) {
    return Container(
      width: 24,
      height: height,
      decoration: BoxDecoration(
        color: Color(0xFFFFD3C6),
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }

  Widget _buildQualityChip(String title) {
    bool isSelected = selectedQuality == title;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedQuality = title;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          alignment: Alignment.center,
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
      ),
    );
  }
}