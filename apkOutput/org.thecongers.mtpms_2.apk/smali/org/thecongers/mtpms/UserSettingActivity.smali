.class public Lorg/thecongers/mtpms/UserSettingActivity;
.super Landroid/preference/PreferenceActivity;
.source "UserSettingActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/thecongers/mtpms/UserSettingActivity$UserSettingActivityFragment;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    .line 36
    return-void
.end method

.method static synthetic access$000(Landroid/preference/ListPreference;)V
    .locals 0
    .param p0, "x0"    # Landroid/preference/ListPreference;

    .prologue
    .line 27
    invoke-static {p0}, Lorg/thecongers/mtpms/UserSettingActivity;->setListPreferenceData(Landroid/preference/ListPreference;)V

    return-void
.end method

.method private static setListPreferenceData(Landroid/preference/ListPreference;)V
    .locals 7
    .param p0, "lp"    # Landroid/preference/ListPreference;

    .prologue
    const/4 v6, 0x1

    .line 59
    sget-object v3, Lorg/thecongers/mtpms/MainActivity;->sensorDB:Lorg/thecongers/mtpms/SensorIdDatabase;

    .line 61
    .local v3, "sensorDB":Lorg/thecongers/mtpms/SensorIdDatabase;
    const/4 v0, 0x0

    .line 62
    .local v0, "entries":[Ljava/lang/CharSequence;
    const/4 v1, 0x0

    .line 64
    .local v1, "entryValues":[Ljava/lang/CharSequence;
    invoke-virtual {v3}, Lorg/thecongers/mtpms/SensorIdDatabase;->getAllSensorIDs()Landroid/database/Cursor;

    move-result-object v4

    .line 65
    .local v4, "sensorIDs":Landroid/database/Cursor;
    if-eqz v4, :cond_1

    .line 66
    invoke-interface {v4}, Landroid/database/Cursor;->getCount()I

    move-result v5

    new-array v0, v5, [Ljava/lang/CharSequence;

    .line 67
    invoke-interface {v4}, Landroid/database/Cursor;->getCount()I

    move-result v5

    new-array v1, v5, [Ljava/lang/CharSequence;

    .line 68
    invoke-interface {v4}, Landroid/database/Cursor;->moveToFirst()Z

    .line 69
    const/4 v2, 0x0

    .line 70
    .local v2, "position":I
    :goto_0
    invoke-interface {v4}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v5

    if-nez v5, :cond_0

    .line 71
    invoke-interface {v4, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v0, v2

    .line 72
    invoke-interface {v4, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v1, v2

    .line 73
    invoke-interface {v4}, Landroid/database/Cursor;->moveToNext()Z

    .line 74
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 76
    :cond_0
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 79
    .end local v2    # "position":I
    :cond_1
    invoke-virtual {p0, v0}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 80
    invoke-virtual {p0, v1}, Landroid/preference/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    .line 81
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 31
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 32
    invoke-virtual {p0}, Lorg/thecongers/mtpms/UserSettingActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v0

    const v1, 0x1020002

    new-instance v2, Lorg/thecongers/mtpms/UserSettingActivity$UserSettingActivityFragment;

    invoke-direct {v2}, Lorg/thecongers/mtpms/UserSettingActivity$UserSettingActivityFragment;-><init>()V

    invoke-virtual {v0, v1, v2}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentTransaction;->commit()I

    .line 34
    return-void
.end method
