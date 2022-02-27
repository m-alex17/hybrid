.class public Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "SQLiteAssetHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper$SQLiteAssetException;
    }
.end annotation


# static fields
.field private static final ASSET_DB_PATH:Ljava/lang/String; = "databases"

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mAssetPath:Ljava/lang/String;

.field private final mContext:Landroid/content/Context;

.field private mDatabase:Landroid/database/sqlite/SQLiteDatabase;

.field private mDatabasePath:Ljava/lang/String;

.field private final mFactory:Landroid/database/sqlite/SQLiteDatabase$CursorFactory;

.field private mForcedUpgradeVersion:I

.field private mIsInitializing:Z

.field private final mName:Ljava/lang/String;

.field private final mNewVersion:I

.field private mUpgradePathFormat:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 59
    const-class v0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "factory"    # Landroid/database/sqlite/SQLiteDatabase$CursorFactory;
    .param p4, "version"    # I

    .prologue
    .line 129
    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 130
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "storageDirectory"    # Ljava/lang/String;
    .param p4, "factory"    # Landroid/database/sqlite/SQLiteDatabase$CursorFactory;
    .param p5, "version"    # I

    .prologue
    const/4 v1, 0x0

    .line 95
    invoke-direct {p0, p1, p2, p4, p5}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 67
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    .line 68
    iput-boolean v1, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mIsInitializing:Z

    .line 76
    iput v1, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mForcedUpgradeVersion:I

    .line 97
    const/4 v0, 0x1

    if-ge p5, v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Version must be >= 1, was "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 98
    :cond_0
    if-nez p2, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Database name cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 100
    :cond_1
    iput-object p1, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mContext:Landroid/content/Context;

    .line 101
    iput-object p2, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mName:Ljava/lang/String;

    .line 102
    iput-object p4, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mFactory:Landroid/database/sqlite/SQLiteDatabase$CursorFactory;

    .line 103
    iput p5, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mNewVersion:I

    .line 105
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "databases/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mAssetPath:Ljava/lang/String;

    .line 106
    if-eqz p3, :cond_2

    .line 107
    iput-object p3, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mDatabasePath:Ljava/lang/String;

    .line 111
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "databases/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_upgrade_%s-%s.sql"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mUpgradePathFormat:Ljava/lang/String;

    .line 112
    return-void

    .line 109
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->dataDir:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/databases"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mDatabasePath:Ljava/lang/String;

    goto :goto_0
.end method

.method private copyDatabaseFromAssets()V
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper$SQLiteAssetException;
        }
    .end annotation

    .prologue
    .line 418
    sget-object v10, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->TAG:Ljava/lang/String;

    const-string v11, "copying database from assets..."

    invoke-static {v10, v11}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 420
    iget-object v7, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mAssetPath:Ljava/lang/String;

    .line 421
    .local v7, "path":Ljava/lang/String;
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v11, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mDatabasePath:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "/"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mName:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 423
    .local v0, "dest":Ljava/lang/String;
    const/4 v6, 0x0

    .line 427
    .local v6, "isZip":Z
    :try_start_0
    iget-object v10, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v10

    invoke-virtual {v10, v7}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v5

    .line 446
    .local v5, "is":Ljava/io/InputStream;
    :goto_0
    :try_start_1
    new-instance v4, Ljava/io/File;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v11, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mDatabasePath:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "/"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v4, v10}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 447
    .local v4, "f":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v10

    if-nez v10, :cond_0

    invoke-virtual {v4}, Ljava/io/File;->mkdir()Z

    .line 448
    :cond_0
    if-eqz v6, :cond_2

    .line 449
    invoke-static {v5}, Lcom/readystatesoftware/sqliteasset/Utils;->getFileFromZip(Ljava/io/InputStream;)Ljava/util/zip/ZipInputStream;

    move-result-object v9

    .line 450
    .local v9, "zis":Ljava/util/zip/ZipInputStream;
    if-nez v9, :cond_1

    .line 451
    new-instance v10, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper$SQLiteAssetException;

    const-string v11, "Archive is missing a SQLite database file"

    invoke-direct {v10, v11}, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper$SQLiteAssetException;-><init>(Ljava/lang/String;)V

    throw v10
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 460
    .end local v4    # "f":Ljava/io/File;
    .end local v9    # "zis":Ljava/util/zip/ZipInputStream;
    :catch_0
    move-exception v1

    .line 461
    .local v1, "e":Ljava/io/IOException;
    new-instance v8, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper$SQLiteAssetException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Unable to write "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " to data directory"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v8, v10}, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper$SQLiteAssetException;-><init>(Ljava/lang/String;)V

    .line 462
    .local v8, "se":Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper$SQLiteAssetException;
    invoke-virtual {v1}, Ljava/io/IOException;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v10

    invoke-virtual {v8, v10}, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper$SQLiteAssetException;->setStackTrace([Ljava/lang/StackTraceElement;)V

    .line 463
    throw v8

    .line 428
    .end local v1    # "e":Ljava/io/IOException;
    .end local v5    # "is":Ljava/io/InputStream;
    .end local v8    # "se":Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper$SQLiteAssetException;
    :catch_1
    move-exception v1

    .line 431
    .restart local v1    # "e":Ljava/io/IOException;
    :try_start_2
    iget-object v10, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v10

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ".zip"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    move-result-object v5

    .line 432
    .restart local v5    # "is":Ljava/io/InputStream;
    const/4 v6, 0x1

    goto :goto_0

    .line 433
    .end local v5    # "is":Ljava/io/InputStream;
    :catch_2
    move-exception v2

    .line 436
    .local v2, "e2":Ljava/io/IOException;
    :try_start_3
    iget-object v10, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v10

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ".gz"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3

    move-result-object v5

    .restart local v5    # "is":Ljava/io/InputStream;
    goto/16 :goto_0

    .line 437
    .end local v5    # "is":Ljava/io/InputStream;
    :catch_3
    move-exception v3

    .line 438
    .local v3, "e3":Ljava/io/IOException;
    new-instance v8, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper$SQLiteAssetException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Missing "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mAssetPath:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " file (or .zip, .gz archive) in assets, or target folder not writable"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v8, v10}, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper$SQLiteAssetException;-><init>(Ljava/lang/String;)V

    .line 439
    .restart local v8    # "se":Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper$SQLiteAssetException;
    invoke-virtual {v3}, Ljava/io/IOException;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v10

    invoke-virtual {v8, v10}, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper$SQLiteAssetException;->setStackTrace([Ljava/lang/StackTraceElement;)V

    .line 440
    throw v8

    .line 453
    .end local v1    # "e":Ljava/io/IOException;
    .end local v2    # "e2":Ljava/io/IOException;
    .end local v3    # "e3":Ljava/io/IOException;
    .end local v8    # "se":Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper$SQLiteAssetException;
    .restart local v4    # "f":Ljava/io/File;
    .restart local v5    # "is":Ljava/io/InputStream;
    .restart local v9    # "zis":Ljava/util/zip/ZipInputStream;
    :cond_1
    :try_start_4
    new-instance v10, Ljava/io/FileOutputStream;

    invoke-direct {v10, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-static {v9, v10}, Lcom/readystatesoftware/sqliteasset/Utils;->writeExtractedFileToDisk(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 458
    .end local v9    # "zis":Ljava/util/zip/ZipInputStream;
    :goto_1
    sget-object v10, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->TAG:Ljava/lang/String;

    const-string v11, "database copy complete"

    invoke-static {v10, v11}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 465
    return-void

    .line 455
    :cond_2
    new-instance v10, Ljava/io/FileOutputStream;

    invoke-direct {v10, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-static {v5, v10}, Lcom/readystatesoftware/sqliteasset/Utils;->writeExtractedFileToDisk(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_1
.end method

.method private createOrOpenDatabase(Z)Landroid/database/sqlite/SQLiteDatabase;
    .locals 5
    .param p1, "force"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper$SQLiteAssetException;
        }
    .end annotation

    .prologue
    .line 383
    const/4 v0, 0x0

    .line 384
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    new-instance v2, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mDatabasePath:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 385
    .local v2, "file":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 386
    invoke-direct {p0}, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->returnDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 390
    :cond_0
    if-eqz v0, :cond_2

    .line 392
    if-eqz p1, :cond_1

    .line 393
    sget-object v3, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->TAG:Ljava/lang/String;

    const-string v4, "forcing database upgrade!"

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 394
    invoke-direct {p0}, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->copyDatabaseFromAssets()V

    .line 395
    invoke-direct {p0}, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->returnDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    :cond_1
    move-object v1, v0

    .line 402
    .end local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    :goto_0
    return-object v1

    .line 400
    .end local v1    # "db":Landroid/database/sqlite/SQLiteDatabase;
    .restart local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    :cond_2
    invoke-direct {p0}, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->copyDatabaseFromAssets()V

    .line 401
    invoke-direct {p0}, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->returnDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    move-object v1, v0

    .line 402
    .end local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    .restart local v1    # "db":Landroid/database/sqlite/SQLiteDatabase;
    goto :goto_0
.end method

.method private getUpgradeFilePaths(IIILjava/util/ArrayList;)V
    .locals 8
    .param p1, "baseVersion"    # I
    .param p2, "start"    # I
    .param p3, "end"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(III",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 482
    .local p4, "paths":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-direct {p0, p2, p3}, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->getUpgradeSQLStream(II)Ljava/io/InputStream;

    move-result-object v2

    .line 483
    .local v2, "is":Ljava/io/InputStream;
    if-eqz v2, :cond_0

    .line 484
    iget-object v4, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mUpgradePathFormat:Ljava/lang/String;

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 485
    .local v3, "path":Ljava/lang/String;
    invoke-virtual {p4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 487
    add-int/lit8 v0, p2, -0x1

    .line 488
    .local v0, "a":I
    move v1, p2

    .line 489
    .local v1, "b":I
    const/4 v2, 0x0

    .line 495
    .end local v3    # "path":Ljava/lang/String;
    :goto_0
    if-ge v0, p1, :cond_1

    .line 501
    :goto_1
    return-void

    .line 491
    .end local v0    # "a":I
    .end local v1    # "b":I
    :cond_0
    add-int/lit8 v0, p2, -0x1

    .line 492
    .restart local v0    # "a":I
    move v1, p3

    .restart local v1    # "b":I
    goto :goto_0

    .line 498
    :cond_1
    invoke-direct {p0, p1, v0, v1, p4}, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->getUpgradeFilePaths(IIILjava/util/ArrayList;)V

    goto :goto_1
.end method

.method private getUpgradeSQLStream(II)Ljava/io/InputStream;
    .locals 6
    .param p1, "oldVersion"    # I
    .param p2, "newVersion"    # I

    .prologue
    .line 468
    iget-object v2, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mUpgradePathFormat:Ljava/lang/String;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 470
    .local v1, "path":Ljava/lang/String;
    :try_start_0
    iget-object v2, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 473
    :goto_0
    return-object v2

    .line 471
    :catch_0
    move-exception v0

    .line 472
    .local v0, "e":Ljava/io/IOException;
    sget-object v2, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "missing database upgrade script: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 473
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private returnDatabase()Landroid/database/sqlite/SQLiteDatabase;
    .locals 5

    .prologue
    .line 408
    :try_start_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mDatabasePath:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mFactory:Landroid/database/sqlite/SQLiteDatabase$CursorFactory;

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->openDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 409
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    sget-object v2, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "successfully opened database "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 413
    .end local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    :goto_0
    return-object v0

    .line 411
    :catch_0
    move-exception v1

    .line 412
    .local v1, "e":Landroid/database/sqlite/SQLiteException;
    sget-object v2, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "could not open database "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " - "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 413
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public declared-synchronized close()V
    .locals 2

    .prologue
    .line 285
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mIsInitializing:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Closed during initialization"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 287
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 288
    iget-object v0, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 289
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 291
    :cond_1
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    .locals 6

    .prologue
    .line 245
    monitor-enter p0

    :try_start_0
    iget-object v3, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 246
    iget-object v3, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 276
    :cond_0
    :goto_0
    monitor-exit p0

    return-object v3

    .line 249
    :cond_1
    :try_start_1
    iget-boolean v3, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mIsInitializing:Z

    if-eqz v3, :cond_2

    .line 250
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "getReadableDatabase called recursively"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 245
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3

    .line 254
    :cond_2
    :try_start_2
    invoke-virtual {p0}, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    :try_end_2
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v3

    goto :goto_0

    .line 255
    :catch_0
    move-exception v1

    .line 256
    .local v1, "e":Landroid/database/sqlite/SQLiteException;
    :try_start_3
    iget-object v3, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mName:Ljava/lang/String;

    if-nez v3, :cond_3

    throw v1

    .line 257
    :cond_3
    sget-object v3, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Couldn\'t open "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " for writing (will try read-only):"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 260
    const/4 v0, 0x0

    .line 262
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    const/4 v3, 0x1

    :try_start_4
    iput-boolean v3, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mIsInitializing:Z

    .line 263
    iget-object v3, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mContext:Landroid/content/Context;

    iget-object v4, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    .line 264
    .local v2, "path":Ljava/lang/String;
    iget-object v3, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mFactory:Landroid/database/sqlite/SQLiteDatabase$CursorFactory;

    const/4 v4, 0x1

    invoke-static {v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->openDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 265
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->getVersion()I

    move-result v3

    iget v4, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mNewVersion:I

    if-eq v3, v4, :cond_5

    .line 266
    new-instance v3, Landroid/database/sqlite/SQLiteException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Can\'t upgrade read-only database from version "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->getVersion()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " to "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mNewVersion:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/database/sqlite/SQLiteException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 275
    .end local v2    # "path":Ljava/lang/String;
    :catchall_1
    move-exception v3

    const/4 v4, 0x0

    :try_start_5
    iput-boolean v4, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mIsInitializing:Z

    .line 276
    if-eqz v0, :cond_4

    iget-object v4, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    if-eq v0, v4, :cond_4

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    :cond_4
    throw v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 270
    .restart local v2    # "path":Ljava/lang/String;
    :cond_5
    :try_start_6
    invoke-virtual {p0, v0}, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->onOpen(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 271
    sget-object v3, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Opened "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " in read-only mode"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 272
    iput-object v0, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    .line 273
    iget-object v3, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 275
    const/4 v4, 0x0

    :try_start_7
    iput-boolean v4, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mIsInitializing:Z

    .line 276
    if-eqz v0, :cond_0

    iget-object v4, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    if-eq v0, v4, :cond_0

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto/16 :goto_0
.end method

.method public declared-synchronized getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    .locals 6

    .prologue
    .line 152
    monitor-enter p0

    :try_start_0
    iget-object v3, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->isReadOnly()Z

    move-result v3

    if-nez v3, :cond_1

    .line 153
    iget-object v0, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 219
    :cond_0
    :goto_0
    monitor-exit p0

    return-object v0

    .line 156
    :cond_1
    :try_start_1
    iget-boolean v3, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mIsInitializing:Z

    if-eqz v3, :cond_2

    .line 157
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "getWritableDatabase called recursively"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 152
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3

    .line 166
    :cond_2
    const/4 v1, 0x0

    .line 167
    .local v1, "success":Z
    const/4 v0, 0x0

    .line 170
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    const/4 v3, 0x1

    :try_start_2
    iput-boolean v3, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mIsInitializing:Z

    .line 176
    const/4 v3, 0x0

    invoke-direct {p0, v3}, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->createOrOpenDatabase(Z)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 178
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->getVersion()I

    move-result v2

    .line 181
    .local v2, "version":I
    if-eqz v2, :cond_3

    iget v3, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mForcedUpgradeVersion:I

    if-ge v2, v3, :cond_3

    .line 182
    const/4 v3, 0x1

    invoke-direct {p0, v3}, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->createOrOpenDatabase(Z)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 183
    iget v3, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mNewVersion:I

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->setVersion(I)V

    .line 184
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->getVersion()I

    move-result v2

    .line 187
    :cond_3
    iget v3, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mNewVersion:I

    if-eq v2, v3, :cond_4

    .line 188
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 190
    if-nez v2, :cond_6

    .line 191
    :try_start_3
    invoke-virtual {p0, v0}, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->onCreate(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 199
    :goto_1
    iget v3, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mNewVersion:I

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->setVersion(I)V

    .line 200
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 202
    :try_start_4
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 206
    :cond_4
    invoke-virtual {p0, v0}, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->onOpen(Landroid/database/sqlite/SQLiteDatabase;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 207
    const/4 v1, 0x1

    .line 210
    const/4 v3, 0x0

    :try_start_5
    iput-boolean v3, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mIsInitializing:Z

    .line 211
    if-eqz v1, :cond_a

    .line 212
    iget-object v3, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    if-eqz v3, :cond_5

    .line 213
    :try_start_6
    iget-object v3, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 216
    :cond_5
    :goto_2
    :try_start_7
    iput-object v0, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_0

    .line 193
    :cond_6
    :try_start_8
    iget v3, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mNewVersion:I

    if-le v2, v3, :cond_7

    .line 194
    sget-object v3, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Can\'t downgrade read-only database from version "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " to "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mNewVersion:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 197
    :cond_7
    iget v3, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mNewVersion:I

    invoke-virtual {p0, v0, v2, v3}, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    goto :goto_1

    .line 202
    :catchall_1
    move-exception v3

    :try_start_9
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v3
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 210
    .end local v2    # "version":I
    :catchall_2
    move-exception v3

    const/4 v4, 0x0

    :try_start_a
    iput-boolean v4, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mIsInitializing:Z

    .line 211
    if-eqz v1, :cond_b

    .line 212
    iget-object v4, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    if-eqz v4, :cond_8

    .line 213
    :try_start_b
    iget-object v4, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_0
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    .line 216
    :cond_8
    :goto_3
    :try_start_c
    iput-object v0, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    .line 219
    :cond_9
    :goto_4
    throw v3

    .restart local v2    # "version":I
    :cond_a
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    goto/16 :goto_0

    .end local v2    # "version":I
    :cond_b
    if-eqz v0, :cond_9

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    goto :goto_4

    .line 213
    :catch_0
    move-exception v4

    goto :goto_3

    .restart local v2    # "version":I
    :catch_1
    move-exception v3

    goto :goto_2
.end method

.method public final onConfigure(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 296
    return-void
.end method

.method public final onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 302
    return-void
.end method

.method public final onDowngrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 0
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "oldVersion"    # I
    .param p3, "newVersion"    # I

    .prologue
    .line 344
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 12
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "oldVersion"    # I
    .param p3, "newVersion"    # I

    .prologue
    .line 307
    sget-object v9, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Upgrading database "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mName:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " from version "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " to "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "..."

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 309
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 310
    .local v7, "paths":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    add-int/lit8 v9, p3, -0x1

    invoke-direct {p0, p2, v9, p3, v7}, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->getUpgradeFilePaths(IIILjava/util/ArrayList;)V

    .line 312
    invoke-virtual {v7}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_0

    .line 313
    sget-object v9, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "no upgrade script path from "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " to "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 314
    new-instance v9, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper$SQLiteAssetException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "no upgrade script path from "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " to "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper$SQLiteAssetException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 317
    :cond_0
    new-instance v9, Lcom/readystatesoftware/sqliteasset/VersionComparator;

    invoke-direct {v9}, Lcom/readystatesoftware/sqliteasset/VersionComparator;-><init>()V

    invoke-static {v7, v9}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 318
    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 320
    .local v6, "path":Ljava/lang/String;
    :try_start_0
    sget-object v9, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "processing upgrade: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 321
    iget-object v9, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v9}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v9

    invoke-virtual {v9, v6}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v5

    .line 322
    .local v5, "is":Ljava/io/InputStream;
    invoke-static {v5}, Lcom/readystatesoftware/sqliteasset/Utils;->convertStreamToString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v8

    .line 323
    .local v8, "sql":Ljava/lang/String;
    if-eqz v8, :cond_1

    .line 324
    const/16 v9, 0x3b

    invoke-static {v8, v9}, Lcom/readystatesoftware/sqliteasset/Utils;->splitSqlScript(Ljava/lang/String;C)Ljava/util/List;

    move-result-object v1

    .line 325
    .local v1, "cmds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 327
    .local v0, "cmd":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    if-lez v9, :cond_2

    .line 328
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 332
    .end local v0    # "cmd":Ljava/lang/String;
    .end local v1    # "cmds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v4    # "i$":Ljava/util/Iterator;
    .end local v5    # "is":Ljava/io/InputStream;
    .end local v8    # "sql":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 333
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 337
    .end local v2    # "e":Ljava/io/IOException;
    .end local v6    # "path":Ljava/lang/String;
    :cond_3
    sget-object v9, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Successfully upgraded database "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mName:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " from version "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " to "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 339
    return-void
.end method

.method public setForcedUpgrade()V
    .locals 1

    .prologue
    .line 376
    iget v0, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mNewVersion:I

    invoke-virtual {p0, v0}, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->setForcedUpgrade(I)V

    .line 377
    return-void
.end method

.method public setForcedUpgrade(I)V
    .locals 0
    .param p1, "version"    # I

    .prologue
    .line 368
    iput p1, p0, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->mForcedUpgradeVersion:I

    .line 369
    return-void
.end method

.method public setForcedUpgradeVersion(I)V
    .locals 0
    .param p1, "version"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 357
    invoke-virtual {p0, p1}, Lcom/readystatesoftware/sqliteasset/SQLiteAssetHelper;->setForcedUpgrade(I)V

    .line 358
    return-void
.end method
