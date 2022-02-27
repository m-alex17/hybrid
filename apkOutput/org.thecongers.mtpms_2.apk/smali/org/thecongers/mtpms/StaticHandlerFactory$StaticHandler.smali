.class Lorg/thecongers/mtpms/StaticHandlerFactory$StaticHandler;
.super Landroid/os/Handler;
.source "StaticHandlerFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/thecongers/mtpms/StaticHandlerFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "StaticHandler"
.end annotation


# instance fields
.field weakRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lorg/thecongers/mtpms/IStaticHandler;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/thecongers/mtpms/IStaticHandler;)V
    .locals 1
    .param p1, "ref"    # Lorg/thecongers/mtpms/IStaticHandler;

    .prologue
    .line 34
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 35
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lorg/thecongers/mtpms/StaticHandlerFactory$StaticHandler;->weakRef:Ljava/lang/ref/WeakReference;

    .line 36
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 40
    iget-object v0, p0, Lorg/thecongers/mtpms/StaticHandlerFactory$StaticHandler;->weakRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    .line 41
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Something goes wrong."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 43
    :cond_0
    iget-object v0, p0, Lorg/thecongers/mtpms/StaticHandlerFactory$StaticHandler;->weakRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/thecongers/mtpms/IStaticHandler;

    invoke-interface {v0, p1}, Lorg/thecongers/mtpms/IStaticHandler;->handleMessage(Landroid/os/Message;)V

    .line 45
    return-void
.end method
