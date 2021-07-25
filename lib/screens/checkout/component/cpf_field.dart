import 'package:brasil_fields/brasil_fields.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
//import 'package:rideuserapp/models/user_manager.dart';
import 'package:rideusertesteapp/model/userManager.dart';

class CPFField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userManager = context.watch<UserManager>();
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('CPF',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            TextFormField(
              initialValue: userManager.user.cpf,
              decoration: InputDecoration(
                hintText: '000.000.000-00',
                isDense: true
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly,
                
                CpfInputFormatter()
              ],
              validator: (cpf){
                if(cpf.isEmpty) return 'Campo Obrigatotio';
                else if(!CPFValidator.isValid(cpf)) return 'CPF Inválido';
                return null;
              },
              //onSaved: userManager.user.setCpf, //Temp
            ),
          ],
        ),
      ),
    );
  }
}
