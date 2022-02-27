.class public Lorg/thecongers/mtpms/StaticHandlerFactory;
.super Ljava/lang/Object;
.source "StaticHandlerFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/thecongers/mtpms/StaticHandlerFactory$StaticHandler;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    return-void
.end method

.method public static create(Lorg/thecongers/mtpms/IStaticHandler;)Lorg/thecongers/mtpms/StaticHandlerFactory$StaticHandler;
    .locals 1
    .param p0, "ref"    # Lorg/thecongers/mtpms/IStaticHandler;

    .prologue
    .line 27
    new-instance v0, Lorg/thecongers/mtpms/StaticHandlerFactory$StaticHandler;

    invoke-direct {v0, p0}, Lorg/thecongers/mtpms/StaticHandlerFactory$StaticHandler;-><init>(Lorg/thecongers/mtpms/IStaticHandler;)V

    return-object v0
.end method
