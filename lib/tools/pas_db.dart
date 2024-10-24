import 'dart:math';

import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:pet_shop_manager/app/assets/assets.dart';
import 'package:pet_shop_manager/app/modules/record_page/controllers/record_page_controller.dart';
import 'package:sqflite/sqflite.dart';
import 'package:pet_shop_manager/tools/recordmode.dart';
import 'package:faker/faker.dart';

class PSDatabaseTool extends GetxService {
  late Database db;
  String lastTime = "";
  Future<PSDatabaseTool> init() async {
    await initDB();
    return this;
  }

  initDB() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'pet_shop_manager.db');

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await createTable(db);
    });

    insetInitailDatas();
  }

  Future<void> createTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS pet_manager_table (id INTEGER PRIMARY KEY AUTOINCREMENT, createTime INT, petAge INT,finished  INT, gender INT,  iconname TEXT ,petName TEXT,realAmount TEXT,type TEXT, amount DOUBLE(10, 2) , phone TEXT)');
  }

  Future insetInitailDatas() async {
    await Future.delayed(const Duration(milliseconds: 300));

    final listModels = [
      {
        "title": "Pet Wash",
        "subTitle": "Dress up and love your pet",
        "img": Assets.wash
      },
      {
        "title": "Pet vaccine",
        "subTitle": "Prevent infectious diseases",
        "img": Assets.vaccine
      },
      {
        "title": "Pet food",
        "subTitle": "Store pet rations",
        "img": Assets.foods
      },
      {
        "title": "Pet medical",
        "subTitle": "Care for pet health",
        "img": Assets.medication
      }
    ];

    for (var i = 0; i < 10; i++) {
      final index = Random().nextInt(99) % 4;
      final mmm = listModels[index];
      final newModel = PSRecordModel();
      newModel.type = mmm["title"];
      newModel.amount = 200 + Random().nextInt(500) + Random().nextDouble();
      newModel.petName = faker.animal.name();
      newModel.petAge = Random().nextInt(10);
      newModel.phone = "01 952-987-2395";
      newModel.finished = (Random().nextInt(99) > 50) ? 1 : 0;
      newModel.iconname = mmm["img"];
      newModel.createTime = DateTime(2023 + Random().nextInt(2),
              1 + Random().nextInt(12), 1 + Random().nextInt(31))
          .millisecondsSinceEpoch;
      await insetPetManagerRecord(newModel);
    }

    if (Get.isRegistered<RecordPageController>()) {
      final vc = Get.find<RecordPageController>();
      vc.refreshDatas();
    }
  }

  Future<void> insetPetManagerRecord(PSRecordModel item) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'pet_shop_manager.db');
    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});

    await db.insert('pet_manager_table', {
      'amount': item.amount,
      'petName': item.petName,
      'petAge': item.petAge,
      'gender': item.gender,
      'phone': item.phone,
      'type': item.type,
      'realAmount': "",
      "finished": item.finished,
      "iconname": item.iconname,
      'createTime': item.createTime,
    });

  }

  update(PSRecordModel item) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'pet_shop_manager.db');

    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});
    await db.update(
        'pet_manager_table',
        {
          'amount': item.amount,
          'petName': item.petName,
          'petAge': item.petAge,
          'gender': item.gender,
          'phone': item.phone,
          'type': item.type,
          'finished': item.finished,
          "iconname": item.iconname,
          "realAmount": item.realAmount,
          'createTime': item.createTime,
        },
        where: 'id = ?',
        whereArgs: [
          item.id,
        ]);
  }

  Future<void> clean() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'pet_shop_manager.db');
    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});
    await db.delete('pet_manager_table');
  }

  Future<List<PSRecordModel>> getAllRecords() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'pet_shop_manager.db');

    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});
    var result = await db.query('pet_manager_table', orderBy: 'id DESC');
    return result.map((e) => PSRecordModel.fromJson(e)).toList();
  }
}
