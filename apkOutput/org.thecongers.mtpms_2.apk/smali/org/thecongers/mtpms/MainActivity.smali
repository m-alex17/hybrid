.class public Lorg/thecongers/mtpms/MainActivity;
.super Landroid/support/v7/app/ActionBarActivity;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/thecongers/mtpms/MainActivity$ConnectedThread;,
        Lorg/thecongers/mtpms/MainActivity$ConnectThread;
    }
.end annotation


# static fields
.field private static final MY_UUID:Ljava/util/UUID;

.field private static final SETTINGS_RESULT:I = 0x1

.field private static final TAG:Ljava/lang/String; = "mTPMS"

.field static hasSensor:Z

.field static sensorDB:Lorg/thecongers/mtpms/SensorIdDatabase;


# instance fields
.field private final RECEIVE_MESSAGE:I

.field private address:Ljava/lang/String;

.field private background:Landroid/graphics/drawable/Drawable;

.field private backgroundDark:Landroid/graphics/drawable/Drawable;

.field private btAdapter:Landroid/bluetooth/BluetoothAdapter;

.field private btConnectThread:Lorg/thecongers/mtpms/MainActivity$ConnectThread;

.field private final btReceiver:Landroid/content/BroadcastReceiver;

.field private darkTimer:J

.field private frontStatus:I

.field private handler:Landroid/os/Handler;

.field private itsDark:Z

.field private layoutFront:Landroid/widget/LinearLayout;

.field private layoutRear:Landroid/widget/LinearLayout;

.field private final lightSensorEventListener:Landroid/hardware/SensorEventListener;

.field private lightTimer:J

.field private logger:Lorg/thecongers/mtpms/LogData;

.field private notificationManager:Landroid/app/NotificationManager;

.field private rearStatus:I

.field private redBackground:Landroid/graphics/drawable/Drawable;

.field private redBackgroundDark:Landroid/graphics/drawable/Drawable;

.field private root:Landroid/view/View;

.field private sharedPrefs:Landroid/content/SharedPreferences;

.field private txtFrontPressure:Landroid/widget/TextView;

.field private txtFrontTemperature:Landroid/widget/TextView;

.field private txtFrontVoltage:Landroid/widget/TextView;

.field private txtOutBackground:Landroid/graphics/drawable/Drawable;

.field private txtOutBackgroundDark:Landroid/graphics/drawable/Drawable;

.field private txtOutput:Landroid/widget/TextView;

.field private txtRearPressure:Landroid/widget/TextView;

.field private txtRearTemperature:Landroid/widget/TextView;

.field private txtRearVoltage:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 90
    const-string v0, "00001101-0000-1000-8000-00805F9B34FB"

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    sput-object v0, Lorg/thecongers/mtpms/MainActivity;->MY_UUID:Ljava/util/UUID;

    .line 100
    const/4 v0, 0x0

    sput-boolean v0, Lorg/thecongers/mtpms/MainActivity;->hasSensor:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 6

    .prologue
    const-wide/16 v4, 0x0

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 65
    invoke-direct {p0}, Landroid/support/v7/app/ActionBarActivity;-><init>()V

    .line 88
    iput-object v2, p0, Lorg/thecongers/mtpms/MainActivity;->btAdapter:Landroid/bluetooth/BluetoothAdapter;

    .line 92
    const/4 v0, 0x1

    iput v0, p0, Lorg/thecongers/mtpms/MainActivity;->RECEIVE_MESSAGE:I

    .line 95
    iput v1, p0, Lorg/thecongers/mtpms/MainActivity;->frontStatus:I

    .line 96
    iput v1, p0, Lorg/thecongers/mtpms/MainActivity;->rearStatus:I

    .line 97
    iput-boolean v1, p0, Lorg/thecongers/mtpms/MainActivity;->itsDark:Z

    .line 98
    iput-wide v4, p0, Lorg/thecongers/mtpms/MainActivity;->darkTimer:J

    .line 99
    iput-wide v4, p0, Lorg/thecongers/mtpms/MainActivity;->lightTimer:J

    .line 102
    iput-object v2, p0, Lorg/thecongers/mtpms/MainActivity;->logger:Lorg/thecongers/mtpms/LogData;

    .line 656
    new-instance v0, Lorg/thecongers/mtpms/MainActivity$2;

    invoke-direct {v0, p0}, Lorg/thecongers/mtpms/MainActivity$2;-><init>(Lorg/thecongers/mtpms/MainActivity;)V

    iput-object v0, p0, Lorg/thecongers/mtpms/MainActivity;->btReceiver:Landroid/content/BroadcastReceiver;

    .line 857
    new-instance v0, Lorg/thecongers/mtpms/MainActivity$3;

    invoke-direct {v0, p0}, Lorg/thecongers/mtpms/MainActivity$3;-><init>(Lorg/thecongers/mtpms/MainActivity;)V

    iput-object v0, p0, Lorg/thecongers/mtpms/MainActivity;->lightSensorEventListener:Landroid/hardware/SensorEventListener;

    return-void
.end method

.method private Notify(Ljava/lang/String;)V
    .locals 12
    .param p1, "notificationMessage"    # Ljava/lang/String;

    .prologue
    const/16 v11, 0x5dc

    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 816
    const-string v6, "notification"

    invoke-virtual {p0, v6}, Lorg/thecongers/mtpms/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/app/NotificationManager;

    iput-object v6, p0, Lorg/thecongers/mtpms/MainActivity;->notificationManager:Landroid/app/NotificationManager;

    .line 818
    new-instance v2, Landroid/content/Intent;

    const-class v6, Lorg/thecongers/mtpms/MainActivity;

    invoke-direct {v2, p0, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 819
    .local v2, "intent":Landroid/content/Intent;
    const-string v6, "android.intent.action.MAIN"

    invoke-virtual {v2, v6}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 820
    const-string v6, "android.intent.category.LAUNCHER"

    invoke-virtual {v2, v6}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 822
    invoke-static {p0, v9, v2, v9}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v4

    .line 825
    .local v4, "pendingIntent":Landroid/app/PendingIntent;
    iget-object v6, p0, Lorg/thecongers/mtpms/MainActivity;->sharedPrefs:Landroid/content/SharedPreferences;

    const-string v7, "prefsound"

    const-string v8, "content://settings/system/notification_sound"

    invoke-interface {v6, v7, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 826
    .local v0, "alertURI":Ljava/lang/String;
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    .line 828
    .local v5, "soundURI":Landroid/net/Uri;
    new-instance v1, Landroid/support/v4/app/NotificationCompat$Builder;

    invoke-direct {v1, p0}, Landroid/support/v4/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;)V

    .line 829
    .local v1, "builder":Landroid/support/v4/app/NotificationCompat$Builder;
    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f0d0023

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v6

    invoke-virtual {v6, p1}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v6

    const v7, 0x7f020034

    invoke-virtual {v6, v7}, Landroid/support/v4/app/NotificationCompat$Builder;->setSmallIcon(I)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v6

    invoke-virtual {v6, v9}, Landroid/support/v4/app/NotificationCompat$Builder;->setAutoCancel(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v6

    invoke-virtual {v6, v10}, Landroid/support/v4/app/NotificationCompat$Builder;->setOnlyAlertOnce(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v6

    const/4 v7, 0x2

    invoke-virtual {v6, v7}, Landroid/support/v4/app/NotificationCompat$Builder;->setPriority(I)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v6

    invoke-virtual {v6, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 837
    iget-object v6, p0, Lorg/thecongers/mtpms/MainActivity;->sharedPrefs:Landroid/content/SharedPreferences;

    const-string v7, "prefNotificationLED"

    invoke-interface {v6, v7, v10}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 838
    const/high16 v6, -0x10000

    invoke-virtual {v1, v6, v11, v11}, Landroid/support/v4/app/NotificationCompat$Builder;->setLights(III)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 841
    :cond_0
    iget-object v6, p0, Lorg/thecongers/mtpms/MainActivity;->sharedPrefs:Landroid/content/SharedPreferences;

    const-string v7, "prefNotificationSound"

    invoke-interface {v6, v7, v10}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 842
    invoke-virtual {v1, v5}, Landroid/support/v4/app/NotificationCompat$Builder;->setSound(Landroid/net/Uri;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 844
    :cond_1
    invoke-virtual {v1}, Landroid/support/v4/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v3

    .line 846
    .local v3, "notification":Landroid/app/Notification;
    iget-object v6, p0, Lorg/thecongers/mtpms/MainActivity;->sharedPrefs:Landroid/content/SharedPreferences;

    const-string v7, "prefNotificationVibrate"

    invoke-interface {v6, v7, v9}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 847
    iget v6, v3, Landroid/app/Notification;->defaults:I

    or-int/lit8 v6, v6, 0x2

    iput v6, v3, Landroid/app/Notification;->defaults:I

    .line 850
    :cond_2
    iget v6, v3, Landroid/app/Notification;->flags:I

    or-int/lit8 v6, v6, 0x4

    iput v6, v3, Landroid/app/Notification;->flags:I

    .line 853
    iget-object v6, p0, Lorg/thecongers/mtpms/MainActivity;->notificationManager:Landroid/app/NotificationManager;

    invoke-virtual {v6, v9, v3}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 854
    return-void
.end method

.method static synthetic access$000(Lorg/thecongers/mtpms/MainActivity;)Landroid/content/SharedPreferences;
    .locals 1
    .param p0, "x0"    # Lorg/thecongers/mtpms/MainActivity;

    .prologue
    .line 65
    iget-object v0, p0, Lorg/thecongers/mtpms/MainActivity;->sharedPrefs:Landroid/content/SharedPreferences;

    return-object v0
.end method

.method static synthetic access$100(Lorg/thecongers/mtpms/MainActivity;)Lorg/thecongers/mtpms/LogData;
    .locals 1
    .param p0, "x0"    # Lorg/thecongers/mtpms/MainActivity;

    .prologue
    .line 65
    iget-object v0, p0, Lorg/thecongers/mtpms/MainActivity;->logger:Lorg/thecongers/mtpms/LogData;

    return-object v0
.end method

.method static synthetic access$1000(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lorg/thecongers/mtpms/MainActivity;

    .prologue
    .line 65
    iget-object v0, p0, Lorg/thecongers/mtpms/MainActivity;->txtOutput:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$102(Lorg/thecongers/mtpms/MainActivity;Lorg/thecongers/mtpms/LogData;)Lorg/thecongers/mtpms/LogData;
    .locals 0
    .param p0, "x0"    # Lorg/thecongers/mtpms/MainActivity;
    .param p1, "x1"    # Lorg/thecongers/mtpms/LogData;

    .prologue
    .line 65
    iput-object p1, p0, Lorg/thecongers/mtpms/MainActivity;->logger:Lorg/thecongers/mtpms/LogData;

    return-object p1
.end method

.method static synthetic access$1100(Lorg/thecongers/mtpms/MainActivity;)Landroid/app/NotificationManager;
    .locals 1
    .param p0, "x0"    # Lorg/thecongers/mtpms/MainActivity;

    .prologue
    .line 65
    iget-object v0, p0, Lorg/thecongers/mtpms/MainActivity;->notificationManager:Landroid/app/NotificationManager;

    return-object v0
.end method

.method static synthetic access$1200(Lorg/thecongers/mtpms/MainActivity;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lorg/thecongers/mtpms/MainActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 65
    invoke-direct {p0, p1}, Lorg/thecongers/mtpms/MainActivity;->Notify(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1300(Lorg/thecongers/mtpms/MainActivity;)Z
    .locals 1
    .param p0, "x0"    # Lorg/thecongers/mtpms/MainActivity;

    .prologue
    .line 65
    iget-boolean v0, p0, Lorg/thecongers/mtpms/MainActivity;->itsDark:Z

    return v0
.end method

.method static synthetic access$1302(Lorg/thecongers/mtpms/MainActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lorg/thecongers/mtpms/MainActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 65
    iput-boolean p1, p0, Lorg/thecongers/mtpms/MainActivity;->itsDark:Z

    return p1
.end method

.method static synthetic access$1400(Lorg/thecongers/mtpms/MainActivity;)Landroid/graphics/drawable/Drawable;
    .locals 1
    .param p0, "x0"    # Lorg/thecongers/mtpms/MainActivity;

    .prologue
    .line 65
    iget-object v0, p0, Lorg/thecongers/mtpms/MainActivity;->background:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method static synthetic access$1500(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/LinearLayout;
    .locals 1
    .param p0, "x0"    # Lorg/thecongers/mtpms/MainActivity;

    .prologue
    .line 65
    iget-object v0, p0, Lorg/thecongers/mtpms/MainActivity;->layoutFront:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method static synthetic access$1502(Lorg/thecongers/mtpms/MainActivity;Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;
    .locals 0
    .param p0, "x0"    # Lorg/thecongers/mtpms/MainActivity;
    .param p1, "x1"    # Landroid/widget/LinearLayout;

    .prologue
    .line 65
    iput-object p1, p0, Lorg/thecongers/mtpms/MainActivity;->layoutFront:Landroid/widget/LinearLayout;

    return-object p1
.end method

.method static synthetic access$1600(Lorg/thecongers/mtpms/MainActivity;)Landroid/graphics/drawable/Drawable;
    .locals 1
    .param p0, "x0"    # Lorg/thecongers/mtpms/MainActivity;

    .prologue
    .line 65
    iget-object v0, p0, Lorg/thecongers/mtpms/MainActivity;->redBackground:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method static synthetic access$1700(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/LinearLayout;
    .locals 1
    .param p0, "x0"    # Lorg/thecongers/mtpms/MainActivity;

    .prologue
    .line 65
    iget-object v0, p0, Lorg/thecongers/mtpms/MainActivity;->layoutRear:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method static synthetic access$1702(Lorg/thecongers/mtpms/MainActivity;Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;
    .locals 0
    .param p0, "x0"    # Lorg/thecongers/mtpms/MainActivity;
    .param p1, "x1"    # Landroid/widget/LinearLayout;

    .prologue
    .line 65
    iput-object p1, p0, Lorg/thecongers/mtpms/MainActivity;->layoutRear:Landroid/widget/LinearLayout;

    return-object p1
.end method

.method static synthetic access$1800(Lorg/thecongers/mtpms/MainActivity;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lorg/thecongers/mtpms/MainActivity;

    .prologue
    .line 65
    iget-object v0, p0, Lorg/thecongers/mtpms/MainActivity;->root:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$1900(Lorg/thecongers/mtpms/MainActivity;)Landroid/graphics/drawable/Drawable;
    .locals 1
    .param p0, "x0"    # Lorg/thecongers/mtpms/MainActivity;

    .prologue
    .line 65
    iget-object v0, p0, Lorg/thecongers/mtpms/MainActivity;->txtOutBackground:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method static synthetic access$200(Lorg/thecongers/mtpms/MainActivity;)I
    .locals 1
    .param p0, "x0"    # Lorg/thecongers/mtpms/MainActivity;

    .prologue
    .line 65
    iget v0, p0, Lorg/thecongers/mtpms/MainActivity;->frontStatus:I

    return v0
.end method

.method static synthetic access$2000(Lorg/thecongers/mtpms/MainActivity;)Landroid/graphics/drawable/Drawable;
    .locals 1
    .param p0, "x0"    # Lorg/thecongers/mtpms/MainActivity;

    .prologue
    .line 65
    iget-object v0, p0, Lorg/thecongers/mtpms/MainActivity;->backgroundDark:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method static synthetic access$202(Lorg/thecongers/mtpms/MainActivity;I)I
    .locals 0
    .param p0, "x0"    # Lorg/thecongers/mtpms/MainActivity;
    .param p1, "x1"    # I

    .prologue
    .line 65
    iput p1, p0, Lorg/thecongers/mtpms/MainActivity;->frontStatus:I

    return p1
.end method

.method static synthetic access$2100(Lorg/thecongers/mtpms/MainActivity;)Landroid/graphics/drawable/Drawable;
    .locals 1
    .param p0, "x0"    # Lorg/thecongers/mtpms/MainActivity;

    .prologue
    .line 65
    iget-object v0, p0, Lorg/thecongers/mtpms/MainActivity;->redBackgroundDark:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method static synthetic access$2200(Lorg/thecongers/mtpms/MainActivity;)Landroid/graphics/drawable/Drawable;
    .locals 1
    .param p0, "x0"    # Lorg/thecongers/mtpms/MainActivity;

    .prologue
    .line 65
    iget-object v0, p0, Lorg/thecongers/mtpms/MainActivity;->txtOutBackgroundDark:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method static synthetic access$2300(Lorg/thecongers/mtpms/MainActivity;)Z
    .locals 1
    .param p0, "x0"    # Lorg/thecongers/mtpms/MainActivity;

    .prologue
    .line 65
    invoke-direct {p0}, Lorg/thecongers/mtpms/MainActivity;->btConnect()Z

    move-result v0

    return v0
.end method

.method static synthetic access$2400(Lorg/thecongers/mtpms/MainActivity;Landroid/bluetooth/BluetoothDevice;)Landroid/bluetooth/BluetoothSocket;
    .locals 1
    .param p0, "x0"    # Lorg/thecongers/mtpms/MainActivity;
    .param p1, "x1"    # Landroid/bluetooth/BluetoothDevice;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 65
    invoke-direct {p0, p1}, Lorg/thecongers/mtpms/MainActivity;->createBluetoothSocket(Landroid/bluetooth/BluetoothDevice;)Landroid/bluetooth/BluetoothSocket;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$2500(Lorg/thecongers/mtpms/MainActivity;)Landroid/bluetooth/BluetoothAdapter;
    .locals 1
    .param p0, "x0"    # Lorg/thecongers/mtpms/MainActivity;

    .prologue
    .line 65
    iget-object v0, p0, Lorg/thecongers/mtpms/MainActivity;->btAdapter:Landroid/bluetooth/BluetoothAdapter;

    return-object v0
.end method

.method static synthetic access$2700(Lorg/thecongers/mtpms/MainActivity;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lorg/thecongers/mtpms/MainActivity;

    .prologue
    .line 65
    iget-object v0, p0, Lorg/thecongers/mtpms/MainActivity;->handler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$2800(Lorg/thecongers/mtpms/MainActivity;)Lorg/thecongers/mtpms/MainActivity$ConnectThread;
    .locals 1
    .param p0, "x0"    # Lorg/thecongers/mtpms/MainActivity;

    .prologue
    .line 65
    iget-object v0, p0, Lorg/thecongers/mtpms/MainActivity;->btConnectThread:Lorg/thecongers/mtpms/MainActivity$ConnectThread;

    return-object v0
.end method

.method static synthetic access$2900(Lorg/thecongers/mtpms/MainActivity;)J
    .locals 2
    .param p0, "x0"    # Lorg/thecongers/mtpms/MainActivity;

    .prologue
    .line 65
    iget-wide v0, p0, Lorg/thecongers/mtpms/MainActivity;->lightTimer:J

    return-wide v0
.end method

.method static synthetic access$2902(Lorg/thecongers/mtpms/MainActivity;J)J
    .locals 1
    .param p0, "x0"    # Lorg/thecongers/mtpms/MainActivity;
    .param p1, "x1"    # J

    .prologue
    .line 65
    iput-wide p1, p0, Lorg/thecongers/mtpms/MainActivity;->lightTimer:J

    return-wide p1
.end method

.method static synthetic access$300(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lorg/thecongers/mtpms/MainActivity;

    .prologue
    .line 65
    iget-object v0, p0, Lorg/thecongers/mtpms/MainActivity;->txtFrontPressure:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$3000(Lorg/thecongers/mtpms/MainActivity;)J
    .locals 2
    .param p0, "x0"    # Lorg/thecongers/mtpms/MainActivity;

    .prologue
    .line 65
    iget-wide v0, p0, Lorg/thecongers/mtpms/MainActivity;->darkTimer:J

    return-wide v0
.end method

.method static synthetic access$3002(Lorg/thecongers/mtpms/MainActivity;J)J
    .locals 1
    .param p0, "x0"    # Lorg/thecongers/mtpms/MainActivity;
    .param p1, "x1"    # J

    .prologue
    .line 65
    iput-wide p1, p0, Lorg/thecongers/mtpms/MainActivity;->darkTimer:J

    return-wide p1
.end method

.method static synthetic access$400(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lorg/thecongers/mtpms/MainActivity;

    .prologue
    .line 65
    iget-object v0, p0, Lorg/thecongers/mtpms/MainActivity;->txtFrontTemperature:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$500(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lorg/thecongers/mtpms/MainActivity;

    .prologue
    .line 65
    iget-object v0, p0, Lorg/thecongers/mtpms/MainActivity;->txtFrontVoltage:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$600(Lorg/thecongers/mtpms/MainActivity;)I
    .locals 1
    .param p0, "x0"    # Lorg/thecongers/mtpms/MainActivity;

    .prologue
    .line 65
    iget v0, p0, Lorg/thecongers/mtpms/MainActivity;->rearStatus:I

    return v0
.end method

.method static synthetic access$602(Lorg/thecongers/mtpms/MainActivity;I)I
    .locals 0
    .param p0, "x0"    # Lorg/thecongers/mtpms/MainActivity;
    .param p1, "x1"    # I

    .prologue
    .line 65
    iput p1, p0, Lorg/thecongers/mtpms/MainActivity;->rearStatus:I

    return p1
.end method

.method static synthetic access$700(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lorg/thecongers/mtpms/MainActivity;

    .prologue
    .line 65
    iget-object v0, p0, Lorg/thecongers/mtpms/MainActivity;->txtRearPressure:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$800(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lorg/thecongers/mtpms/MainActivity;

    .prologue
    .line 65
    iget-object v0, p0, Lorg/thecongers/mtpms/MainActivity;->txtRearTemperature:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$900(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lorg/thecongers/mtpms/MainActivity;

    .prologue
    .line 65
    iget-object v0, p0, Lorg/thecongers/mtpms/MainActivity;->txtRearVoltage:Landroid/widget/TextView;

    return-object v0
.end method

.method private btConnect()Z
    .locals 9

    .prologue
    const v8, 0x7f0d0041

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 606
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v5

    iput-object v5, p0, Lorg/thecongers/mtpms/MainActivity;->btAdapter:Landroid/bluetooth/BluetoothAdapter;

    .line 607
    invoke-direct {p0}, Lorg/thecongers/mtpms/MainActivity;->checkBTState()V

    .line 608
    iget-object v5, p0, Lorg/thecongers/mtpms/MainActivity;->btAdapter:Landroid/bluetooth/BluetoothAdapter;

    if-eqz v5, :cond_4

    .line 609
    iget-object v5, p0, Lorg/thecongers/mtpms/MainActivity;->btAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v5}, Landroid/bluetooth/BluetoothAdapter;->getBondedDevices()Ljava/util/Set;

    move-result-object v2

    .line 611
    .local v2, "pairedDevices":Ljava/util/Set;, "Ljava/util/Set<Landroid/bluetooth/BluetoothDevice;>;"
    invoke-interface {v2}, Ljava/util/Set;->size()I

    move-result v5

    if-lez v5, :cond_2

    .line 613
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/bluetooth/BluetoothDevice;

    .line 614
    .local v0, "device":Landroid/bluetooth/BluetoothDevice;
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "iTPMS"

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 615
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lorg/thecongers/mtpms/MainActivity;->address:Ljava/lang/String;

    .line 616
    const-string v5, "mTPMS"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Paired iTPMSystem found: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 619
    .end local v0    # "device":Landroid/bluetooth/BluetoothDevice;
    :cond_1
    iget-object v5, p0, Lorg/thecongers/mtpms/MainActivity;->address:Ljava/lang/String;

    if-nez v5, :cond_2

    .line 620
    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {p0, v5, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    .line 640
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "pairedDevices":Ljava/util/Set;, "Ljava/util/Set<Landroid/bluetooth/BluetoothDevice;>;"
    :goto_1
    return v3

    .line 626
    .restart local v2    # "pairedDevices":Ljava/util/Set;, "Ljava/util/Set<Landroid/bluetooth/BluetoothDevice;>;"
    :cond_2
    iget-object v5, p0, Lorg/thecongers/mtpms/MainActivity;->address:Ljava/lang/String;

    if-eqz v5, :cond_3

    .line 628
    iget-object v3, p0, Lorg/thecongers/mtpms/MainActivity;->btAdapter:Landroid/bluetooth/BluetoothAdapter;

    iget-object v5, p0, Lorg/thecongers/mtpms/MainActivity;->address:Ljava/lang/String;

    invoke-virtual {v3, v5}, Landroid/bluetooth/BluetoothAdapter;->getRemoteDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    .line 629
    .restart local v0    # "device":Landroid/bluetooth/BluetoothDevice;
    new-instance v3, Lorg/thecongers/mtpms/MainActivity$ConnectThread;

    invoke-direct {v3, p0, v0}, Lorg/thecongers/mtpms/MainActivity$ConnectThread;-><init>(Lorg/thecongers/mtpms/MainActivity;Landroid/bluetooth/BluetoothDevice;)V

    iput-object v3, p0, Lorg/thecongers/mtpms/MainActivity;->btConnectThread:Lorg/thecongers/mtpms/MainActivity$ConnectThread;

    .line 630
    iget-object v3, p0, Lorg/thecongers/mtpms/MainActivity;->btConnectThread:Lorg/thecongers/mtpms/MainActivity$ConnectThread;

    invoke-virtual {v3}, Lorg/thecongers/mtpms/MainActivity$ConnectThread;->start()V

    move v3, v4

    .line 637
    goto :goto_1

    .line 632
    .end local v0    # "device":Landroid/bluetooth/BluetoothDevice;
    :cond_3
    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {p0, v5, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    goto :goto_1

    .line 639
    .end local v2    # "pairedDevices":Ljava/util/Set;, "Ljava/util/Set<Landroid/bluetooth/BluetoothDevice;>;"
    :cond_4
    const-string v4, "mTPMS"

    const-string v5, "Bluetooth not supported"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method private checkBTState()V
    .locals 3

    .prologue
    .line 677
    iget-object v1, p0, Lorg/thecongers/mtpms/MainActivity;->btAdapter:Landroid/bluetooth/BluetoothAdapter;

    if-nez v1, :cond_0

    .line 678
    const-string v1, "mTPMS"

    const-string v2, "Bluetooth not supported"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 688
    :goto_0
    return-void

    .line 680
    :cond_0
    iget-object v1, p0, Lorg/thecongers/mtpms/MainActivity;->btAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 681
    const-string v1, "mTPMS"

    const-string v2, "Bluetooth is on"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 684
    :cond_1
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.bluetooth.adapter.action.REQUEST_ENABLE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 685
    .local v0, "enableBtIntent":Landroid/content/Intent;
    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lorg/thecongers/mtpms/MainActivity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0
.end method

.method private createBluetoothSocket(Landroid/bluetooth/BluetoothDevice;)Landroid/bluetooth/BluetoothSocket;
    .locals 7
    .param p1, "device"    # Landroid/bluetooth/BluetoothDevice;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 644
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xa

    if-lt v2, v3, :cond_0

    .line 646
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "createInsecureRfcommSocketToServiceRecord"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Ljava/util/UUID;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 647
    .local v1, "m":Ljava/lang/reflect/Method;
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    sget-object v4, Lorg/thecongers/mtpms/MainActivity;->MY_UUID:Ljava/util/UUID;

    aput-object v4, v2, v3

    invoke-virtual {v1, p1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/bluetooth/BluetoothSocket;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 652
    .end local v1    # "m":Ljava/lang/reflect/Method;
    :goto_0
    return-object v2

    .line 648
    :catch_0
    move-exception v0

    .line 649
    .local v0, "e":Ljava/lang/Exception;
    const-string v2, "mTPMS"

    const-string v3, "Could not create insecure RFComm Connection"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 652
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    sget-object v2, Lorg/thecongers/mtpms/MainActivity;->MY_UUID:Ljava/util/UUID;

    invoke-virtual {p1, v2}, Landroid/bluetooth/BluetoothDevice;->createRfcommSocketToServiceRecord(Ljava/util/UUID;)Landroid/bluetooth/BluetoothSocket;

    move-result-object v2

    goto :goto_0
.end method

.method private static readRawTextFile(Landroid/content/Context;I)Ljava/lang/String;
    .locals 7
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "resId"    # I

    .prologue
    .line 795
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6, p1}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v2

    .line 797
    .local v2, "inputStream":Ljava/io/InputStream;
    new-instance v3, Ljava/io/InputStreamReader;

    invoke-direct {v3, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 798
    .local v3, "inputreader":Ljava/io/InputStreamReader;
    new-instance v0, Ljava/io/BufferedReader;

    invoke-direct {v0, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 800
    .local v0, "buffreader":Ljava/io/BufferedReader;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 803
    .local v5, "text":Ljava/lang/StringBuilder;
    :goto_0
    :try_start_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .local v4, "line":Ljava/lang/String;
    if-eqz v4, :cond_0

    .line 804
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 805
    const/16 v6, 0xa

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 807
    .end local v4    # "line":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 808
    .local v1, "e":Ljava/io/IOException;
    const/4 v6, 0x0

    .line 810
    .end local v1    # "e":Ljava/io/IOException;
    :goto_1
    return-object v6

    .restart local v4    # "line":Ljava/lang/String;
    :cond_0
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_1
.end method

.method private updateUserSettings()V
    .locals 3

    .prologue
    .line 599
    iget-object v0, p0, Lorg/thecongers/mtpms/MainActivity;->sharedPrefs:Landroid/content/SharedPreferences;

    const-string v1, "prefDataLogging"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/thecongers/mtpms/MainActivity;->logger:Lorg/thecongers/mtpms/LogData;

    if-eqz v0, :cond_0

    .line 600
    iget-object v0, p0, Lorg/thecongers/mtpms/MainActivity;->logger:Lorg/thecongers/mtpms/LogData;

    invoke-virtual {v0}, Lorg/thecongers/mtpms/LogData;->shutdown()V

    .line 602
    :cond_0
    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 588
    invoke-super {p0, p1, p2, p3}, Landroid/support/v7/app/ActionBarActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 589
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 591
    invoke-direct {p0}, Lorg/thecongers/mtpms/MainActivity;->updateUserSettings()V

    .line 593
    :cond_0
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 12
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    const v11, 0x106000c

    const v10, 0x106000b

    .line 458
    invoke-super {p0, p1}, Landroid/support/v7/app/ActionBarActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 459
    const v7, 0x7f030017

    invoke-virtual {p0, v7}, Lorg/thecongers/mtpms/MainActivity;->setContentView(I)V

    .line 462
    const v7, 0x7f0b0040

    invoke-virtual {p0, v7}, Lorg/thecongers/mtpms/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/LinearLayout;

    iput-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->layoutFront:Landroid/widget/LinearLayout;

    .line 463
    const v7, 0x7f0b0044

    invoke-virtual {p0, v7}, Lorg/thecongers/mtpms/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/LinearLayout;

    iput-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->layoutRear:Landroid/widget/LinearLayout;

    .line 465
    iget-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->txtFrontPressure:Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    .line 466
    .local v1, "currentTxtFrontPressure":Ljava/lang/CharSequence;
    const v7, 0x7f0b0041

    invoke-virtual {p0, v7}, Lorg/thecongers/mtpms/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    iput-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->txtFrontPressure:Landroid/widget/TextView;

    .line 467
    iget-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->txtFrontPressure:Landroid/widget/TextView;

    invoke-virtual {v7, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 469
    iget-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->txtFrontTemperature:Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    .line 470
    .local v2, "currentTxtFrontTemperature":Ljava/lang/CharSequence;
    const v7, 0x7f0b0042

    invoke-virtual {p0, v7}, Lorg/thecongers/mtpms/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    iput-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->txtFrontTemperature:Landroid/widget/TextView;

    .line 471
    iget-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->txtFrontTemperature:Landroid/widget/TextView;

    invoke-virtual {v7, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 473
    iget-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->txtFrontVoltage:Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    .line 474
    .local v3, "currentTxtFrontVoltage":Ljava/lang/CharSequence;
    const v7, 0x7f0b0043

    invoke-virtual {p0, v7}, Lorg/thecongers/mtpms/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    iput-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->txtFrontVoltage:Landroid/widget/TextView;

    .line 475
    iget-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->txtFrontVoltage:Landroid/widget/TextView;

    invoke-virtual {v7, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 477
    iget-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->txtRearPressure:Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v4

    .line 478
    .local v4, "currentTxtRearPressure":Ljava/lang/CharSequence;
    const v7, 0x7f0b0045

    invoke-virtual {p0, v7}, Lorg/thecongers/mtpms/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    iput-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->txtRearPressure:Landroid/widget/TextView;

    .line 479
    iget-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->txtRearPressure:Landroid/widget/TextView;

    invoke-virtual {v7, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 481
    iget-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->txtRearTemperature:Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v5

    .line 482
    .local v5, "currentTxtRearTemperature":Ljava/lang/CharSequence;
    const v7, 0x7f0b0046

    invoke-virtual {p0, v7}, Lorg/thecongers/mtpms/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    iput-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->txtRearTemperature:Landroid/widget/TextView;

    .line 483
    iget-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->txtRearTemperature:Landroid/widget/TextView;

    invoke-virtual {v7, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 485
    iget-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->txtRearVoltage:Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v6

    .line 486
    .local v6, "currentTxtRearVoltage":Ljava/lang/CharSequence;
    const v7, 0x7f0b0047

    invoke-virtual {p0, v7}, Lorg/thecongers/mtpms/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    iput-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->txtRearVoltage:Landroid/widget/TextView;

    .line 487
    iget-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->txtRearVoltage:Landroid/widget/TextView;

    invoke-virtual {v7, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 489
    iget-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->txtOutput:Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    .line 490
    .local v0, "currentTxt":Ljava/lang/CharSequence;
    const v7, 0x7f0b0048

    invoke-virtual {p0, v7}, Lorg/thecongers/mtpms/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    iput-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->txtOutput:Landroid/widget/TextView;

    .line 491
    iget-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->txtOutput:Landroid/widget/TextView;

    invoke-virtual {v7, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 494
    iget-boolean v7, p0, Lorg/thecongers/mtpms/MainActivity;->itsDark:Z

    if-nez v7, :cond_2

    iget-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->sharedPrefs:Landroid/content/SharedPreferences;

    const-string v8, "prefNightMode"

    const/4 v9, 0x0

    invoke-interface {v7, v8, v9}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v7

    if-nez v7, :cond_2

    .line 495
    iget v7, p0, Lorg/thecongers/mtpms/MainActivity;->frontStatus:I

    if-lez v7, :cond_0

    .line 496
    iget-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->layoutFront:Landroid/widget/LinearLayout;

    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity;->redBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v7, v8}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 500
    :goto_0
    iget v7, p0, Lorg/thecongers/mtpms/MainActivity;->rearStatus:I

    if-lez v7, :cond_1

    .line 501
    iget-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->layoutRear:Landroid/widget/LinearLayout;

    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity;->redBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v7, v8}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 505
    :goto_1
    iget-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->root:Landroid/view/View;

    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getColor(I)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/view/View;->setBackgroundColor(I)V

    .line 506
    iget-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->txtOutput:Landroid/widget/TextView;

    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity;->txtOutBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 507
    iget-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->txtFrontPressure:Landroid/widget/TextView;

    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v11}, Landroid/content/res/Resources;->getColor(I)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 508
    iget-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->txtFrontTemperature:Landroid/widget/TextView;

    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v11}, Landroid/content/res/Resources;->getColor(I)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 509
    iget-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->txtFrontVoltage:Landroid/widget/TextView;

    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v11}, Landroid/content/res/Resources;->getColor(I)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 510
    iget-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->txtRearPressure:Landroid/widget/TextView;

    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v11}, Landroid/content/res/Resources;->getColor(I)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 511
    iget-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->txtRearTemperature:Landroid/widget/TextView;

    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v11}, Landroid/content/res/Resources;->getColor(I)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 512
    iget-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->txtRearVoltage:Landroid/widget/TextView;

    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v11}, Landroid/content/res/Resources;->getColor(I)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 513
    iget-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->txtOutput:Landroid/widget/TextView;

    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v11}, Landroid/content/res/Resources;->getColor(I)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 536
    :goto_2
    return-void

    .line 498
    :cond_0
    iget-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->layoutFront:Landroid/widget/LinearLayout;

    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity;->background:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v7, v8}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 503
    :cond_1
    iget-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->layoutRear:Landroid/widget/LinearLayout;

    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity;->background:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v7, v8}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_1

    .line 516
    :cond_2
    iget v7, p0, Lorg/thecongers/mtpms/MainActivity;->frontStatus:I

    if-lez v7, :cond_3

    .line 517
    iget-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->layoutFront:Landroid/widget/LinearLayout;

    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity;->redBackgroundDark:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v7, v8}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 521
    :goto_3
    iget v7, p0, Lorg/thecongers/mtpms/MainActivity;->rearStatus:I

    if-lez v7, :cond_4

    .line 522
    iget-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->layoutRear:Landroid/widget/LinearLayout;

    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity;->redBackgroundDark:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v7, v8}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 526
    :goto_4
    iget-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->root:Landroid/view/View;

    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v11}, Landroid/content/res/Resources;->getColor(I)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/view/View;->setBackgroundColor(I)V

    .line 527
    iget-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->txtOutput:Landroid/widget/TextView;

    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity;->txtOutBackgroundDark:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 528
    iget-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->txtFrontPressure:Landroid/widget/TextView;

    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getColor(I)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 529
    iget-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->txtFrontTemperature:Landroid/widget/TextView;

    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getColor(I)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 530
    iget-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->txtFrontVoltage:Landroid/widget/TextView;

    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getColor(I)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 531
    iget-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->txtRearPressure:Landroid/widget/TextView;

    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getColor(I)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 532
    iget-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->txtRearTemperature:Landroid/widget/TextView;

    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getColor(I)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 533
    iget-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->txtRearVoltage:Landroid/widget/TextView;

    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getColor(I)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 534
    iget-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->txtOutput:Landroid/widget/TextView;

    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getColor(I)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    goto/16 :goto_2

    .line 519
    :cond_3
    iget-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->layoutFront:Landroid/widget/LinearLayout;

    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity;->backgroundDark:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v7, v8}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_3

    .line 524
    :cond_4
    iget-object v7, p0, Lorg/thecongers/mtpms/MainActivity;->layoutRear:Landroid/widget/LinearLayout;

    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity;->backgroundDark:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v7, v8}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_4
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 14
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "HandlerLeak"
        }
    .end annotation

    .prologue
    .line 109
    invoke-super {p0, p1}, Landroid/support/v7/app/ActionBarActivity;->onCreate(Landroid/os/Bundle;)V

    .line 111
    const v11, 0x7f030017

    invoke-virtual {p0, v11}, Lorg/thecongers/mtpms/MainActivity;->setContentView(I)V

    .line 112
    const v11, 0x7f0d0022

    invoke-virtual {p0, v11}, Lorg/thecongers/mtpms/MainActivity;->setTitle(I)V

    .line 114
    const v11, 0x7f0b0040

    invoke-virtual {p0, v11}, Lorg/thecongers/mtpms/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/LinearLayout;

    iput-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->layoutFront:Landroid/widget/LinearLayout;

    .line 115
    const v11, 0x7f0b0044

    invoke-virtual {p0, v11}, Lorg/thecongers/mtpms/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/LinearLayout;

    iput-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->layoutRear:Landroid/widget/LinearLayout;

    .line 116
    const v11, 0x7f0b0041

    invoke-virtual {p0, v11}, Lorg/thecongers/mtpms/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/TextView;

    iput-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->txtFrontPressure:Landroid/widget/TextView;

    .line 117
    const v11, 0x7f0b0042

    invoke-virtual {p0, v11}, Lorg/thecongers/mtpms/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/TextView;

    iput-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->txtFrontTemperature:Landroid/widget/TextView;

    .line 118
    const v11, 0x7f0b0043

    invoke-virtual {p0, v11}, Lorg/thecongers/mtpms/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/TextView;

    iput-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->txtFrontVoltage:Landroid/widget/TextView;

    .line 119
    const v11, 0x7f0b0045

    invoke-virtual {p0, v11}, Lorg/thecongers/mtpms/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/TextView;

    iput-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->txtRearPressure:Landroid/widget/TextView;

    .line 120
    const v11, 0x7f0b0046

    invoke-virtual {p0, v11}, Lorg/thecongers/mtpms/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/TextView;

    iput-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->txtRearTemperature:Landroid/widget/TextView;

    .line 121
    const v11, 0x7f0b0047

    invoke-virtual {p0, v11}, Lorg/thecongers/mtpms/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/TextView;

    iput-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->txtRearVoltage:Landroid/widget/TextView;

    .line 122
    const v11, 0x7f0b0048

    invoke-virtual {p0, v11}, Lorg/thecongers/mtpms/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/TextView;

    iput-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->txtOutput:Landroid/widget/TextView;

    .line 123
    const v11, 0x7f0b003f

    invoke-virtual {p0, v11}, Lorg/thecongers/mtpms/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    .line 124
    .local v5, "myView":Landroid/view/View;
    invoke-virtual {v5}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v11

    iput-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->root:Landroid/view/View;

    .line 126
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v11

    iput-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->sharedPrefs:Landroid/content/SharedPreferences;

    .line 129
    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getWindow()Landroid/view/Window;

    move-result-object v11

    const/16 v12, 0x80

    invoke-virtual {v11, v12}, Landroid/view/Window;->addFlags(I)V

    .line 132
    new-instance v0, Landroid/content/IntentFilter;

    const-string v11, "android.bluetooth.device.action.ACL_CONNECTED"

    invoke-direct {v0, v11}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 133
    .local v0, "filter1":Landroid/content/IntentFilter;
    new-instance v1, Landroid/content/IntentFilter;

    const-string v11, "android.bluetooth.device.action.ACL_DISCONNECT_REQUESTED"

    invoke-direct {v1, v11}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 134
    .local v1, "filter2":Landroid/content/IntentFilter;
    new-instance v2, Landroid/content/IntentFilter;

    const-string v11, "android.bluetooth.device.action.ACL_DISCONNECTED"

    invoke-direct {v2, v11}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 135
    .local v2, "filter3":Landroid/content/IntentFilter;
    iget-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->btReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v11, v0}, Lorg/thecongers/mtpms/MainActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 136
    iget-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->btReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v11, v1}, Lorg/thecongers/mtpms/MainActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 137
    iget-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->btReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v11, v2}, Lorg/thecongers/mtpms/MainActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 139
    new-instance v11, Lorg/thecongers/mtpms/SensorIdDatabase;

    invoke-direct {v11, p0}, Lorg/thecongers/mtpms/SensorIdDatabase;-><init>(Landroid/content/Context;)V

    sput-object v11, Lorg/thecongers/mtpms/MainActivity;->sensorDB:Lorg/thecongers/mtpms/SensorIdDatabase;

    .line 142
    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f020036

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v11

    iput-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->background:Landroid/graphics/drawable/Drawable;

    .line 143
    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f020038

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v11

    iput-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->redBackground:Landroid/graphics/drawable/Drawable;

    .line 144
    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f020037

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v11

    iput-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->backgroundDark:Landroid/graphics/drawable/Drawable;

    .line 145
    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f020039

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v11

    iput-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->redBackgroundDark:Landroid/graphics/drawable/Drawable;

    .line 146
    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f020035

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v11

    iput-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->txtOutBackground:Landroid/graphics/drawable/Drawable;

    .line 147
    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f02003a

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v11

    iput-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->txtOutBackgroundDark:Landroid/graphics/drawable/Drawable;

    .line 150
    iget-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->sharedPrefs:Landroid/content/SharedPreferences;

    const-string v12, "prefpressuref"

    const-string v13, "0"

    invoke-interface {v11, v12, v13}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 151
    .local v6, "pressureFormat":Ljava/lang/String;
    const-string v7, "psi"

    .line 152
    .local v7, "pressureUnit":Ljava/lang/String;
    const-string v11, "1"

    invoke-virtual {v6, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_3

    .line 154
    const-string v7, "KPa"

    .line 162
    :cond_0
    :goto_0
    const-string v10, "C"

    .line 163
    .local v10, "temperatureUnit":Ljava/lang/String;
    iget-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->sharedPrefs:Landroid/content/SharedPreferences;

    const-string v12, "preftempf"

    const-string v13, "0"

    invoke-interface {v11, v12, v13}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v12, "0"

    invoke-virtual {v11, v12}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 165
    const-string v10, "F"

    .line 168
    :cond_1
    iget-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->txtFrontPressure:Landroid/widget/TextView;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "--- "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 169
    iget-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->txtFrontTemperature:Landroid/widget/TextView;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "--- "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 170
    iget-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->txtFrontVoltage:Landroid/widget/TextView;

    const-string v12, "--- V"

    invoke-virtual {v11, v12}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 171
    iget-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->txtRearPressure:Landroid/widget/TextView;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "--- "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 172
    iget-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->txtRearTemperature:Landroid/widget/TextView;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "--- "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 173
    iget-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->txtRearVoltage:Landroid/widget/TextView;

    const-string v12, "--- V"

    invoke-virtual {v11, v12}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 176
    iget-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->sharedPrefs:Landroid/content/SharedPreferences;

    const-string v12, "prefNightMode"

    const/4 v13, 0x0

    invoke-interface {v11, v12, v13}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v11

    if-nez v11, :cond_5

    .line 177
    iget-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->root:Landroid/view/View;

    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    const v13, 0x106000b

    invoke-virtual {v12, v13}, Landroid/content/res/Resources;->getColor(I)I

    move-result v12

    invoke-virtual {v11, v12}, Landroid/view/View;->setBackgroundColor(I)V

    .line 178
    iget-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->layoutFront:Landroid/widget/LinearLayout;

    iget-object v12, p0, Lorg/thecongers/mtpms/MainActivity;->background:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v11, v12}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 179
    iget-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->layoutRear:Landroid/widget/LinearLayout;

    iget-object v12, p0, Lorg/thecongers/mtpms/MainActivity;->background:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v11, v12}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 180
    iget-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->txtFrontPressure:Landroid/widget/TextView;

    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    const v13, 0x106000c

    invoke-virtual {v12, v13}, Landroid/content/res/Resources;->getColor(I)I

    move-result v12

    invoke-virtual {v11, v12}, Landroid/widget/TextView;->setTextColor(I)V

    .line 181
    iget-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->txtFrontTemperature:Landroid/widget/TextView;

    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    const v13, 0x106000c

    invoke-virtual {v12, v13}, Landroid/content/res/Resources;->getColor(I)I

    move-result v12

    invoke-virtual {v11, v12}, Landroid/widget/TextView;->setTextColor(I)V

    .line 182
    iget-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->txtFrontVoltage:Landroid/widget/TextView;

    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    const v13, 0x106000c

    invoke-virtual {v12, v13}, Landroid/content/res/Resources;->getColor(I)I

    move-result v12

    invoke-virtual {v11, v12}, Landroid/widget/TextView;->setTextColor(I)V

    .line 183
    iget-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->txtRearPressure:Landroid/widget/TextView;

    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    const v13, 0x106000c

    invoke-virtual {v12, v13}, Landroid/content/res/Resources;->getColor(I)I

    move-result v12

    invoke-virtual {v11, v12}, Landroid/widget/TextView;->setTextColor(I)V

    .line 184
    iget-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->txtRearTemperature:Landroid/widget/TextView;

    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    const v13, 0x106000c

    invoke-virtual {v12, v13}, Landroid/content/res/Resources;->getColor(I)I

    move-result v12

    invoke-virtual {v11, v12}, Landroid/widget/TextView;->setTextColor(I)V

    .line 185
    iget-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->txtRearVoltage:Landroid/widget/TextView;

    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    const v13, 0x106000c

    invoke-virtual {v12, v13}, Landroid/content/res/Resources;->getColor(I)I

    move-result v12

    invoke-virtual {v11, v12}, Landroid/widget/TextView;->setTextColor(I)V

    .line 186
    iget-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->txtOutput:Landroid/widget/TextView;

    iget-object v12, p0, Lorg/thecongers/mtpms/MainActivity;->txtOutBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v11, v12}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 187
    iget-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->txtOutput:Landroid/widget/TextView;

    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    const v13, 0x106000c

    invoke-virtual {v12, v13}, Landroid/content/res/Resources;->getColor(I)I

    move-result v12

    invoke-virtual {v11, v12}, Landroid/widget/TextView;->setTextColor(I)V

    .line 203
    :goto_1
    iget-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->sharedPrefs:Landroid/content/SharedPreferences;

    const-string v12, "prefFrontID"

    const-string v13, ""

    invoke-interface {v11, v12, v13}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v12, ""

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_2

    iget-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->sharedPrefs:Landroid/content/SharedPreferences;

    const-string v12, "prefRearID"

    const-string v13, ""

    invoke-interface {v11, v12, v13}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v12, ""

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 204
    new-instance v11, Landroid/app/AlertDialog$Builder;

    invoke-direct {v11, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v12, 0x7f0d0021

    invoke-virtual {v11, v12}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v11

    const v12, 0x7f0d0020

    invoke-virtual {v11, v12}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v11

    const v12, 0x7f0d001f

    const/4 v13, 0x0

    invoke-virtual {v11, v12, v13}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v11

    invoke-virtual {v11}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 207
    :cond_2
    new-instance v9, Lorg/thecongers/mtpms/MainActivity$1;

    invoke-direct {v9, p0}, Lorg/thecongers/mtpms/MainActivity$1;-><init>(Lorg/thecongers/mtpms/MainActivity;)V

    .line 423
    .local v9, "sensorMessages":Lorg/thecongers/mtpms/IStaticHandler;
    invoke-static {v9}, Lorg/thecongers/mtpms/StaticHandlerFactory;->create(Lorg/thecongers/mtpms/IStaticHandler;)Lorg/thecongers/mtpms/StaticHandlerFactory$StaticHandler;

    move-result-object v11

    iput-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->handler:Landroid/os/Handler;

    .line 425
    const-string v11, "sensor"

    invoke-virtual {p0, v11}, Lorg/thecongers/mtpms/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/hardware/SensorManager;

    .line 427
    .local v8, "sensorManager":Landroid/hardware/SensorManager;
    const/4 v11, 0x5

    invoke-virtual {v8, v11}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v3

    .line 430
    .local v3, "lightSensor":Landroid/hardware/Sensor;
    if-nez v3, :cond_6

    .line 431
    const-string v11, "mTPMS"

    const-string v12, "Light sensor not found"

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 441
    :goto_2
    invoke-direct {p0}, Lorg/thecongers/mtpms/MainActivity;->btConnect()Z

    .line 442
    return-void

    .line 155
    .end local v3    # "lightSensor":Landroid/hardware/Sensor;
    .end local v8    # "sensorManager":Landroid/hardware/SensorManager;
    .end local v9    # "sensorMessages":Lorg/thecongers/mtpms/IStaticHandler;
    .end local v10    # "temperatureUnit":Ljava/lang/String;
    :cond_3
    const-string v11, "2"

    invoke-virtual {v6, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_4

    .line 157
    const-string v7, "Kg-f"

    goto/16 :goto_0

    .line 158
    :cond_4
    const-string v11, "3"

    invoke-virtual {v6, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 160
    const-string v7, "Bar"

    goto/16 :goto_0

    .line 189
    .restart local v10    # "temperatureUnit":Ljava/lang/String;
    :cond_5
    iget-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->root:Landroid/view/View;

    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    const v13, 0x106000c

    invoke-virtual {v12, v13}, Landroid/content/res/Resources;->getColor(I)I

    move-result v12

    invoke-virtual {v11, v12}, Landroid/view/View;->setBackgroundColor(I)V

    .line 190
    iget-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->layoutFront:Landroid/widget/LinearLayout;

    iget-object v12, p0, Lorg/thecongers/mtpms/MainActivity;->backgroundDark:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v11, v12}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 191
    iget-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->layoutRear:Landroid/widget/LinearLayout;

    iget-object v12, p0, Lorg/thecongers/mtpms/MainActivity;->backgroundDark:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v11, v12}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 192
    iget-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->txtFrontPressure:Landroid/widget/TextView;

    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    const v13, 0x106000b

    invoke-virtual {v12, v13}, Landroid/content/res/Resources;->getColor(I)I

    move-result v12

    invoke-virtual {v11, v12}, Landroid/widget/TextView;->setTextColor(I)V

    .line 193
    iget-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->txtFrontTemperature:Landroid/widget/TextView;

    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    const v13, 0x106000b

    invoke-virtual {v12, v13}, Landroid/content/res/Resources;->getColor(I)I

    move-result v12

    invoke-virtual {v11, v12}, Landroid/widget/TextView;->setTextColor(I)V

    .line 194
    iget-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->txtFrontVoltage:Landroid/widget/TextView;

    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    const v13, 0x106000b

    invoke-virtual {v12, v13}, Landroid/content/res/Resources;->getColor(I)I

    move-result v12

    invoke-virtual {v11, v12}, Landroid/widget/TextView;->setTextColor(I)V

    .line 195
    iget-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->txtRearPressure:Landroid/widget/TextView;

    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    const v13, 0x106000b

    invoke-virtual {v12, v13}, Landroid/content/res/Resources;->getColor(I)I

    move-result v12

    invoke-virtual {v11, v12}, Landroid/widget/TextView;->setTextColor(I)V

    .line 196
    iget-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->txtRearTemperature:Landroid/widget/TextView;

    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    const v13, 0x106000b

    invoke-virtual {v12, v13}, Landroid/content/res/Resources;->getColor(I)I

    move-result v12

    invoke-virtual {v11, v12}, Landroid/widget/TextView;->setTextColor(I)V

    .line 197
    iget-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->txtRearVoltage:Landroid/widget/TextView;

    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    const v13, 0x106000b

    invoke-virtual {v12, v13}, Landroid/content/res/Resources;->getColor(I)I

    move-result v12

    invoke-virtual {v11, v12}, Landroid/widget/TextView;->setTextColor(I)V

    .line 198
    iget-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->txtOutput:Landroid/widget/TextView;

    iget-object v12, p0, Lorg/thecongers/mtpms/MainActivity;->txtOutBackgroundDark:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v11, v12}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 199
    iget-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->txtOutput:Landroid/widget/TextView;

    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    const v13, 0x106000b

    invoke-virtual {v12, v13}, Landroid/content/res/Resources;->getColor(I)I

    move-result v12

    invoke-virtual {v11, v12}, Landroid/widget/TextView;->setTextColor(I)V

    goto/16 :goto_1

    .line 433
    .restart local v3    # "lightSensor":Landroid/hardware/Sensor;
    .restart local v8    # "sensorManager":Landroid/hardware/SensorManager;
    .restart local v9    # "sensorMessages":Lorg/thecongers/mtpms/IStaticHandler;
    :cond_6
    invoke-virtual {v3}, Landroid/hardware/Sensor;->getMaximumRange()F

    move-result v4

    .line 434
    .local v4, "max":F
    iget-object v11, p0, Lorg/thecongers/mtpms/MainActivity;->lightSensorEventListener:Landroid/hardware/SensorEventListener;

    const/4 v12, 0x3

    invoke-virtual {v8, v11, v3, v12}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 437
    const/4 v11, 0x1

    sput-boolean v11, Lorg/thecongers/mtpms/MainActivity;->hasSensor:Z

    .line 438
    const-string v11, "mTPMS"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Light Sensor Max Value: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 543
    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const/high16 v1, 0x7f0f0000

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 544
    const/4 v0, 0x1

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 6
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v3, 0x1

    .line 551
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v4

    packed-switch v4, :pswitch_data_0

    .line 580
    :goto_0
    invoke-super {p0, p1}, Landroid/support/v7/app/ActionBarActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v3

    :goto_1
    return v3

    .line 554
    :pswitch_0
    new-instance v1, Landroid/content/Intent;

    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    const-class v5, Lorg/thecongers/mtpms/UserSettingActivity;

    invoke-direct {v1, v4, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 555
    .local v1, "i":Landroid/content/Intent;
    invoke-virtual {p0, v1, v3}, Lorg/thecongers/mtpms/MainActivity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_1

    .line 559
    .end local v1    # "i":Landroid/content/Intent;
    :pswitch_1
    sget-object v4, Lorg/thecongers/mtpms/MainActivity;->sensorDB:Lorg/thecongers/mtpms/SensorIdDatabase;

    invoke-virtual {v4}, Lorg/thecongers/mtpms/SensorIdDatabase;->purgeID()V

    .line 560
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 561
    .local v2, "settings":Landroid/content/SharedPreferences;
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string v5, "prefFrontID"

    invoke-interface {v4, v5}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 562
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string v5, "prefRearID"

    invoke-interface {v4, v5}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_1

    .line 566
    .end local v2    # "settings":Landroid/content/SharedPreferences;
    :pswitch_2
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 567
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0d0016

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 568
    const/high16 v4, 0x7f060000

    invoke-static {p0, v4}, Lorg/thecongers/mtpms/MainActivity;->readRawTextFile(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 569
    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0d0015

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v0, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 570
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_1

    .line 574
    .end local v0    # "builder":Landroid/app/AlertDialog$Builder;
    :pswitch_3
    iget-object v3, p0, Lorg/thecongers/mtpms/MainActivity;->logger:Lorg/thecongers/mtpms/LogData;

    if-eqz v3, :cond_0

    .line 575
    iget-object v3, p0, Lorg/thecongers/mtpms/MainActivity;->logger:Lorg/thecongers/mtpms/LogData;

    invoke-virtual {v3}, Lorg/thecongers/mtpms/LogData;->shutdown()V

    .line 577
    :cond_0
    invoke-virtual {p0}, Lorg/thecongers/mtpms/MainActivity;->finish()V

    .line 578
    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/System;->exit(I)V

    goto :goto_0

    .line 551
    :pswitch_data_0
    .packed-switch 0x7f0b004a
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method protected onStop()V
    .locals 3

    .prologue
    .line 448
    :try_start_0
    iget-object v1, p0, Lorg/thecongers/mtpms/MainActivity;->btReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1}, Lorg/thecongers/mtpms/MainActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 452
    :goto_0
    invoke-super {p0}, Landroid/support/v7/app/ActionBarActivity;->onStop()V

    .line 453
    return-void

    .line 449
    :catch_0
    move-exception v0

    .line 450
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    const-string v1, "mTPMS"

    const-string v2, "Receiver not registered"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
