import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_new_app/modules/clients/clients.dart';
import 'package:gym_new_app/modules/clients/repositories/client_repository.dart';
import 'package:gym_new_app/modules/clients/widgets/cpf_formatter.dart';
import 'package:gym_new_app/modules/clients/widgets/image_picker.dart';
import 'package:gym_new_app/modules/clients/widgets/validate_borndate.dart';
import 'package:gym_new_app/utils/const_colors.dart';
import 'package:gym_new_app/utils/snackbar_utils.dart';
import 'package:gym_new_app/widgets/buttons/custom_button.dart';

import '../../home/widgets/custom_textfield.dart';

class ClientsRegisterPage extends StatefulWidget {
  const ClientsRegisterPage({super.key});

  @override
  State<ClientsRegisterPage> createState() => _ClientsRegisterPageState();
}

class _ClientsRegisterPageState extends State<ClientsRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  String? _gender;
  final TextEditingController _avaliacaoController = TextEditingController();
  final TextEditingController _alunoCPFController = TextEditingController();
  final TextEditingController _vencimentoPlanoController =
      TextEditingController();

  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _emailAlunoController = TextEditingController();
  final TextEditingController _nascimentoController = TextEditingController();

  final FocusNode _cpfFocusNode = FocusNode();
  final ValueNotifier<File?> _imageNotifier = ValueNotifier<File?>(null);
  final ImagePickerHelper _imagePickerHelper = ImagePickerHelper();

  @override
  void initState() {
    super.initState();

    _cpfFocusNode.addListener(() {
      if (!_cpfFocusNode.hasFocus) {
        //Formatar o CPF quando o campo perder o foco
        final cpfFormatado = CpfFormatter.format(_alunoCPFController.text);
        _alunoCPFController.value = _alunoCPFController.value.copyWith(
            text: cpfFormatado,
            selection: TextSelection.collapsed(offset: cpfFormatado.length));
      }
    });
  }

  @override
  void dispose() {
    _cpfFocusNode.dispose();
    super.dispose();
  }

  Future<File?> _pickImageFromFiles() async {
    final pickedImage = await _imagePickerHelper.pickImageFromFiles();
    if (pickedImage != null) {
      _imageNotifier.value = pickedImage;
    }
    return pickedImage;
  }

  void _saveStudent() async {
    if (_formKey.currentState!.validate()) {
      final String name = _nameController.text;
      final String CPF =
          _alunoCPFController.text.replaceAll('.', '').replaceAll('-', '');
      final String sexo = _gender!;
      final String avaliacao = _avaliacaoController.text;
      final String vencimento = _vencimentoPlanoController.text;
      final String telefone = _telefoneController.text;
      final String email = _emailAlunoController.text;
      final String dataNascimento =
          _nascimentoController.text.split('/').reversed.join('-');

      final ClientsBasicInfo newAluno = ClientsBasicInfo(
        id: 0,
        name: name,
        sexo: sexo,
        avaliacao: avaliacao,
        alunoCPF: CPF,
        vencimento: vencimento,
        email: email,
        dataNascimento: dataNascimento,
        imagePath: _imageNotifier.value?.path,
        telefone: telefone,
      );
      try {
        await ClientRepository.addClient(newAluno);

        // Exemplo de exibição dos dados do aluno
        print(
            'Aluno salvo: ${_imageNotifier.value?.path}, ${newAluno.name}, ${newAluno.sexo}, ${newAluno.alunoCPF}, ${newAluno.email}, ${newAluno.avaliacao}');

        // Após salvar, você pode navegar para outra página ou mostrar uma mensagem de sucesso
        SnackBarUtils.showSnackbar(
            context, Icons.check_circle, 'Aluno cadastrado com sucesso !');

        // Navegar para outra página, se necessário
        context.pop();
      } catch (e) {
        print(
            'Aluno salvo: ${_imageNotifier.value?.path}, ${newAluno.name}, ${newAluno.sexo}, ${newAluno.alunoCPF}, ${newAluno.email}, ${newAluno.avaliacao}');

        print("Erro $e");
        SnackBarUtils.showSnackbar(
            context, Icons.error_rounded, 'Houve um erro ao cadastrar o aluno');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              ImagePickerWidget(
                imageNotifier: _imageNotifier,
                onPickImageFromFiles: _pickImageFromFiles,
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Nome*',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              CustomTextField(
                maxLength: 45,
                hintText: 'Digite o nome do aluno',
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              const Text(
                'Sexo*',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              DropdownButtonFormField<String>(
                focusColor: Colors.white,
                value: _gender,
                items: ['Masculino', 'Feminino', 'Outros']
                    .map((gender) => DropdownMenuItem<String>(
                          value: gender,
                          child: Text(gender),
                        ))
                    .toList(),
                onChanged: (value) {
                  //TODO: M = MASCULINO
                  // if (value.contains('Masculino')) {
                  //   value = 'M';
                  // }
                  print(value);
                  setState(() {
                    _gender = value;
                  });
                },
                decoration: const InputDecoration(
                  hintStyle: TextStyle(color: AppTheme.textBox),
                  hintText: 'Selecione o sexo',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              const Text(
                'CPF*',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              CustomTextField(
                maxLength: 14,
                hintText: 'Digite o CPF',
                controller: _alunoCPFController,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                focusNode: _cpfFocusNode,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  if (value.length != 14) {
                    return 'CPF Inválido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              const Text(
                'Telefone*',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              CustomTextField(
                  maxLength: 11,
                  hintText: 'Insira o telefone do aluno',
                  controller: _telefoneController),
              const SizedBox(height: 8),
              const Text(
                'Email do Aluno*',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              CustomTextField(
                maxLength: 50,
                hintText: 'Digite o email do aluno',
                controller: _emailAlunoController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Email Inválido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              const Text(
                'Data de Nacimento',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              CustomTextField(
                maxLength: 10,
                hintText: 'Digite a data de nacimento (dd/mm/yyyy)',
                controller: _nascimentoController,
                keyboardType: TextInputType.datetime,
                validator: validateDate,
              ),
              const SizedBox(height: 24),
              Center(
                child: CustomButton(
                  onPressed: _saveStudent,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  text: 'Salvar',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
