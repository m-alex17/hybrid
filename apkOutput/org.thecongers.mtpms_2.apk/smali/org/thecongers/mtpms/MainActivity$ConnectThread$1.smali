.class Lorg/thecongers/mtpms/MainActivity$ConnectThread$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/thecongers/mtpms/MainActivity$ConnectThread;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/thecongers/mtpms/MainActivity$ConnectThread;


# direct methods
.method constructor <init>(Lorg/thecongers/mtpms/MainActivity$ConnectThread;)V
    .locals 0

    .prologue
    .line 719
    iput-object p1, p0, Lorg/thecongers/mtpms/MainActivity$ConnectThread$1;->this$1:Lorg/thecongers/mtpms/MainActivity$ConnectThread;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 723
    iget-object v0, p0, Lorg/thecongers/mtpms/MainActivity$ConnectThread$1;->this$1:Lorg/thecongers/mtpms/MainActivity$ConnectThread;

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$ConnectThread;->this$0:Lorg/thecongers/mtpms/MainActivity;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lorg/thecongers/mtpms/MainActivity$ConnectThread$1;->this$1:Lorg/thecongers/mtpms/MainActivity$ConnectThread;

    iget-object v2, v2, Lorg/thecongers/mtpms/MainActivity$ConnectThread;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-virtual {v2}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d003f

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/thecongers/mtpms/MainActivity$ConnectThread$1;->this$1:Lorg/thecongers/mtpms/MainActivity$ConnectThread;

    invoke-static {v2}, Lorg/thecongers/mtpms/MainActivity$ConnectThread;->access$2600(Lorg/thecongers/mtpms/MainActivity$ConnectThread;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v2

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/thecongers/mtpms/MainActivity$ConnectThread$1;->this$1:Lorg/thecongers/mtpms/MainActivity$ConnectThread;

    invoke-static {v2}, Lorg/thecongers/mtpms/MainActivity$ConnectThread;->access$2600(Lorg/thecongers/mtpms/MainActivity$ConnectThread;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v2

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 728
    return-void
.end method
