import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../flutter_flow/flutter_flow_util.dart';

import 'schema/contents_record.dart';
import 'schema/categories_record.dart';
import 'schema/terms_record.dart';
import 'schema/terms_histories_record.dart';
import 'schema/cat_dd_record.dart';
import 'schema/info_inapp_record.dart';
import 'schema/users_record.dart';
import 'schema/serializers.dart';

export 'package:cloud_firestore/cloud_firestore.dart';
export 'schema/index.dart';
export 'schema/serializers.dart';

export 'schema/contents_record.dart';
export 'schema/categories_record.dart';
export 'schema/terms_record.dart';
export 'schema/terms_histories_record.dart';
export 'schema/cat_dd_record.dart';
export 'schema/info_inapp_record.dart';
export 'schema/users_record.dart';

Stream<List<ContentsRecord>> queryContentsRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(ContentsRecord.collection, ContentsRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Stream<List<CategoriesRecord>> queryCategoriesRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(CategoriesRecord.collection, CategoriesRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Stream<List<TermsRecord>> queryTermsRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(TermsRecord.collection, TermsRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Stream<List<TermsHistoriesRecord>> queryTermsHistoriesRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(
        TermsHistoriesRecord.collection, TermsHistoriesRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Stream<List<CatDdRecord>> queryCatDdRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(CatDdRecord.collection, CatDdRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Stream<List<InfoInappRecord>> queryInfoInappRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(InfoInappRecord.collection, InfoInappRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Stream<List<UsersRecord>> queryUsersRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(UsersRecord.collection, UsersRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Stream<List<T>> queryCollection<T>(
    CollectionReference collection, Serializer<T> serializer,
    {Query Function(Query) queryBuilder,
    int limit = -1,
    bool singleRecord = false}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.snapshots().map((s) => s.docs
      .map(
        (d) => safeGet(
          () => serializers.deserializeWith(serializer, serializedData(d)),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .toList());
}
