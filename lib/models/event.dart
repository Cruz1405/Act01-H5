import 'group.dart';
import 'person.dart';

class Event {
  final int id;
  final String name;
  final String description;
  final String logo;
  final String code;
  List<Group> group;

  Event({
    required this.id,
    required this.name,
    required this.description,
    required this.logo,
    required this.code,
    required this.group,
  });
}

final person1 = Person(
  id: 1,
  name: 'Persona 1',
  code: '001',
  state: 'activo',
  phone: '6666555',
);
final person2 = Person(
  id: 2,
  name: 'Persona 2',
  code: '002',
  state: 'activo',
  phone: '324324234',
);
final person3 = Person(
  id: 3,
  name: 'Persona 3',
  code: '003',
  state: 'activo',
  phone: '112221111',
);

final group1 = Group(
  id: 1,
  name: 'Grupo 1',
  code: 'group-1',
  description: 'Descripción del grupo 1',
  persons: [person3, person2],
);
final group2 = Group(
  id: 2,
  name: 'Grupo 2',
  code: 'group-2',
  description: 'Descripción del grupo 2',
  persons: [person1, person2],
);
final group3 = Group(
    id: 3,
    name: 'Grupo 3',
    code: 'group-3',
    description: 'Descripción del grupo 3',
    persons: [person1]);

final List<Event> events = [
  Event(
      id: 1,
      name: 'Evento 1',
      description: 'Descripción del evento 1',
      logo: 'assets/images/logo-1.png',
      code: 'código-del-evento-1',
      group: [group1, group2]),
  Event(
    id: 2,
    name: 'Evento 2',
    description: 'Descripción del evento 2',
    logo: 'assets/images/logo-2.png',
    code: 'código-del-evento-2',
    group: [group1],
  ),
  Event(
    id: 3,
    name: 'Evento 3',
    description: 'Descripción del evento 3',
    logo: 'assets/images/logo-3.jpg',
    code: 'código-del-evento-3',
    group: [group3],
  ),
];


/*final group = Group(
  id: 1,
  name: 'Grupo 1',
  code: 'group-1',
  state: 'activo',
  logo: 'ruta/al/logo-1',
  description: 'Descripción del grupo 1',
);*/

/*Event myEvent = Event(
  id: 1,
  name: 'Nombre del evento',
  description: 'Descripción del evento',
  logo: 'ruta/al/logo',
  code: 'código-del-evento',
  group: groups.where((group) => group.id == 1).toList(),
);*/
