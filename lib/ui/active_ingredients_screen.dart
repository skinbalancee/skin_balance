import 'package:flutter/material.dart';
import 'product_recommendation_screen.dart';

class ActiveIngredientsScreen extends StatelessWidget {
  ActiveIngredientsScreen({super.key});

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
                    "Bahan aktif",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              _buildIngredientCard(
                name: "Niacinamide",
                function: "Mengontrol minyak",
                concentration: "[dari dataset]",
                suitability: "Cocok untuk kulit kombinasi",
                warning: "Mulai bertahap, uji di area kecil",
              ),
              SizedBox(height: 16),
              _buildIngredientCard(
                name: "Salicylic acid",
                function: "Membersihkan pori",
                concentration: "[dari dataset]",
                suitability: "Cocok untuk kulit kombinasi",
                warning: "Mulai bertahap, uji di area kecil",
              ),
              SizedBox(height: 16),
              Text(
                "Berdasarkan referensi, bukan diagnosis medis.",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black45,
                ),
              ),
              SizedBox(height: 36),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductRecommendationScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Lihat produk yang cocok",
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

  Widget _buildIngredientCard({
    required String name,
    required String function,
    required String concentration,
    required String suitability,
    required String warning,
  }) {
    return Container(
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
            name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 14),
          _buildDetailRow("Fungsi", function),
          SizedBox(height: 8),
          _buildDetailRow("Konsentrasi", concentration),
          SizedBox(height: 8),
          _buildDetailRow("Kesesuaian", suitability),
          SizedBox(height: 8),
          _buildDetailRow("Perhatian", warning),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            color: Colors.black45,
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}