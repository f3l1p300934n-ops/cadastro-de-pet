
import 'package:flutter/material.dart';
import 'package:flutter_application_2/termo-de-autorizacao.dart';

void main() => runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CadastroPet(),
      ),
    );

class CadastroPet extends StatefulWidget {
  const CadastroPet({super.key});

  @override
  State<CadastroPet> createState() => _CadastroPetState();
}

class _CadastroPetState extends State<CadastroPet> {
  final _formKey = GlobalKey<FormState>();

  final nome = TextEditingController();
  final raca = TextEditingController();
  final idade = TextEditingController();
  final tutor = TextEditingController();

  final List<Pet> _petsCadastrados = [];

  String? especie;

  bool _adicionarPet() {
    if (!_formKey.currentState!.validate()) {
      return false;
    }

    setState(() {
      _petsCadastrados.add(
        Pet(
          nome: nome.text.trim(),
          especie: especie!,
          raca: raca.text.trim(),
          idade: int.parse(idade.text),
          tutor: tutor.text.trim(),
        ),
      );
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Pet cadastrado com sucesso!'),
      ),
    );

    return true;
  }

  void _cadastrarEContinuar() {
    if (_adicionarPet()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const TermoDeAutorizacao(),
        ),
      );
    }
  }

  @override
  void dispose() {
    nome.dispose();
    raca.dispose();
    idade.dispose();
    tutor.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Pet'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Icon(
                Icons.pets,
                size: 70,
                color: Colors.blue,
              ),

              campo(nome, 'Nome do pet'),

              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Espécie',
                  border: OutlineInputBorder(),
                ),
                items: ['Cachorro', 'Gato', 'Ave', 'Outro']
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ),
                    )
                    .toList(),
                value: especie,
                onChanged: (v) {
                  setState(() {
                    especie = v;
                  });
                },
                validator: (v) =>
                    v == null ? 'Selecione a espécie' : null,
              ),

              campo(raca, 'Raça'),

              campo(idade, 'Idade em anos', numero: true),

              campo(tutor, 'Nome do tutor'),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: _cadastrarEContinuar,
                child: const Text(
                  'Cadastrar e ir para a próxima tela',
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                'Pets cadastrados nesta sessão:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              if (_petsCadastrados.isEmpty)
                const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text('Nenhum pet cadastrado ainda.'),
                ),

              ..._petsCadastrados.map(
                (pet) => Card(
                  child: ListTile(
                    leading: const Icon(
                      Icons.pets,
                      color: Colors.blue,
                    ),
                    title: Text(pet.nome),
                    subtitle: Text(
                      '${pet.especie} - ${pet.raca}\n'
                      'Idade: ${pet.idade} anos\n'
                      'Tutor: ${pet.tutor}',
                    ),
                    isThreeLine: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget campo(
    TextEditingController c,
    String label, {
    bool numero = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextFormField(
        controller: c,
        keyboardType:
            numero ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: (v) {
          if (v == null || v.trim().isEmpty) {
            return 'Preencha $label';
          }

          if (numero) {
            final valor = int.tryParse(v);

            if (valor == null || valor < 0) {
              return 'Informe uma idade válida';
            }
          }

          return null;
        },
      ),
    );
  }
}

// Modelo que representa um pet.
class Pet {
  final String nome;
  final String especie;
  final String raca;
  final int idade;
  final String tutor;
  final bool castrado;

  Pet({
    required this.nome,
    required this.especie,
    required this.raca,
    required this.idade,
    required this.tutor,
    this.castrado = false,
  });
}
