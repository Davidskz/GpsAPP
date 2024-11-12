import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // URL de las APIs
  final String velocidadApiUrl = "https://www.datos.gov.co/resource/24ny-2dhf.json";
  final String siniestralidadApiUrl = "https://www.datos.gov.co/resource/rs3u-8r4q.json";

  // Método para obtener los sectores críticos por exceso de velocidad
  Future<List<dynamic>> fetchVelocidadSectores() async {
    final response = await http.get(Uri.parse(velocidadApiUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error al cargar datos de sectores críticos por exceso de velocidad');
    }
  }

  // Método para obtener los sectores críticos de siniestralidad vial
  Future<List<dynamic>> fetchSiniestralidadSectores() async {
    final response = await http.get(Uri.parse(siniestralidadApiUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error al cargar datos de sectores críticos de siniestralidad vial');
    }
  }
}
