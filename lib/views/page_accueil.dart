import 'package:app_projet3/core/service/api_services.dart';
import 'package:flutter/material.dart';

class PageAccueil extends StatefulWidget {
  const PageAccueil({super.key});

  @override
  State<PageAccueil> createState() => _PageAccueilState();
}

class _PageAccueilState extends State<PageAccueil> {
  final List<Map<String, dynamic>> _utilisateurs = [];
  String? erreur;
  bool estEnChargement = false;

  @override
  void initState() {
    super.initState();
    _chargerUtilisateurs();
  }

  Future<void> _chargerUtilisateurs() async {
    estEnChargement = true;
    setState(() {});
    try {
      final resulatRecu = await ApiService.fetchAllUsers();
      print(resulatRecu);
      _utilisateurs.clear(); //vider la liste
      _utilisateurs.addAll(resulatRecu);
    } catch (e) {
      print('Erreur lors du chargement des utilisateurs:$e');
      erreur = e.toString();
    } finally {
      estEnChargement = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Accueil")),
      body: estEnChargement
          ? Center(child: CircularProgressIndicator())
          : erreur != null
          ? Center(
              child: Text(
                "Erreur:$erreur",
                style: TextStyle(fontSize: 25, color: Colors.red),
              ),
            )
          : RefreshIndicator(
              onRefresh: _chargerUtilisateurs,
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, i) {
                  return Card(
                    child: ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.red, width: 2),
                        ),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                            "http://i.pravatar.cc/150?img=${_utilisateurs[i]['id']}",
                          ),
                        ),
                      ),
                      title: Text(_utilisateurs[i]['nomEntreprise']),
                      subtitle: Text(_utilisateurs[i]['adresseEntreprise']),
                    ),
                  );
                },
                itemCount: _utilisateurs.length,
              ),
            ),
    );
  }
}
