import 'package:flutter/material.dart';

class DietPatternScreen extends StatefulWidget {
  DietPatternScreen({super.key});

  @override
  State<DietPatternScreen> createState() => _DietPatternScreenState();
}

class _DietPatternScreenState extends State<DietPatternScreen> {
  // Status waktu makan yang dipilih (default: Sarapan)
  String selectedMealTime = "Sarapan";

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
              // Header: Tombol Kembali & Judul "Pola makan"
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
                    "Pola makan",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),

              // Pilihan Chip Waktu Makan (2x2 Wrap / Row)
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _buildMealChip("Sarapan"),
                  _buildMealChip("Makan siang"),
                  _buildMealChip("Makan malam"),
                  _buildMealChip("Camilan"),
                ],
              ),
              SizedBox(height: 24),

              // Input Makanan dan Minuman
              Text(
                "Makanan dan minuman",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black87),
              ),
              SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: "mis. nasi, sayur, air putih",
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

              // Tombol Tambah Catatan
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
                    print("Tambah catatan pola makan diklik");
                  },
                  child: Text(
                    "Tambah catatan",
                    style: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 24),

              // Kartu Ringkasan Hari Ini
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Color(0xFFE8E8E8)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "HARI INI",
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(height: 12),
                    _buildTodayRecordRow("Sarapan", "[catatan]"),
                    Divider(height: 20, color: Color(0xFFF0F0F0)),
                    _buildTodayRecordRow("Makan siang", "[catatan]"),
                  ],
                ),
              ),
              SizedBox(height: 16),

              // Kartu Edukasi
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Color(0xFFE8E8E8)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "EDUKASI",
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Padukan sayur, buah, protein, dan cukup air putih untuk mendukung kesehatan umum.",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget pendukung untuk Chip Waktu Makan
  Widget _buildMealChip(String title) {
    bool isSelected = selectedMealTime == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMealTime = title;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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

  // Widget pendukung untuk baris catatan hari ini
  Widget _buildTodayRecordRow(String mealType, String note) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          mealType,
          style: TextStyle(
            fontSize: 13,
            color: Colors.black54,
          ),
        ),
        Text(
          note,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}