.class Lorg/thecongers/mtpms/MainActivity$2;
.super Landroid/content/BroadcastReceiver;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/thecongers/mtpms/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/thecongers/mtpms/MainActivity;


# direct methods
.method constructor <init>(Lorg/thecongers/mtpms/MainActivity;)V
    .locals 0

    .prologue
    .line 656
    iput-object p1, p0, Lorg/thecongers/mtpms/MainActivity$2;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 659
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 660
    .local v0, "action":Ljava/lang/String;
    const-string v2, "android.bluetooth.device.extra.DEVICE"

    invoke-virtual {p2, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/bluetooth/BluetoothDevice;

    .line 662
    .local v1, "device":Landroid/bluetooth/BluetoothDevice;
    const-string v2, "android.bluetooth.device.action.ACL_CONNECTED"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "iTPMS"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 664
    const-string v2, "mTPMS"

    const-string v3, "iTPMSystem Connected"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 665
    iget-object v2, p0, Lorg/thecongers/mtpms/MainActivity$2;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v2}, Lorg/thecongers/mtpms/MainActivity;->access$2300(Lorg/thecongers/mtpms/MainActivity;)Z

    .line 671
    :cond_0
    :goto_0
    return-void

    .line 667
    :cond_1
    const-string v2, "android.bluetooth.device.action.ACL_DISCONNECTED"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "iTPMS"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 669
    const-string v2, "mTPMS"

    const-string v3, "iTPMSystem Disconnected"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
