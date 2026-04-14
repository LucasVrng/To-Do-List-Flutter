import 'package:flutter/material.dart';
import 'stats_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo), useMaterial3: true),
      home: const TodoListScreen(),
    );
  }
}

// ─── Modèle de données (ne pas modifier) ─────────────────────────────────────

class Task {
  final String title;
  bool isDone;

  Task({required this.title, this.isDone = false});
}

Task task1 = Task(title: "tache 1");
Task task2 = Task(title: "tache 2");
Task task3 = Task(title: "tache 3");

List<Task> tasks = [task1, task2, task3];

final textFormController = TextEditingController();

// ─── Écran principal ─────────────────────────────────────────────────────────

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  // F1 — Déclarez votre liste de tâches ici (au moins 3 tâches par défaut)

  @override
  void dispose() {
    super.dispose();
    textFormController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ma Todo List'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        // F5 — Navigation vers l'écran Statistiques
      ),
      // Tout le body est à construire : zone de saisie (F2), liste (F1/F3/F4)
      body: Center ( 
        child: Column(
          children: [
          ElevatedButton(
          onPressed: () {
           Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => StatsScreen(tasks: tasks,))
                );
          },
          child: const Text('Voir les statistiques'),
        ),
        tasks.isEmpty ? Text("Aucune tâche de disponible") :
        Expanded(child:
      GridView.count(
        crossAxisCount: 3,
        children: List.generate(tasks.length, (index) {
            final task = tasks[index].title;
            
          return Dismissible(
            key: Key(task),
            onDismissed: (direction) {
              setState(() {
                tasks.removeAt(index);
              });
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('$task supprimée')));
            },
            background: Container(color: Colors.red,),
              child: Column(
                children: <Widget> [
                Text( tasks[index].title, style: tasks[index].isDone ? TextStyle(decoration: TextDecoration.lineThrough) : TextStyle(decoration: TextDecoration.underline)),
                IconButton(icon: Icon(tasks[index].isDone ? Icons.favorite : Icons.favorite_border),
                onPressed: () {
                  setState(() {
                    tasks[index].isDone = !tasks[index].isDone;
                  });
            },
            ),
            ]
            )
          );
        }
      ),
      ),
        ),
        MyForm(tasks: tasks)
          ]
    )
    )
    );
  }
}

class MyForm extends StatefulWidget{
  final dynamic tasks;

  const MyForm ({super.key, required this.tasks});

  @override
  MyFormState createState() {
    return MyFormState();
  }
}

  class MyFormState extends State<MyForm> {
    final _formKey = GlobalKey<FormState>();

    @override
    Widget build(BuildContext context) {
      return Form(
        key: _formKey,
        child: Column (
          children:  [
            TextFormField(
              controller: textFormController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter some text";
                }
                return null;
              },
            ),
            ElevatedButton(onPressed: () {
              if (_formKey.currentState!.validate()) {
                  Task newTask = Task(title: textFormController.text);
                  tasks.add(newTask);
                
              }
            }, child: const Text("submit"))
          ]
        )
      );
    }
  }



