.class Lorg/thecongers/mtpms/MainActivity$ConnectedThread;
.super Ljava/lang/Thread;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/thecongers/mtpms/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ConnectedThread"
.end annotation


# instance fields
.field private final btInStream:Ljava/io/InputStream;

.field final synthetic this$0:Lorg/thecongers/mtpms/MainActivity;


# direct methods
.method public constructor <init>(Lorg/thecongers/mtpms/MainActivity;Landroid/bluetooth/BluetoothSocket;)V
    .locals 4
    .param p2, "socket"    # Landroid/bluetooth/BluetoothSocket;

    .prologue
    .line 760
    iput-object p1, p0, Lorg/thecongers/mtpms/MainActivity$ConnectedThread;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 761
    const/4 v1, 0x0

    .line 765
    .local v1, "tmpInput":Ljava/io/InputStream;
    :try_start_0
    invoke-virtual {p2}, Landroid/bluetooth/BluetoothSocket;->getInputStream()Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 769
    :goto_0
    iput-object v1, p0, Lorg/thecongers/mtpms/MainActivity$ConnectedThread;->btInStream:Ljava/io/InputStream;

    .line 770
    return-void

    .line 766
    :catch_0
    move-exception v0

    .line 767
    .local v0, "e":Ljava/io/IOException;
    const-string v2, "mTPMS"

    const-string v3, "IO Exception getting input stream"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 773
    const/16 v3, 0x100

    new-array v0, v3, [B

    .line 780
    .local v0, "buffer":[B
    :goto_0
    :try_start_0
    iget-object v3, p0, Lorg/thecongers/mtpms/MainActivity$ConnectedThread;->btInStream:Ljava/io/InputStream;

    invoke-virtual {v3, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .line 782
    .local v1, "bytes":I
    iget-object v3, p0, Lorg/thecongers/mtpms/MainActivity$ConnectedThread;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v3}, Lorg/thecongers/mtpms/MainActivity;->access$2700(Lorg/thecongers/mtpms/MainActivity;)Landroid/os/Handler;

    move-result-object v3

    const/4 v4, 0x1

    const/4 v5, -0x1

    invoke-virtual {v3, v4, v1, v5, v0}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v3

    invoke-virtual {v3}, Landroid/os/Message;->sendToTarget()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 783
    .end local v1    # "bytes":I
    :catch_0
    move-exception v2

    .line 784
    .local v2, "e":Ljava/io/IOException;
    const-string v3, "mTPMS"

    const-string v4, "IO Exception while reading stream"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 785
    iget-object v3, p0, Lorg/thecongers/mtpms/MainActivity$ConnectedThread;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v3}, Lorg/thecongers/mtpms/MainActivity;->access$2800(Lorg/thecongers/mtpms/MainActivity;)Lorg/thecongers/mtpms/MainActivity$ConnectThread;

    move-result-object v3

    invoke-virtual {v3}, Lorg/thecongers/mtpms/MainActivity$ConnectThread;->cancel()V

    .line 789
    return-void
.end method
