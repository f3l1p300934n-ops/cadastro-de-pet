import 'package:flutter/material.dart';

class TermoDeAutorizacao extends StatelessWidget {
  const TermoDeAutorizacao({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Termo De Autorização de castração'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '         Eu, identificado(a) neste documento como tutor(a) ou responsável legal pelo animal acima descrito, autorizo a realização do procedimento cirúrgico de castração, a ser realizado por médico-veterinário   habilitado. Declaro que fui informado(a) sobre a finalidade do procedimento, seus benefícios, riscos, possíveis complicações e cuidados necessários antes e após a cirurgia, incluindo as orientações relativas à recuperação do animal. Declaro, ainda, que tive a oportunidade de esclarecer minhas dúvidas com o médico-veterinário responsável e que fornecerei informações verdadeiras sobre o histórico de saúde do animal, incluindo doenças conhecidas, medicamentos utilizados, alergias e procedimentos anteriores. Comprometo-me a seguir as orientações pré e pós-operatórias fornecidas pela equipe veterinária, bem como a procurar atendimento veterinário caso o animal apresente sinais de complicação. Estou ciente de que todo procedimento cirúrgico e anestésico envolve riscos, os quais serão explicados de acordo com as condições individuais do animal. Esta autorização não representa garantia de resultado nem isenta os profissionais de suas responsabilidades legais e técnicas.  DECLARAÇÃO DE CONSENTIMENTO Declaro que li e compreendi as informações deste termo, que pude esclarecer minhas dúvidas e que autorizo, de forma livre e consciente, a realização do procedimento de castração do animal identificado acima.',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); 
              },
              child: const Text('Finalizar cadastro'),
            ),
          ],
        ),
      ),
    );
  }
}
