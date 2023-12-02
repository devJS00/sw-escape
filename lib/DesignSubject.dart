import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Major.dart';
import 'sideMenu.dart';

class DesignSubject extends StatelessWidget {
  const DesignSubject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('설계 과목', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: [
          Builder(
            builder: (context) => IconButton(
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                icon: Image.asset('assets/images/Menu.png')
            ),
          )
        ],
      ),
      body: const DesignSubjectPage(),
      endDrawer: SideMenu(),
    );
  }
}

class DesignSubjectPage extends StatefulWidget {
  const DesignSubjectPage({super.key});

  @override
  State<DesignSubjectPage> createState() => _DesignSubjectPageState();
}

class _DesignSubjectPageState extends State<DesignSubjectPage> {
  final _listGrade = ['0-0','1-1', '1-2', '2-1', '2-2', '3-1', '3-2', '4-1', '4-2', '5-1', '5-2', '6-1', '6-2'];
  final _selectedGrade = List<String>.filled(15, '');
  final _selectedValue = List<double>.filled(15, 0.0);
  double _progressValue = 0;
  void _updateProgress(String value, int i) {
    setState(() {
      if(value == '0-0'){
        _selectedValue[i] = 0;
      }
      else{
        _selectedValue[i] = 0.0667;
      }
      _progressValue = 0;
      for(int j = 0;j<15;j++){
        _progressValue += _selectedValue[j];
      }
      if (_progressValue >= 1.0) {
        _progressValue = 1.0;
      }
    });
  }
  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedGrade[0] = context.read<Major>().loadMajorTime('CreativeDesign');
      _selectedGrade[1] = context.read<Major>().loadMajorTime('CapstoneDesign(1)');
      _selectedGrade[2] = context.read<Major>().loadMajorTime('CapstoneDesign(2)');
      _selectedGrade[3] = context.read<Major>().loadMajorTime('LogicCircuit');
      _selectedGrade[4] = context.read<Major>().loadMajorTime('Programming');
      _selectedGrade[5] = context.read<Major>().loadMajorTime('SoftwareProject');
      _selectedGrade[6] = context.read<Major>().loadMajorTime('ObjectOrientedProgramming');
      _selectedGrade[7] = context.read<Major>().loadMajorTime('PrinciplesOfProgrammingLanguage');
      _selectedGrade[8] = context.read<Major>().loadMajorTime('DatabaseDesign');
      _selectedGrade[9] = context.read<Major>().loadMajorTime('SoftwareEngineering');
      _selectedGrade[10] = context.read<Major>().loadMajorTime('ArtificialIntelligence');
      _selectedGrade[11] = context.read<Major>().loadMajorTime('AdvancedIoTProject');
      _selectedGrade[12] = context.read<Major>().loadMajorTime('DatabaseSystem');
      _selectedGrade[13] = context.read<Major>().loadMajorTime('NetworkApplicationAndDesign');
      _selectedGrade[14] = context.read<Major>().loadMajorTime('DesignOfEmbeddedSystem');
      for(int i = 0; i<15;i++){
        if(_selectedGrade[i] != '0-0'){
          _selectedValue[i] = 0.0667;
          _progressValue += _selectedValue[i];
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors:[Color(0xFF54A9F6),Color(0xFF93CBFF)]
          )
      ),
      child: Center(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: LinearProgressIndicator(
                value: _progressValue,
                minHeight: 35.0,
                color: const Color(0xFFFB7A7A),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Image.asset('assets/images/DesignSubjectEx.png'),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 50,
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 270,
                    height: 36,
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text('창의적설계', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                trailing: Container(
                  height: 36,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: DropdownButton(
                      value: _selectedGrade[0].toString(),
                      items: _listGrade.map(
                            (grade)=>DropdownMenuItem(
                            value: grade,
                            child: Text(grade, style: const TextStyle(fontWeight: FontWeight.bold))
                        ),
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          context.read<Major>().changeMajor('CreativeDesign', value!);
                          _selectedGrade[0] = value;
                          _updateProgress(value, 0);
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 270,
                    height: 36,
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text('캡스톤디자인(1)', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                trailing: Container(
                  height: 36,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: DropdownButton(
                      value: _selectedGrade[1].toString(),
                      items: _listGrade.map(
                            (grade)=>DropdownMenuItem(
                            value: grade,
                            child: Text(grade, style: const TextStyle(fontWeight: FontWeight.bold))
                        ),
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          context.read<Major>().changeMajor('CapstoneDesign(1)', value!);
                          _selectedGrade[1] = value;
                          _updateProgress(value, 1);

                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 270,
                    height: 36,
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text('캡스톤디자인(2)', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                trailing: Container(
                  height: 36,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: DropdownButton(
                      value: _selectedGrade[2].toString(),
                      items: _listGrade.map(
                            (grade)=>DropdownMenuItem(
                            value: grade,
                            child: Text(grade, style: const TextStyle(fontWeight: FontWeight.bold))
                        ),
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          context.read<Major>().changeMajor('CapstoneDesign(2)', value!);
                          _selectedGrade[2] = value;
                          _updateProgress(value, 2);
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 270,
                    height: 36,
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text('논리회로', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                trailing: Container(
                  height: 36,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: DropdownButton(
                      value: _selectedGrade[3].toString(),
                      items: _listGrade.map(
                            (grade)=>DropdownMenuItem(
                            value: grade,
                            child: Text(grade, style: const TextStyle(fontWeight: FontWeight.bold))
                        ),
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          context.read<Major>().changeMajor('LogicCircuit', value!);
                          _selectedGrade[3] = value;
                          _updateProgress(value, 3);
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 270,
                    height: 36,
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text('프로그래밍', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                trailing: Container(
                  height: 36,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: DropdownButton(
                      value: _selectedGrade[4].toString(),
                      items: _listGrade.map(
                            (grade)=>DropdownMenuItem(
                            value: grade,
                            child: Text(grade, style: const TextStyle(fontWeight: FontWeight.bold))
                        ),
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          context.read<Major>().changeMajor('Programming', value!);
                          _selectedGrade[4] = value;
                          _updateProgress(value, 4);
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 270,
                    height: 36,
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text('소프트웨어프로젝트', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                trailing: Container(
                  height: 36,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: DropdownButton(
                      value: _selectedGrade[5].toString(),
                      items: _listGrade.map(
                            (grade)=>DropdownMenuItem(
                            value: grade,
                            child: Text(grade, style: const TextStyle(fontWeight: FontWeight.bold))
                        ),
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          context.read<Major>().changeMajor('SoftwareProject', value!);
                          _selectedGrade[5] = value;
                          _updateProgress(value, 5);
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 270,
                    height: 36,
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text('객체지향프로그래밍', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                trailing: Container(
                  height: 36,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: DropdownButton(
                      value: _selectedGrade[6].toString(),
                      items: _listGrade.map(
                            (grade)=>DropdownMenuItem(
                            value: grade,
                            child: Text(grade, style: const TextStyle(fontWeight: FontWeight.bold))
                        ),
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          context.read<Major>().changeMajor('ObjectOrientedProgramming', value!);
                          _selectedGrade[6] = value;
                          _updateProgress(value, 6);
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 270,
                    height: 36,
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text('프로그래밍언어론', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                trailing: Container(
                  height: 36,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: DropdownButton(
                      value: _selectedGrade[7].toString(),
                      items: _listGrade.map(
                            (grade)=>DropdownMenuItem(
                            value: grade,
                            child: Text(grade, style: const TextStyle(fontWeight: FontWeight.bold))
                        ),
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          context.read<Major>().changeMajor('PrinciplesOfProgrammingLanguage', value!);
                          _selectedGrade[7] = value;
                          _updateProgress(value, 7);
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 270,
                    height: 36,
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text('데이터베이스설계', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                trailing: Container(
                  height: 36,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: DropdownButton(
                      value: _selectedGrade[8].toString(),
                      items: _listGrade.map(
                            (grade)=>DropdownMenuItem(
                            value: grade,
                            child: Text(grade, style: const TextStyle(fontWeight: FontWeight.bold))
                        ),
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          context.read<Major>().changeMajor('DatabaseDesign', value!);
                          _selectedGrade[8] = value;
                          _updateProgress(value, 8);
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 270,
                    height: 36,
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text('소프트웨어공학', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                trailing: Container(
                  height: 36,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: DropdownButton(
                      value: _selectedGrade[9].toString(),
                      items: _listGrade.map(
                            (grade)=>DropdownMenuItem(
                            value: grade,
                            child: Text(grade, style: const TextStyle(fontWeight: FontWeight.bold))
                        ),
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          context.read<Major>().changeMajor('SoftwareEngineering', value!);
                          _selectedGrade[9] = value;
                          _updateProgress(value, 9);
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 270,
                    height: 36,
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text('인공지능', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                trailing: Container(
                  height: 36,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: DropdownButton(
                      value: _selectedGrade[10].toString(),
                      items: _listGrade.map(
                            (grade)=>DropdownMenuItem(
                            value: grade,
                            child: Text(grade, style: const TextStyle(fontWeight: FontWeight.bold))
                        ),
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          context.read<Major>().changeMajor('ArtificialIntelligence', value!);
                          _selectedGrade[10] = value;
                          _updateProgress(value, 10);
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 270,
                    height: 36,
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text('고급 IoT 프로젝트', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                trailing: Container(
                  height: 36,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: DropdownButton(
                      value: _selectedGrade[11].toString(),
                      items: _listGrade.map(
                            (grade)=>DropdownMenuItem(
                            value: grade,
                            child: Text(grade, style: const TextStyle(fontWeight: FontWeight.bold))
                        ),
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          context.read<Major>().changeMajor('AdvancedIoTProject', value!);
                          _selectedGrade[11] = value;
                          _updateProgress(value, 11);
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 270,
                    height: 36,
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text('데이터베이스시스템', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                trailing: Container(
                  height: 36,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: DropdownButton(
                      value: _selectedGrade[12].toString(),
                      items: _listGrade.map(
                            (grade)=>DropdownMenuItem(
                            value: grade,
                            child: Text(grade, style: const TextStyle(fontWeight: FontWeight.bold))
                        ),
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          context.read<Major>().changeMajor('DatabaseSystem', value!);
                          _selectedGrade[12] = value;
                          _updateProgress(value, 12);
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 270,
                    height: 36,
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text('네트워크응용설계', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                trailing: Container(
                  height: 36,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: DropdownButton(
                      value: _selectedGrade[13].toString(),
                      items: _listGrade.map(
                            (grade)=>DropdownMenuItem(
                            value: grade,
                            child: Text(grade, style: const TextStyle(fontWeight: FontWeight.bold))
                        ),
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          context.read<Major>().changeMajor('NetworkApplicationAndDesign', value!);
                          _selectedGrade[13] = value;
                          _updateProgress(value, 13);
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 270,
                    height: 36,
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text('내장형시스템설계', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                trailing: Container(
                  height: 36,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: DropdownButton(
                      value: _selectedGrade[14].toString(),
                      items: _listGrade.map(
                            (grade)=>DropdownMenuItem(
                            value: grade,
                            child: Text(grade, style: const TextStyle(fontWeight: FontWeight.bold))
                        ),
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          context.read<Major>().changeMajor('DesignOfEmbeddedSystem', value!);
                          _selectedGrade[14] = value;
                          _updateProgress(value, 14);
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}