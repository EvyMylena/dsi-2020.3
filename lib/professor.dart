import 'package:dsi_app/pessoa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dsi_app/infra.dart';
import 'package:dsi_app/constants.dart';
import 'package:dsi_app/dsi_widgets.dart';

import 'dsi_widgets.dart';

class Professor extends Pessoa{
  String disciplina;
  String siape;

  Professor({cpf, nome, endereco, this.disciplina, this.siape})
      : super(cpf: cpf, nome: nome, endereco: endereco);

  Professor.fromJson(Map<String, dynamic> json)
      : siape = json['siape'],
        super.fromJson(json);

  Map<String, dynamic> toJson() => super.toJson()
    ..addAll({
      'siape': siape,
    });
}

var professorController = ProfessorController();

class ProfessorController {
  List<Professor> getAll() {
    return pessoaController.getAll().whereType<Professor>().toList();
  }

  Professor save(professor) {
    return pessoaController.save(professor);
  }

  bool remove(professor) {
    return pessoaController.remove(professor);
  }
}

class ListProfessorPage extends StatefulWidget {
  @override
  ListProfessorPageState createState() => ListProfessorPageState();
}

class ListProfessorPageState extends State<ListProfessorPage> {
  List<Professor> _professores = professorController.getAll();

  @override
  Widget build(BuildContext context) {
    return DsiScaffold(
      title: 'Listagem de Professores',
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => dsiHelper.go(context, '/maintain_professor'),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        // physics: NeverScrollableScrollPhysics(),
        itemCount: _professores.length,
        itemBuilder: _buildListTileProfessor,
      ),
    );
  }

  Widget _buildListTileProfessor(context, index) {
    var professor = _professores[index];
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        setState(() {
          professorController.remove(professor);
          _professores.remove(index);
        });
        dsiHelper.showMessage(
          context: context,
          message: '${professor.nome} foi removido.',
        );
      },
      background: Container(
        color: Colors.red,
        child: Row(
          children: <Widget>[
            Constants.boxSmallWidth,
            Icon(Icons.delete, color: Colors.white),
            Spacer(),
            Icon(Icons.delete, color: Colors.white),
            Constants.boxSmallWidth,
          ],
        ),
      ),
      child: ListTile(
        title: Text(professor.nome),
        subtitle: Column(
          children: <Widget>[
            Text('id. ${professor.id}'),
            SizedBox(width: 8.0),
            Text('disc. ${professor.disciplina}'),
            SizedBox(width: 8.0),
            Text('siap. ${professor.siape}'),
          ],
        ),
        onTap: () => dsiHelper.go(context, "/maintain_professor", arguments: professor),
      ),
    );
  }
}

class MaintainProfessorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Professor professor = dsiHelper.getRouteArgs(context);
    if (professor == null) {
      professor = Professor();
    }

    return DsiBasicFormPage(
      title: 'Professor',
      onSave: () {
        professorController.save(professor);
        dsiHelper.go(context, '/list_professor');
      },
      body: Wrap(
        alignment: WrapAlignment.center,
        runSpacing: Constants.boxSmallHeight.height,
        children: <Widget>[
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Siape*'),
            validator: (String value) {
              return value.isEmpty ? 'Siape inválido.' : null;
            },
            initialValue: professor.siape,
            onSaved: (newValue) => professor.siape = newValue,
          ),
//          TextFormField(
//            keyboardType: TextInputType.number,
//            decoration: const InputDecoration(labelText: 'CPF*'),
//            validator: (String value) {
//              return value.isEmpty ? 'CPF inválido.' : null;
//            },
//            initialValue: professor.cpf,
//            onSaved: (newValue) => professor.cpf = newValue,
//          ),
//          Constants.boxSmallHeight,
//          TextFormField(
//            keyboardType: TextInputType.text,
//            decoration: const InputDecoration(labelText: 'Nome*'),
//            validator: (String value) {
//              return value.isEmpty ? 'Nome inválido.' : null;
//            },
//            initialValue: professor.nome,
//            onSaved: (newValue) => professor.nome = newValue,
//          ),
//          Constants.boxSmallHeight,
//          TextFormField(
//            keyboardType: TextInputType.text,
//            decoration: const InputDecoration(labelText: 'Endereço*'),
//            validator: (String value) {
//              return value.isEmpty ? 'Endereço inválido.' : null;
//            },
//            initialValue: professor.endereco,
//            onSaved: (newValue) => professor.endereco = newValue,
//          ),
//          Constants.boxSmallHeight,
//          TextFormField(
//            keyboardType: TextInputType.number,
//            decoration: const InputDecoration(labelText: 'Disciplina*'),
//            validator: (String value) {
//              return value.isEmpty ? 'Disciplina inválida.' : null;
//            },
//            initialValue: professor.disciplina,
//            onSaved: (newValue) => professor.disciplina = newValue,
//          ),
//          Constants.boxSmallHeight,
        ],
      ),
    );
  }
}

