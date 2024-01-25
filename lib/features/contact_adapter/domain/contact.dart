import 'dart:convert';
import 'package:csv/csv.dart';
import 'package:xml/xml.dart';

class Contact {
  final String fullName;
  final String email;
  final String phoneNumber;
  final bool friend;

  const Contact({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.friend,
  });
}

abstract class IContactsAdapter {
  List<Contact> getContacts();
}

class XmlContactsAdapter implements IContactsAdapter {
  final XmlContactsReader _reader = XmlContactsReader();

  @override
  List<Contact> getContacts() {
    final contactsXml = _reader.getContactsXml();
    final contactsList = _parseContactsXml(contactsXml);

    return contactsList;
  }

  List<Contact> _parseContactsXml(String contactsXml) {
    final xmlDocument = XmlDocument.parse(contactsXml);
    final contactsList = <Contact>[];

    for (final xmlElement in xmlDocument.findAllElements('contact')) {
      final fullName = xmlElement.findElements('fullname').single.innerText;
      final email = xmlElement.findElements('email').single.innerText;
      final favouriteString =
          xmlElement.findElements('friend').single.innerText;
      final friend = favouriteString.toLowerCase() == 'true';
      final phoneNumber =
          xmlElement.findElements('phoneNumber').single.innerText;

      contactsList.add(
        Contact(
          fullName: fullName,
          email: email,
          friend: friend,
          phoneNumber: phoneNumber,
        ),
      );
    }

    return contactsList;
  }
}

class JsonContactsAdapter implements IContactsAdapter {
  final JsonContactsReader _reader = JsonContactsReader();

  @override
  List<Contact> getContacts() {
    final contactsJson = _reader.getContactsJson();
    final contactsList = _parseContactsJson(contactsJson);

    return contactsList;
  }

  List<Contact> _parseContactsJson(String contactsJson) {
    final contactsMap = json.decode(contactsJson) as Map<String, dynamic>;
    final contactsJsonList = contactsMap['contacts'] as List;
    final contactsList = contactsJsonList.map((json) {
      final contactJson = json as Map<String, dynamic>;

      return Contact(
        fullName: contactJson['fullName'] as String,
        email: contactJson['email'] as String,
        friend: contactJson['friend'] as bool,
        phoneNumber: contactJson['phoneNumber'] as String,
      );
    }).toList();

    return contactsList;
  }
}

class CSVContactsAdapter implements IContactsAdapter {
  final CSVContactsReader _reader = CSVContactsReader();

  @override
  List<Contact> getContacts() {
    final contactsJson = _reader.getContactsJson();
    final contactsList = _parseContactsJson(contactsJson);

    return contactsList;
  }

  List<Contact> _parseContactsJson(String contactsJson) {
    List<List<dynamic>> rowsAsListOfValues = const CsvToListConverter().convert(
      contactsJson,
    );
    final contactsList = <Contact>[];
    rowsAsListOfValues.removeAt(0);

    for (final csvElement in rowsAsListOfValues) {
      final String fullName = csvElement.elementAt(0);
      final String email = csvElement.elementAt(1);
      final bool friend = csvElement.elementAt(2) == 'true';
      final String phoneNumber = csvElement.elementAt(3);

      contactsList.add(
        Contact(
          fullName: fullName,
          email: email,
          friend: friend,
          phoneNumber: phoneNumber,
        ),
      );
    }

    return contactsList;
  }
}

class XmlContactsReader {
  final String _contactsXml = '''
  <?xml version="1.0"?>
  <contacts>
    <contact>
      <fullname>John Smith (XML)</fullname>
      <email>johns@xml.com</email>
      <friend>false</friend>
      <phoneNumber>999-999-9999</phoneNumber>
    </contact>
    <contact>
      <fullname>Elizabeth Smith (XML)</fullname>
      <email>elisabeths@xml.com</email>
      <friend>true</friend>
      <phoneNumber>999-999-9990</phoneNumber>
    </contact>
    <contact>
      <fullname>Sebastian Smith (XML)</fullname>
      <email>sebastians@xml.com</email>
      <friend>true</friend>
      <phoneNumber>999-999-8880</phoneNumber>
    </contact>
  </contacts>
  ''';

  String getContactsXml() {
    return _contactsXml;
  }
}

class JsonContactsReader {
  final String _contactsJson = '''
  {
    "contacts": [
      {
        "fullName": "John Smith (JSON)",
        "email": "johns@json.com",
        "friend": false,
        "phoneNumber" : "999-999-9999"
      },
      {
        "fullName": "Elizabeth Smith (JSON)",
        "email": "elizabeths@json.com",
        "friend": true,
        "phoneNumber" : "999-999-9999"
      },
      {
        "fullName": "Sebastian Smith (JSON)",
        "email": "sebastians@json.com",
        "friend": true,
        "phoneNumber" : "999-999-9999"
      }
    ]
  }
  ''';

  String getContactsJson() {
    return _contactsJson;
  }
}

class CSVContactsReader {
  final String _contactsCSV =
      '''contacts/fullName,contacts/email,contacts/friend,contacts/phoneNumber\r\nJohn Smith (CSV),johns@csv.com,false,999-999-9999\r\nElizabeth Smith (CSV),elizabeths@csv.com,true,999-999-9999\r\nSebastian Smith (CSV),sebastians@csv.com,true,999-999-9999\r\n''';

  String getContactsJson() {
    return _contactsCSV;
  }
}
