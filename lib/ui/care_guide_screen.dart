import 'package:flutter/material.dart';

class CareGuideScreen extends StatefulWidget {
  CareGuideScreen({super.key});

  @override
  State<CareGuideScreen> createState() => _CareGuideScreenState();
}

class _CareGuideScreenState extends State<CareGuideScreen> {
  // Status tab Pagi / Malam (default: Pagi)
  String selectedTime = "Pagi";

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
              // Header: Tombol Kembali & Judul "Panduan perawatan"
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
                    "Panduan perawatan",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Filter Toggle Pagi / Malam
              Row(
                children: [
                  _buildTimeChip("Pagi"),
                  SizedBox(width: 12),
                  _buildTimeChip("Malam"),
                ],
              ),
              SizedBox(height: 20),

              // Daftar Langkah-langkah Skincare (1-4)
              _buildStepCard(
                number: "1",
                title: "Pembersih wajah",
                description: "Bersihkan wajah dengan lembut.",
              ),
              SizedBox(height: 12),

              _buildStepCard(
                number: "2",
                title: "Serum",
                description: "Pakai sesuai bahan aktif yang cocok.",
              ),
              SizedBox(height: 12),

              _buildStepCard(
                number: "3",
                title: "Pelembab",
                description: "Ratakan tipis ke seluruh wajah.",
              ),
              SizedBox(height: 12),

              _buildStepCard(
                number: "4",
                title: "Tabir surya",
                description: "Wajib di pagi hari sebagai langkah terakhir.",
              ),
              SizedBox(height: 20),

              // Kartu Treatment (Rumahan & Profesional)
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
                      "TREATMENT",
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        _buildTreatmentTag("Rumahan"),
                        SizedBox(width: 8),
                        _buildTreatmentTag("Profesional"),
                      ],
                    ),
                    SizedBox(height: 14),
                    Text(
                      "Treatment profesional perlu dikonsultasikan ke tenaga ahli.",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Widget pendukung untuk tombol Chip Waktu (Pagi / Malam)
  Widget _buildTimeChip(String title) {
    bool isSelected = selectedTime == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTime = title;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
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
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.black87 : Colors.black87,
          ),
        ),
      ),
    );
  }

  // Widget pendukung untuk Kartu Langkah Perawatan
  Widget _buildStepCard({
    required String number,
    required String title,
    required String description,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xFFE8E8E8)),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Color(0xFFFFD3C6),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                number,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget pendukung Tag Treatment
  Widget _buildTreatmentTag(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xFFFFF0EC),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Color(0xFFD97059),
        ),
      ),
    );
  }
}