.class public Lorg/thecongers/mtpms/UserSettingActivity$UserSettingActivityFragment;
.super Landroid/preference/PreferenceFragment;
.source "UserSettingActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/thecongers/mtpms/UserSettingActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "UserSettingActivityFragment"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Landroid/preference/PreferenceFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 41
    invoke-super {p0, p1}, Landroid/preference/PreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 42
    const/high16 v2, 0x7f050000

    invoke-virtual {p0, v2}, Lorg/thecongers/mtpms/UserSettingActivity$UserSettingActivityFragment;->addPreferencesFromResource(I)V

    .line 45
    sget-boolean v2, Lorg/thecongers/mtpms/MainActivity;->hasSensor:Z

    if-nez v2, :cond_0

    .line 46
    invoke-virtual {p0}, Lorg/thecongers/mtpms/UserSettingActivity$UserSettingActivityFragment;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v2

    const-string v3, "prefAutoNightMode"

    invoke-virtual {v2, v3}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 49
    :cond_0
    const-string v2, "prefFrontID"

    invoke-virtual {p0, v2}, Lorg/thecongers/mtpms/UserSettingActivity$UserSettingActivityFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/ListPreference;

    .line 50
    .local v0, "listFrontIDPreference":Landroid/preference/ListPreference;
    const-string v2, "prefRearID"

    invoke-virtual {p0, v2}, Lorg/thecongers/mtpms/UserSettingActivity$UserSettingActivityFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Landroid/preference/ListPreference;

    .line 51
    .local v1, "listRearIDPreference":Landroid/preference/ListPreference;
    invoke-static {v0}, Lorg/thecongers/mtpms/UserSettingActivity;->access$000(Landroid/preference/ListPreference;)V

    .line 52
    invoke-static {v1}, Lorg/thecongers/mtpms/UserSettingActivity;->access$000(Landroid/preference/ListPreference;)V

    .line 53
    return-void
.end method
