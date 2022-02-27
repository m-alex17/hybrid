.class Lorg/thecongers/mtpms/MainActivity$ConnectThread;
.super Ljava/lang/Thread;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/thecongers/mtpms/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ConnectThread"
.end annotation


# instance fields
.field private final btDevice:Landroid/bluetooth/BluetoothDevice;

.field private final btSocket:Landroid/bluetooth/BluetoothSocket;

.field final synthetic this$0:Lorg/thecongers/mtpms/MainActivity;


# direct methods
.method public constructor <init>(Lorg/thecongers/mtpms/MainActivity;Landroid/bluetooth/BluetoothDevice;)V
    .locals 5
    .param p2, "device"    # Landroid/bluetooth/BluetoothDevice;

    .prologue
    .line 695
    iput-object p1, p0, Lorg/thecongers/mtpms/MainActivity$ConnectThread;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 698
    const/4 v1, 0x0

    .line 699
    .local v1, "tmp":Landroid/bluetooth/BluetoothSocket;
    iput-object p2, p0, Lorg/thecongers/mtpms/MainActivity$ConnectThread;->btDevice:Landroid/bluetooth/BluetoothDevice;

    .line 703
    :try_start_0
    invoke-static {p1, p2}, Lorg/thecongers/mtpms/MainActivity;->access$2400(Lorg/thecongers/mtpms/MainActivity;Landroid/bluetooth/BluetoothDevice;)Landroid/bluetooth/BluetoothSocket;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 707
    :goto_0
    iput-object v1, p0, Lorg/thecongers/mtpms/MainActivity$ConnectThread;->btSocket:Landroid/bluetooth/BluetoothSocket;

    .line 708
    return-void

    .line 704
    :catch_0
    move-exception v0

    .line 705
    .local v0, "e":Ljava/io/IOException;
    const-string v2, "mTPMS"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Bluetooth socket create failed: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method static synthetic access$2600(Lorg/thecongers/mtpms/MainActivity$ConnectThread;)Landroid/bluetooth/BluetoothDevice;
    .locals 1
    .param p0, "x0"    # Lorg/thecongers/mtpms/MainActivity$ConnectThread;

    .prologue
    .line 691
    iget-object v0, p0, Lorg/thecongers/mtpms/MainActivity$ConnectThread;->btDevice:Landroid/bluetooth/BluetoothDevice;

    return-object v0
.end method


# virtual methods
.method public cancel()V
    .locals 3

    .prologue
    .line 749
    :try_start_0
    iget-object v1, p0, Lorg/thecongers/mtpms/MainActivity$ConnectThread;->btSocket:Landroid/bluetooth/BluetoothSocket;

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothSocket;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 753
    :goto_0
    return-void

    .line 750
    :catch_0
    move-exception v0

    .line 751
    .local v0, "e":Ljava/io/IOException;
    const-string v1, "mTPMS"

    const-string v2, "Unable to close Bluetooth socket"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public run()V
    .locals 6

    .prologue
    .line 712
    iget-object v3, p0, Lorg/thecongers/mtpms/MainActivity$ConnectThread;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v3}, Lorg/thecongers/mtpms/MainActivity;->access$2500(Lorg/thecongers/mtpms/MainActivity;)Landroid/bluetooth/BluetoothAdapter;

    move-result-object v3

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothAdapter;->cancelDiscovery()Z

    .line 713
    const-string v3, "mTPMS"

    const-string v4, "Connecting to the iTPMSystem..."

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 717
    :try_start_0
    iget-object v3, p0, Lorg/thecongers/mtpms/MainActivity$ConnectThread;->btSocket:Landroid/bluetooth/BluetoothSocket;

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothSocket;->connect()V

    .line 718
    const-string v3, "mTPMS"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Connected to: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lorg/thecongers/mtpms/MainActivity$ConnectThread;->btDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v5}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lorg/thecongers/mtpms/MainActivity$ConnectThread;->btDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v5}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 719
    iget-object v3, p0, Lorg/thecongers/mtpms/MainActivity$ConnectThread;->this$0:Lorg/thecongers/mtpms/MainActivity;

    new-instance v4, Lorg/thecongers/mtpms/MainActivity$ConnectThread$1;

    invoke-direct {v4, p0}, Lorg/thecongers/mtpms/MainActivity$ConnectThread$1;-><init>(Lorg/thecongers/mtpms/MainActivity$ConnectThread;)V

    invoke-virtual {v3, v4}, Lorg/thecongers/mtpms/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 742
    new-instance v0, Lorg/thecongers/mtpms/MainActivity$ConnectedThread;

    iget-object v3, p0, Lorg/thecongers/mtpms/MainActivity$ConnectThread;->this$0:Lorg/thecongers/mtpms/MainActivity;

    iget-object v4, p0, Lorg/thecongers/mtpms/MainActivity$ConnectThread;->btSocket:Landroid/bluetooth/BluetoothSocket;

    invoke-direct {v0, v3, v4}, Lorg/thecongers/mtpms/MainActivity$ConnectedThread;-><init>(Lorg/thecongers/mtpms/MainActivity;Landroid/bluetooth/BluetoothSocket;)V

    .line 743
    .local v0, "btConnectedThread":Lorg/thecongers/mtpms/MainActivity$ConnectedThread;
    invoke-virtual {v0}, Lorg/thecongers/mtpms/MainActivity$ConnectedThread;->start()V

    .line 744
    .end local v0    # "btConnectedThread":Lorg/thecongers/mtpms/MainActivity$ConnectedThread;
    :goto_0
    return-void

    .line 730
    :catch_0
    move-exception v2

    .line 732
    .local v2, "connectException":Ljava/io/IOException;
    const-string v3, "mTPMS"

    const-string v4, "Unable to connect to the iTPMSystem..."

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 734
    :try_start_1
    iget-object v3, p0, Lorg/thecongers/mtpms/MainActivity$ConnectThread;->btSocket:Landroid/bluetooth/BluetoothSocket;

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothSocket;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 735
    :catch_1
    move-exception v1

    .line 736
    .local v1, "closeException":Ljava/io/IOException;
    const-string v3, "mTPMS"

    const-string v4, "Unable to close socket during connection failure"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
