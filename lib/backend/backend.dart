import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../flutter_flow/flutter_flow_util.dart';

import 'schema/contents_record.dart';
import 'schema/categories_record.dart';
import 'schema/terms_record.dart';
import 'schema/terms_histories_record.dart';
import 'schema/cat_dd_record.dart';
import 'schema/info_inapp_record.dart';
import 'schema/users_record.dart';
import 'schema/logoname_record.dart';
import 'schema/survey_record.dart';
import 'schema/alert_record.dart';
import 'schema/companies_record.dart';
import 'schema/shops_record.dart';
import 'schema/plans_record.dart';
import 'schema/cat_shop_record.dart';
import 'schema/customers_record.dart';
import 'schema/cart_record.dart';
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
export 'schema/logoname_record.dart';
export 'schema/survey_record.dart';
export 'schema/alert_record.dart';
export 'schema/companies_record.dart';
export 'schema/shops_record.dart';
export 'schema/plans_record.dart';
export 'schema/cat_shop_record.dart';
export 'schema/customers_record.dart';
export 'schema/cart_record.dart';

/// Functions to query ContentsRecords (as a Stream and as a Future).
Stream<List<ContentsRecord>> queryContentsRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(ContentsRecord.collection, ContentsRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<ContentsRecord>> queryContentsRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(ContentsRecord.collection, ContentsRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query CategoriesRecords (as a Stream and as a Future).
Stream<List<CategoriesRecord>> queryCategoriesRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(CategoriesRecord.collection, CategoriesRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<CategoriesRecord>> queryCategoriesRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(
        CategoriesRecord.collection, CategoriesRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query TermsRecords (as a Stream and as a Future).
Stream<List<TermsRecord>> queryTermsRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(TermsRecord.collection, TermsRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<TermsRecord>> queryTermsRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(TermsRecord.collection, TermsRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query TermsHistoriesRecords (as a Stream and as a Future).
Stream<List<TermsHistoriesRecord>> queryTermsHistoriesRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(
        TermsHistoriesRecord.collection, TermsHistoriesRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<TermsHistoriesRecord>> queryTermsHistoriesRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(
        TermsHistoriesRecord.collection, TermsHistoriesRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query CatDdRecords (as a Stream and as a Future).
Stream<List<CatDdRecord>> queryCatDdRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(CatDdRecord.collection, CatDdRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<CatDdRecord>> queryCatDdRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(CatDdRecord.collection, CatDdRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query InfoInappRecords (as a Stream and as a Future).
Stream<List<InfoInappRecord>> queryInfoInappRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(InfoInappRecord.collection, InfoInappRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<InfoInappRecord>> queryInfoInappRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(InfoInappRecord.collection, InfoInappRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query UsersRecords (as a Stream and as a Future).
Stream<List<UsersRecord>> queryUsersRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(UsersRecord.collection, UsersRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<UsersRecord>> queryUsersRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(UsersRecord.collection, UsersRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query LogonameRecords (as a Stream and as a Future).
Stream<List<LogonameRecord>> queryLogonameRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(LogonameRecord.collection, LogonameRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<LogonameRecord>> queryLogonameRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(LogonameRecord.collection, LogonameRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query SurveyRecords (as a Stream and as a Future).
Stream<List<SurveyRecord>> querySurveyRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(SurveyRecord.collection, SurveyRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<SurveyRecord>> querySurveyRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(SurveyRecord.collection, SurveyRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query AlertRecords (as a Stream and as a Future).
Stream<List<AlertRecord>> queryAlertRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(AlertRecord.collection, AlertRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<AlertRecord>> queryAlertRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(AlertRecord.collection, AlertRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query CompaniesRecords (as a Stream and as a Future).
Stream<List<CompaniesRecord>> queryCompaniesRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(CompaniesRecord.collection, CompaniesRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<CompaniesRecord>> queryCompaniesRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(CompaniesRecord.collection, CompaniesRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query ShopsRecords (as a Stream and as a Future).
Stream<List<ShopsRecord>> queryShopsRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(ShopsRecord.collection, ShopsRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<ShopsRecord>> queryShopsRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(ShopsRecord.collection, ShopsRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query PlansRecords (as a Stream and as a Future).
Stream<List<PlansRecord>> queryPlansRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(PlansRecord.collection, PlansRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<PlansRecord>> queryPlansRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(PlansRecord.collection, PlansRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query CatShopRecords (as a Stream and as a Future).
Stream<List<CatShopRecord>> queryCatShopRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(CatShopRecord.collection, CatShopRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<CatShopRecord>> queryCatShopRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(CatShopRecord.collection, CatShopRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query CustomersRecords (as a Stream and as a Future).
Stream<List<CustomersRecord>> queryCustomersRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(CustomersRecord.collection, CustomersRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<CustomersRecord>> queryCustomersRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(CustomersRecord.collection, CustomersRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query CartRecords (as a Stream and as a Future).
Stream<List<CartRecord>> queryCartRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(CartRecord.collection, CartRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<CartRecord>> queryCartRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(CartRecord.collection, CartRecord.serializer,
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

Future<List<T>> queryCollectionOnce<T>(
    CollectionReference collection, Serializer<T> serializer,
    {Query Function(Query) queryBuilder,
    int limit = -1,
    bool singleRecord = false}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.get().then((s) => s.docs
      .map(
        (d) => safeGet(
          () => serializers.deserializeWith(serializer, serializedData(d)),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .toList());
}

// Creates a Firestore record representing the logged in user if it doesn't yet exist
Future maybeCreateUser(User user) async {
  final userRecord = UsersRecord.collection.doc(user.uid);
  final userExists = await userRecord.get().then((u) => u.exists);
  if (userExists) {
    return;
  }

  final userData = createUsersRecordData(
    email: user.email,
    displayName: user.displayName,
    photoUrl: user.photoURL,
    uid: user.uid,
    phoneNumber: user.phoneNumber,
    createdTime: getCurrentTimestamp,
  );

  await userRecord.set(userData);
}
