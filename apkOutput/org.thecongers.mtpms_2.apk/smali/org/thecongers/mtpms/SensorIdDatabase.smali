.class Lorg/thecongers/mtpms/SensorIdDatabase;
.super Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;
.source "SensorIdDatabase.java"


# static fields
.field private static final DATABASE_NAME:Ljava/lang/String; = "discoveredSensorID.db"

.field private static final DATABASE_VERSION:I = 0x1

.field private static final TAG:Ljava/lang/String; = "mTPMS_DB"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 36
    const-string v0, "discoveredSensorID.db"

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {p0, p1, v0, v1, v2}, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 37
    invoke-virtual {p0}, Lorg/thecongers/mtpms/SensorIdDatabase;->setForcedUpgrade()V

    .line 38
    return-void
.end method


# virtual methods
.method addID(Ljava/lang/String;)V
    .locals 5
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 79
    const-string v3, "mTPMS_DB"

    const-string v4, "Adding sensor ID to DB"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    invoke-virtual {p0}, Lorg/thecongers/mtpms/SensorIdDatabase;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 81
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    const-string v1, "sensorIDs"

    .line 83
    .local v1, "sqlTables":Ljava/lang/String;
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 84
    .local v2, "values":Landroid/content/ContentValues;
    const-string v3, "sensorID"

    invoke-virtual {v2, v3, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 88
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 89
    return-void
.end method

.method public getAllSensorIDs()Landroid/database/Cursor;
    .locals 9

    .prologue
    const/4 v3, 0x0

    .line 42
    const-string v2, "mTPMS_DB"

    const-string v4, "Returning sensor IDs from DB"

    invoke-static {v2, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    invoke-virtual {p0}, Lorg/thecongers/mtpms/SensorIdDatabase;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 44
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    const-string v1, "sensorIDs"

    .line 45
    .local v1, "sqlTables":Ljava/lang/String;
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "_id"

    aput-object v5, v2, v4

    const/4 v4, 0x1

    const-string v5, "sensorID"

    aput-object v5, v2, v4

    move-object v4, v3

    move-object v5, v3

    move-object v6, v3

    move-object v7, v3

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 46
    .local v8, "c":Landroid/database/Cursor;
    if-eqz v8, :cond_0

    .line 47
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    .line 49
    :cond_0
    return-object v8
.end method

.method purgeID()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 93
    const-string v2, "mTPMS_DB"

    const-string v3, "Purging all IDs from DB"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 94
    invoke-virtual {p0}, Lorg/thecongers/mtpms/SensorIdDatabase;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 95
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    const-string v1, "sensorIDs"

    .line 98
    .local v1, "sqlTables":Ljava/lang/String;
    invoke-virtual {v0, v1, v4, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 99
    const-string v2, "VACUUM"

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 100
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 101
    return-void
.end method

.method public sensorIdExists(Ljava/lang/String;)Z
    .locals 12
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 54
    const-string v2, "mTPMS_DB"

    const-string v3, "Checking for sensor ID in DB"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    invoke-virtual {p0}, Lorg/thecongers/mtpms/SensorIdDatabase;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 56
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    const-string v1, "sensorIDs"

    .line 58
    .local v1, "sqlTables":Ljava/lang/String;
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "_id"

    aput-object v3, v2, v10

    const-string v3, "sensorID"

    aput-object v3, v2, v11

    const-string v3, "sensorID=?"

    new-array v4, v11, [Ljava/lang/String;

    aput-object p1, v4, v10

    move-object v6, v5

    move-object v7, v5

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 59
    .local v8, "c":Landroid/database/Cursor;
    if-eqz v8, :cond_1

    .line 60
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    .line 61
    invoke-interface {v8}, Landroid/database/Cursor;->getCount()I

    move-result v9

    .line 62
    .local v9, "count":I
    if-nez v9, :cond_0

    .line 63
    const-string v2, "mTPMS_DB"

    const-string v3, "sensorIdExists: FALSE"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 65
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    move v2, v10

    .line 74
    .end local v9    # "count":I
    :goto_0
    return v2

    .line 68
    .restart local v9    # "count":I
    :cond_0
    const-string v2, "mTPMS_DB"

    const-string v3, "sensorIdExists: TRUE"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 70
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    move v2, v11

    .line 71
    goto :goto_0

    .end local v9    # "count":I
    :cond_1
    move v2, v10

    .line 74
    goto :goto_0
.end method
