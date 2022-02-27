.class Lorg/thecongers/mtpms/MainActivity$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Lorg/thecongers/mtpms/IStaticHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/thecongers/mtpms/MainActivity;->onCreate(Landroid/os/Bundle;)V
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
    .line 207
    iput-object p1, p0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 41
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 210
    move-object/from16 v0, p1

    iget v0, v0, Landroid/os/Message;->what:I

    move/from16 v33, v0

    packed-switch v33, :pswitch_data_0

    .line 421
    :cond_0
    :goto_0
    return-void

    .line 213
    :pswitch_0
    const-string v33, "mTPMS"

    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    const-string v37, "Serial Message Received, Length: "

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, p1

    iget v0, v0, Landroid/os/Message;->arg1:I

    move/from16 v37, v0

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 215
    move-object/from16 v0, p1

    iget v0, v0, Landroid/os/Message;->arg1:I

    move/from16 v33, v0

    const/16 v36, 0xd

    move/from16 v0, v33

    move/from16 v1, v36

    if-ne v0, v1, :cond_20

    .line 216
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v33, v0

    check-cast v33, [B

    move-object/from16 v26, v33

    check-cast v26, [B

    .line 219
    .local v26, "readBuf":[B
    const/16 v33, 0x4

    aget-byte v33, v26, v33

    const/16 v36, 0x5

    aget-byte v36, v26, v36

    add-int v33, v33, v36

    const/16 v36, 0x6

    aget-byte v36, v26, v36

    add-int v33, v33, v36

    const/16 v36, 0x7

    aget-byte v36, v26, v36

    add-int v33, v33, v36

    const/16 v36, 0x8

    aget-byte v36, v26, v36

    add-int v33, v33, v36

    const/16 v36, 0x9

    aget-byte v36, v26, v36

    add-int v33, v33, v36

    const/16 v36, 0xa

    aget-byte v36, v26, v36

    add-int v6, v33, v36

    .line 220
    .local v6, "calculatedCheckSum":I
    const/16 v33, 0xb

    aget-byte v33, v26, v33

    move/from16 v0, v33

    if-ne v6, v0, :cond_0

    .line 222
    const/16 v33, 0xd

    move/from16 v0, v33

    new-array v14, v0, [Ljava/lang/String;

    .line 223
    .local v14, "hexData":[Ljava/lang/String;
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    .line 224
    .local v27, "sbhex":Ljava/lang/StringBuilder;
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_1
    move-object/from16 v0, p1

    iget v0, v0, Landroid/os/Message;->arg1:I

    move/from16 v33, v0

    move/from16 v0, v33

    if-ge v15, v0, :cond_1

    .line 225
    const-string v33, "%02X"

    const/16 v36, 0x1

    move/from16 v0, v36

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v36, v0

    const/16 v37, 0x0

    aget-byte v38, v26, v15

    invoke-static/range {v38 .. v38}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v38

    aput-object v38, v36, v37

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v33

    aput-object v33, v14, v15

    .line 226
    aget-object v33, v14, v15

    move-object/from16 v0, v27

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 224
    add-int/lit8 v15, v15, 0x1

    goto :goto_1

    .line 230
    :cond_1
    const/16 v33, 0x3

    aget-object v16, v14, v33

    .line 232
    .local v16, "position":Ljava/lang/String;
    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    .line 233
    .local v28, "sensorID":Ljava/lang/StringBuilder;
    const/16 v33, 0x4

    aget-object v33, v14, v33

    move-object/from16 v0, v28

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 234
    const/16 v33, 0x5

    aget-object v33, v14, v33

    move-object/from16 v0, v28

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 235
    const/16 v33, 0x6

    aget-object v33, v14, v33

    move-object/from16 v0, v28

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 236
    const/16 v33, 0x7

    aget-object v33, v14, v33

    move-object/from16 v0, v28

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 239
    sget-object v33, Lorg/thecongers/mtpms/MainActivity;->sensorDB:Lorg/thecongers/mtpms/SensorIdDatabase;

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Lorg/thecongers/mtpms/SensorIdDatabase;->sensorIdExists(Ljava/lang/String;)Z

    move-result v7

    .line 240
    .local v7, "checkID":Z
    if-nez v7, :cond_2

    .line 242
    sget-object v33, Lorg/thecongers/mtpms/MainActivity;->sensorDB:Lorg/thecongers/mtpms/SensorIdDatabase;

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Lorg/thecongers/mtpms/SensorIdDatabase;->addID(Ljava/lang/String;)V

    .line 243
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v37, v0

    invoke-virtual/range {v37 .. v37}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v37

    const v38, 0x7f0d0040

    invoke-virtual/range {v37 .. v38}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v37

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const-string v37, " "

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v37

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    const/16 v37, 0x1

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    move/from16 v2, v37

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Landroid/widget/Toast;->show()V

    .line 248
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$000(Lorg/thecongers/mtpms/MainActivity;)Landroid/content/SharedPreferences;

    move-result-object v33

    const-string v36, "prefFrontID"

    const-string v37, ""

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    move-object/from16 v2, v37

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 249
    .local v17, "prefFrontID":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$000(Lorg/thecongers/mtpms/MainActivity;)Landroid/content/SharedPreferences;

    move-result-object v33

    const-string v36, "prefRearID"

    const-string v37, ""

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    move-object/from16 v2, v37

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 250
    .local v18, "prefRearID":Ljava/lang/String;
    const-string v33, ""

    move-object/from16 v0, v17

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_3

    const-string v33, ""

    move-object/from16 v0, v18

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-nez v33, :cond_0

    .line 253
    :cond_3
    const/16 v33, 0x8

    :try_start_0
    aget-object v33, v14, v33

    const/16 v36, 0x10

    move-object/from16 v0, v33

    move/from16 v1, v36

    invoke-static {v0, v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v33

    add-int/lit8 v29, v33, -0x32

    .line 254
    .local v29, "tempC":I
    move/from16 v0, v29

    int-to-double v0, v0

    move-wide/from16 v30, v0

    .line 255
    .local v30, "temp":D
    const-string v32, "C"

    .line 257
    .local v32, "temperatureUnit":Ljava/lang/String;
    const/16 v33, 0x9

    aget-object v33, v14, v33

    const/16 v36, 0x10

    move-object/from16 v0, v33

    move/from16 v1, v36

    invoke-static {v0, v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v23

    .line 258
    .local v23, "psi":I
    move/from16 v0, v23

    int-to-double v0, v0

    move-wide/from16 v20, v0

    .line 259
    .local v20, "pressure":D
    const-string v22, "psi"

    .line 261
    .local v22, "pressureUnit":Ljava/lang/String;
    const/16 v33, 0xa

    aget-object v33, v14, v33

    const/16 v36, 0x10

    move-object/from16 v0, v33

    move/from16 v1, v36

    invoke-static {v0, v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v33

    div-int/lit8 v33, v33, 0x32

    move/from16 v0, v33

    int-to-double v0, v0

    move-wide/from16 v34, v0

    .line 263
    .local v34, "voltage":D
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$000(Lorg/thecongers/mtpms/MainActivity;)Landroid/content/SharedPreferences;

    move-result-object v33

    const-string v36, "prefFrontLowPressure"

    const-string v37, "30"

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    move-object/from16 v2, v37

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v11

    .line 264
    .local v11, "fLowPressure":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$000(Lorg/thecongers/mtpms/MainActivity;)Landroid/content/SharedPreferences;

    move-result-object v33

    const-string v36, "prefFrontHighPressure"

    const-string v37, "46"

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    move-object/from16 v2, v37

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    .line 265
    .local v10, "fHighPressure":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$000(Lorg/thecongers/mtpms/MainActivity;)Landroid/content/SharedPreferences;

    move-result-object v33

    const-string v36, "prefRearLowPressure"

    const-string v37, "30"

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    move-object/from16 v2, v37

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v25

    .line 266
    .local v25, "rLowPressure":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$000(Lorg/thecongers/mtpms/MainActivity;)Landroid/content/SharedPreferences;

    move-result-object v33

    const-string v36, "prefRearHighPressure"

    const-string v37, "46"

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    move-object/from16 v2, v37

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v24

    .line 267
    .local v24, "rHighPressure":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$000(Lorg/thecongers/mtpms/MainActivity;)Landroid/content/SharedPreferences;

    move-result-object v33

    const-string v36, "preftempf"

    const-string v37, "0"

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    move-object/from16 v2, v37

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v33

    const-string v36, "0"

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v33

    if-eqz v33, :cond_4

    .line 269
    const-wide v36, 0x3ffccccccccccccdL    # 1.8

    move/from16 v0, v29

    int-to-double v0, v0

    move-wide/from16 v38, v0

    mul-double v36, v36, v38

    const-wide/high16 v38, 0x4040000000000000L    # 32.0

    add-double v30, v36, v38

    .line 270
    const-string v32, "F"

    .line 272
    :cond_4
    const-wide/high16 v36, 0x3fe0000000000000L    # 0.5

    add-double v36, v36, v30

    move-wide/from16 v0, v36

    double-to-int v13, v0

    .line 273
    .local v13, "formattedTemperature":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$000(Lorg/thecongers/mtpms/MainActivity;)Landroid/content/SharedPreferences;

    move-result-object v33

    const-string v36, "prefpressuref"

    const-string v37, "0"

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    move-object/from16 v2, v37

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    .line 274
    .local v19, "pressureFormat":Ljava/lang/String;
    const-string v33, "1"

    move-object/from16 v0, v19

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v33

    if-eqz v33, :cond_a

    .line 276
    move/from16 v0, v23

    int-to-double v0, v0

    move-wide/from16 v36, v0

    const-wide v38, 0x401b943b41800ff8L    # 6.894757293168361

    mul-double v20, v36, v38

    .line 277
    const-string v22, "KPa"

    .line 287
    :cond_5
    :goto_2
    const-wide/high16 v36, 0x3fe0000000000000L    # 0.5

    add-double v36, v36, v20

    move-wide/from16 v0, v36

    double-to-int v12, v0

    .line 289
    .local v12, "formattedPressure":I
    const/16 v33, 0xb

    aget-object v8, v14, v33

    .line 290
    .local v8, "checksum":Ljava/lang/String;
    const-string v33, "mTPMS"

    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    const-string v37, "Sensor ID: "

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v37

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const-string v37, ", Sensor Position: "

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const-string v37, ", Temperature("

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const-string v37, "): "

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-static/range {v30 .. v31}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v37

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const-string v37, ", Pressure("

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const-string v37, "): "

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-static/range {v20 .. v21}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v37

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const-string v37, ", Voltage: "

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-static/range {v34 .. v35}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v37

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const-string v37, ", Checksum: "

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const-string v37, ", Data: "

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v37

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const-string v37, ", Bytes:"

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, p1

    iget v0, v0, Landroid/os/Message;->arg1:I

    move/from16 v37, v0

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 292
    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v33

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_e

    .line 293
    const-string v33, "mTPMS"

    const-string v36, "Front ID matched"

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 295
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$000(Lorg/thecongers/mtpms/MainActivity;)Landroid/content/SharedPreferences;

    move-result-object v33

    const-string v36, "prefDataLogging"

    const/16 v37, 0x0

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    move/from16 v2, v37

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v33

    if-eqz v33, :cond_7

    .line 297
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$100(Lorg/thecongers/mtpms/MainActivity;)Lorg/thecongers/mtpms/LogData;

    move-result-object v33

    if-nez v33, :cond_6

    .line 298
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    new-instance v36, Lorg/thecongers/mtpms/LogData;

    invoke-direct/range {v36 .. v36}, Lorg/thecongers/mtpms/LogData;-><init>()V

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-static {v0, v1}, Lorg/thecongers/mtpms/MainActivity;->access$102(Lorg/thecongers/mtpms/MainActivity;Lorg/thecongers/mtpms/LogData;)Lorg/thecongers/mtpms/LogData;

    .line 300
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$100(Lorg/thecongers/mtpms/MainActivity;)Lorg/thecongers/mtpms/LogData;

    move-result-object v33

    const-string v36, "front"

    invoke-static/range {v23 .. v23}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v37

    invoke-static/range {v29 .. v29}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v38

    invoke-static/range {v34 .. v35}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    move-object/from16 v2, v37

    move-object/from16 v3, v38

    move-object/from16 v4, v39

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/thecongers/mtpms/LogData;->write(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 304
    :cond_7
    move/from16 v0, v23

    if-gt v0, v11, :cond_c

    .line 305
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    const/16 v36, 0x1

    move-object/from16 v0, v33

    move/from16 v1, v36

    invoke-static {v0, v1}, Lorg/thecongers/mtpms/MainActivity;->access$202(Lorg/thecongers/mtpms/MainActivity;I)I

    .line 312
    :goto_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$300(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v33

    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v12}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v37

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const-string v37, " "

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 313
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$400(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v33

    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v13}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v37

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const-string v37, " "

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 314
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$500(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v33

    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    const-string v37, "%.2f"

    const/16 v38, 0x1

    move/from16 v0, v38

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v38, v0

    const/16 v39, 0x0

    invoke-static/range {v34 .. v35}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v40

    aput-object v40, v38, v39

    invoke-static/range {v37 .. v38}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v37

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const-string v37, " V"

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 339
    :cond_8
    :goto_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$200(Lorg/thecongers/mtpms/MainActivity;)I

    move-result v33

    if-nez v33, :cond_13

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$600(Lorg/thecongers/mtpms/MainActivity;)I

    move-result v33

    if-nez v33, :cond_13

    .line 340
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$1000(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v33

    const-string v36, ""

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 341
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$1100(Lorg/thecongers/mtpms/MainActivity;)Landroid/app/NotificationManager;

    move-result-object v33

    if-eqz v33, :cond_9

    .line 342
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$1100(Lorg/thecongers/mtpms/MainActivity;)Landroid/app/NotificationManager;

    move-result-object v33

    const/16 v36, 0x0

    move-object/from16 v0, v33

    move/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    .line 370
    :cond_9
    :goto_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$1300(Lorg/thecongers/mtpms/MainActivity;)Z

    move-result v33

    if-nez v33, :cond_1d

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$000(Lorg/thecongers/mtpms/MainActivity;)Landroid/content/SharedPreferences;

    move-result-object v33

    const-string v36, "prefNightMode"

    const/16 v37, 0x0

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    move/from16 v2, v37

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v33

    if-nez v33, :cond_1d

    .line 371
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$200(Lorg/thecongers/mtpms/MainActivity;)I

    move-result v33

    if-nez v33, :cond_1b

    .line 372
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$1500(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/LinearLayout;

    move-result-object v33

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v36, v0

    invoke-static/range {v36 .. v36}, Lorg/thecongers/mtpms/MainActivity;->access$1400(Lorg/thecongers/mtpms/MainActivity;)Landroid/graphics/drawable/Drawable;

    move-result-object v36

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 376
    :goto_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$600(Lorg/thecongers/mtpms/MainActivity;)I

    move-result v33

    if-nez v33, :cond_1c

    .line 377
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$1700(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/LinearLayout;

    move-result-object v33

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v36, v0

    invoke-static/range {v36 .. v36}, Lorg/thecongers/mtpms/MainActivity;->access$1400(Lorg/thecongers/mtpms/MainActivity;)Landroid/graphics/drawable/Drawable;

    move-result-object v36

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 381
    :goto_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$1800(Lorg/thecongers/mtpms/MainActivity;)Landroid/view/View;

    move-result-object v33

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v36

    const v37, 0x106000b

    invoke-virtual/range {v36 .. v37}, Landroid/content/res/Resources;->getColor(I)I

    move-result v36

    move-object/from16 v0, v33

    move/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 382
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$1000(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v33

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v36, v0

    invoke-static/range {v36 .. v36}, Lorg/thecongers/mtpms/MainActivity;->access$1900(Lorg/thecongers/mtpms/MainActivity;)Landroid/graphics/drawable/Drawable;

    move-result-object v36

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 383
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$1000(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v33

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v36

    const v37, 0x106000c

    invoke-virtual/range {v36 .. v37}, Landroid/content/res/Resources;->getColor(I)I

    move-result v36

    move-object/from16 v0, v33

    move/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 384
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$300(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v33

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v36

    const v37, 0x106000c

    invoke-virtual/range {v36 .. v37}, Landroid/content/res/Resources;->getColor(I)I

    move-result v36

    move-object/from16 v0, v33

    move/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 385
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$400(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v33

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v36

    const v37, 0x106000c

    invoke-virtual/range {v36 .. v37}, Landroid/content/res/Resources;->getColor(I)I

    move-result v36

    move-object/from16 v0, v33

    move/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 386
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$500(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v33

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v36

    const v37, 0x106000c

    invoke-virtual/range {v36 .. v37}, Landroid/content/res/Resources;->getColor(I)I

    move-result v36

    move-object/from16 v0, v33

    move/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 387
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$700(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v33

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v36

    const v37, 0x106000c

    invoke-virtual/range {v36 .. v37}, Landroid/content/res/Resources;->getColor(I)I

    move-result v36

    move-object/from16 v0, v33

    move/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 388
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$800(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v33

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v36

    const v37, 0x106000c

    invoke-virtual/range {v36 .. v37}, Landroid/content/res/Resources;->getColor(I)I

    move-result v36

    move-object/from16 v0, v33

    move/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 389
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$900(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v33

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v36

    const v37, 0x106000c

    invoke-virtual/range {v36 .. v37}, Landroid/content/res/Resources;->getColor(I)I

    move-result v36

    move-object/from16 v0, v33

    move/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 411
    .end local v8    # "checksum":Ljava/lang/String;
    .end local v10    # "fHighPressure":I
    .end local v11    # "fLowPressure":I
    .end local v12    # "formattedPressure":I
    .end local v13    # "formattedTemperature":I
    .end local v19    # "pressureFormat":Ljava/lang/String;
    .end local v20    # "pressure":D
    .end local v22    # "pressureUnit":Ljava/lang/String;
    .end local v23    # "psi":I
    .end local v24    # "rHighPressure":I
    .end local v25    # "rLowPressure":I
    .end local v29    # "tempC":I
    .end local v30    # "temp":D
    .end local v32    # "temperatureUnit":Ljava/lang/String;
    .end local v34    # "voltage":D
    :catch_0
    move-exception v9

    .line 412
    .local v9, "e":Ljava/lang/NumberFormatException;
    const-string v33, "mTPMS"

    const-string v36, "Malformed message, unexpected value"

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 278
    .end local v9    # "e":Ljava/lang/NumberFormatException;
    .restart local v10    # "fHighPressure":I
    .restart local v11    # "fLowPressure":I
    .restart local v13    # "formattedTemperature":I
    .restart local v19    # "pressureFormat":Ljava/lang/String;
    .restart local v20    # "pressure":D
    .restart local v22    # "pressureUnit":Ljava/lang/String;
    .restart local v23    # "psi":I
    .restart local v24    # "rHighPressure":I
    .restart local v25    # "rLowPressure":I
    .restart local v29    # "tempC":I
    .restart local v30    # "temp":D
    .restart local v32    # "temperatureUnit":Ljava/lang/String;
    .restart local v34    # "voltage":D
    :cond_a
    :try_start_1
    const-string v33, "2"

    move-object/from16 v0, v19

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v33

    if-eqz v33, :cond_b

    .line 280
    move/from16 v0, v23

    int-to-double v0, v0

    move-wide/from16 v36, v0

    const-wide v38, 0x3fb1ffa30524ab29L    # 0.070306957965539

    mul-double v20, v36, v38

    .line 281
    const-string v22, "Kg-f"

    goto/16 :goto_2

    .line 282
    :cond_b
    const-string v33, "3"

    move-object/from16 v0, v19

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v33

    if-eqz v33, :cond_5

    .line 284
    move/from16 v0, v23

    int-to-double v0, v0

    move-wide/from16 v36, v0

    const-wide v38, 0x3fb1a68c52be7bc2L    # 0.0689475729

    mul-double v20, v36, v38

    .line 285
    const-string v22, "Bar"

    goto/16 :goto_2

    .line 306
    .restart local v8    # "checksum":Ljava/lang/String;
    .restart local v12    # "formattedPressure":I
    :cond_c
    move/from16 v0, v23

    if-lt v0, v10, :cond_d

    .line 307
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    const/16 v36, 0x2

    move-object/from16 v0, v33

    move/from16 v1, v36

    invoke-static {v0, v1}, Lorg/thecongers/mtpms/MainActivity;->access$202(Lorg/thecongers/mtpms/MainActivity;I)I

    goto/16 :goto_3

    .line 309
    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    const/16 v36, 0x0

    move-object/from16 v0, v33

    move/from16 v1, v36

    invoke-static {v0, v1}, Lorg/thecongers/mtpms/MainActivity;->access$202(Lorg/thecongers/mtpms/MainActivity;I)I

    goto/16 :goto_3

    .line 315
    :cond_e
    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v33

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_8

    .line 316
    const-string v33, "mTPMS"

    const-string v36, "Rear ID matched"

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 318
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$000(Lorg/thecongers/mtpms/MainActivity;)Landroid/content/SharedPreferences;

    move-result-object v33

    const-string v36, "prefDataLogging"

    const/16 v37, 0x0

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    move/from16 v2, v37

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v33

    if-eqz v33, :cond_10

    .line 320
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$100(Lorg/thecongers/mtpms/MainActivity;)Lorg/thecongers/mtpms/LogData;

    move-result-object v33

    if-nez v33, :cond_f

    .line 321
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    new-instance v36, Lorg/thecongers/mtpms/LogData;

    invoke-direct/range {v36 .. v36}, Lorg/thecongers/mtpms/LogData;-><init>()V

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-static {v0, v1}, Lorg/thecongers/mtpms/MainActivity;->access$102(Lorg/thecongers/mtpms/MainActivity;Lorg/thecongers/mtpms/LogData;)Lorg/thecongers/mtpms/LogData;

    .line 323
    :cond_f
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$100(Lorg/thecongers/mtpms/MainActivity;)Lorg/thecongers/mtpms/LogData;

    move-result-object v33

    const-string v36, "rear"

    invoke-static/range {v23 .. v23}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v37

    invoke-static/range {v29 .. v29}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v38

    invoke-static/range {v34 .. v35}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    move-object/from16 v2, v37

    move-object/from16 v3, v38

    move-object/from16 v4, v39

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/thecongers/mtpms/LogData;->write(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 327
    :cond_10
    move/from16 v0, v23

    move/from16 v1, v25

    if-gt v0, v1, :cond_11

    .line 328
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    const/16 v36, 0x1

    move-object/from16 v0, v33

    move/from16 v1, v36

    invoke-static {v0, v1}, Lorg/thecongers/mtpms/MainActivity;->access$602(Lorg/thecongers/mtpms/MainActivity;I)I

    .line 334
    :goto_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$700(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v33

    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v12}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v37

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const-string v37, " "

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 335
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$800(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v33

    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v13}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v37

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const-string v37, " "

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 336
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$900(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v33

    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    const-string v37, "%.2f"

    const/16 v38, 0x1

    move/from16 v0, v38

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v38, v0

    const/16 v39, 0x0

    invoke-static/range {v34 .. v35}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v40

    aput-object v40, v38, v39

    invoke-static/range {v37 .. v38}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v37

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const-string v37, " V"

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_4

    .line 329
    :cond_11
    move/from16 v0, v23

    move/from16 v1, v24

    if-lt v0, v1, :cond_12

    .line 330
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    const/16 v36, 0x2

    move-object/from16 v0, v33

    move/from16 v1, v36

    invoke-static {v0, v1}, Lorg/thecongers/mtpms/MainActivity;->access$602(Lorg/thecongers/mtpms/MainActivity;I)I

    goto/16 :goto_8

    .line 332
    :cond_12
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    const/16 v36, 0x0

    move-object/from16 v0, v33

    move/from16 v1, v36

    invoke-static {v0, v1}, Lorg/thecongers/mtpms/MainActivity;->access$602(Lorg/thecongers/mtpms/MainActivity;I)I

    goto/16 :goto_8

    .line 344
    :cond_13
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$200(Lorg/thecongers/mtpms/MainActivity;)I

    move-result v33

    const/16 v36, 0x1

    move/from16 v0, v33

    move/from16 v1, v36

    if-ne v0, v1, :cond_14

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$600(Lorg/thecongers/mtpms/MainActivity;)I

    move-result v33

    if-nez v33, :cond_14

    .line 345
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$1000(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v33

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v36

    const v37, 0x7f0d001d

    invoke-virtual/range {v36 .. v37}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 346
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v36

    const v37, 0x7f0d001d

    invoke-virtual/range {v36 .. v37}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-static {v0, v1}, Lorg/thecongers/mtpms/MainActivity;->access$1200(Lorg/thecongers/mtpms/MainActivity;Ljava/lang/String;)V

    goto/16 :goto_5

    .line 347
    :cond_14
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$200(Lorg/thecongers/mtpms/MainActivity;)I

    move-result v33

    const/16 v36, 0x2

    move/from16 v0, v33

    move/from16 v1, v36

    if-ne v0, v1, :cond_15

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$600(Lorg/thecongers/mtpms/MainActivity;)I

    move-result v33

    if-nez v33, :cond_15

    .line 348
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$1000(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v33

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v36

    const v37, 0x7f0d0019

    invoke-virtual/range {v36 .. v37}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 349
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v36

    const v37, 0x7f0d0019

    invoke-virtual/range {v36 .. v37}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-static {v0, v1}, Lorg/thecongers/mtpms/MainActivity;->access$1200(Lorg/thecongers/mtpms/MainActivity;Ljava/lang/String;)V

    goto/16 :goto_5

    .line 350
    :cond_15
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$600(Lorg/thecongers/mtpms/MainActivity;)I

    move-result v33

    const/16 v36, 0x1

    move/from16 v0, v33

    move/from16 v1, v36

    if-ne v0, v1, :cond_16

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$200(Lorg/thecongers/mtpms/MainActivity;)I

    move-result v33

    if-nez v33, :cond_16

    .line 351
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$1000(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v33

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v36

    const v37, 0x7f0d001e

    invoke-virtual/range {v36 .. v37}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 352
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v36

    const v37, 0x7f0d001e

    invoke-virtual/range {v36 .. v37}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-static {v0, v1}, Lorg/thecongers/mtpms/MainActivity;->access$1200(Lorg/thecongers/mtpms/MainActivity;Ljava/lang/String;)V

    goto/16 :goto_5

    .line 353
    :cond_16
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$600(Lorg/thecongers/mtpms/MainActivity;)I

    move-result v33

    const/16 v36, 0x2

    move/from16 v0, v33

    move/from16 v1, v36

    if-ne v0, v1, :cond_17

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$200(Lorg/thecongers/mtpms/MainActivity;)I

    move-result v33

    if-nez v33, :cond_17

    .line 354
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$1000(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v33

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v36

    const v37, 0x7f0d001a

    invoke-virtual/range {v36 .. v37}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 355
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v36

    const v37, 0x7f0d001a

    invoke-virtual/range {v36 .. v37}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-static {v0, v1}, Lorg/thecongers/mtpms/MainActivity;->access$1200(Lorg/thecongers/mtpms/MainActivity;Ljava/lang/String;)V

    goto/16 :goto_5

    .line 356
    :cond_17
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$200(Lorg/thecongers/mtpms/MainActivity;)I

    move-result v33

    const/16 v36, 0x1

    move/from16 v0, v33

    move/from16 v1, v36

    if-ne v0, v1, :cond_18

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$600(Lorg/thecongers/mtpms/MainActivity;)I

    move-result v33

    const/16 v36, 0x1

    move/from16 v0, v33

    move/from16 v1, v36

    if-ne v0, v1, :cond_18

    .line 357
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$1000(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v33

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v36

    const v37, 0x7f0d001c

    invoke-virtual/range {v36 .. v37}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 358
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v36

    const v37, 0x7f0d001c

    invoke-virtual/range {v36 .. v37}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-static {v0, v1}, Lorg/thecongers/mtpms/MainActivity;->access$1200(Lorg/thecongers/mtpms/MainActivity;Ljava/lang/String;)V

    goto/16 :goto_5

    .line 359
    :cond_18
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$200(Lorg/thecongers/mtpms/MainActivity;)I

    move-result v33

    const/16 v36, 0x2

    move/from16 v0, v33

    move/from16 v1, v36

    if-ne v0, v1, :cond_19

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$600(Lorg/thecongers/mtpms/MainActivity;)I

    move-result v33

    const/16 v36, 0x2

    move/from16 v0, v33

    move/from16 v1, v36

    if-ne v0, v1, :cond_19

    .line 360
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$1000(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v33

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v36

    const v37, 0x7f0d0017

    invoke-virtual/range {v36 .. v37}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 361
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v36

    const v37, 0x7f0d0017

    invoke-virtual/range {v36 .. v37}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-static {v0, v1}, Lorg/thecongers/mtpms/MainActivity;->access$1200(Lorg/thecongers/mtpms/MainActivity;Ljava/lang/String;)V

    goto/16 :goto_5

    .line 362
    :cond_19
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$200(Lorg/thecongers/mtpms/MainActivity;)I

    move-result v33

    const/16 v36, 0x1

    move/from16 v0, v33

    move/from16 v1, v36

    if-ne v0, v1, :cond_1a

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$600(Lorg/thecongers/mtpms/MainActivity;)I

    move-result v33

    const/16 v36, 0x2

    move/from16 v0, v33

    move/from16 v1, v36

    if-ne v0, v1, :cond_1a

    .line 363
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$1000(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v33

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v36

    const v37, 0x7f0d001b

    invoke-virtual/range {v36 .. v37}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 364
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v36

    const v37, 0x7f0d001b

    invoke-virtual/range {v36 .. v37}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-static {v0, v1}, Lorg/thecongers/mtpms/MainActivity;->access$1200(Lorg/thecongers/mtpms/MainActivity;Ljava/lang/String;)V

    goto/16 :goto_5

    .line 365
    :cond_1a
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$200(Lorg/thecongers/mtpms/MainActivity;)I

    move-result v33

    const/16 v36, 0x2

    move/from16 v0, v33

    move/from16 v1, v36

    if-ne v0, v1, :cond_9

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$600(Lorg/thecongers/mtpms/MainActivity;)I

    move-result v33

    const/16 v36, 0x1

    move/from16 v0, v33

    move/from16 v1, v36

    if-ne v0, v1, :cond_9

    .line 366
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$1000(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v33

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v36

    const v37, 0x7f0d0018

    invoke-virtual/range {v36 .. v37}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 367
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v36

    const v37, 0x7f0d0018

    invoke-virtual/range {v36 .. v37}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-static {v0, v1}, Lorg/thecongers/mtpms/MainActivity;->access$1200(Lorg/thecongers/mtpms/MainActivity;Ljava/lang/String;)V

    goto/16 :goto_5

    .line 374
    :cond_1b
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$1500(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/LinearLayout;

    move-result-object v33

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v36, v0

    invoke-static/range {v36 .. v36}, Lorg/thecongers/mtpms/MainActivity;->access$1600(Lorg/thecongers/mtpms/MainActivity;)Landroid/graphics/drawable/Drawable;

    move-result-object v36

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_6

    .line 379
    :cond_1c
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$1700(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/LinearLayout;

    move-result-object v33

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v36, v0

    invoke-static/range {v36 .. v36}, Lorg/thecongers/mtpms/MainActivity;->access$1600(Lorg/thecongers/mtpms/MainActivity;)Landroid/graphics/drawable/Drawable;

    move-result-object v36

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_7

    .line 391
    :cond_1d
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$200(Lorg/thecongers/mtpms/MainActivity;)I

    move-result v33

    if-nez v33, :cond_1e

    .line 392
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$1500(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/LinearLayout;

    move-result-object v33

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v36, v0

    invoke-static/range {v36 .. v36}, Lorg/thecongers/mtpms/MainActivity;->access$2000(Lorg/thecongers/mtpms/MainActivity;)Landroid/graphics/drawable/Drawable;

    move-result-object v36

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 396
    :goto_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$600(Lorg/thecongers/mtpms/MainActivity;)I

    move-result v33

    if-nez v33, :cond_1f

    .line 397
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$1700(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/LinearLayout;

    move-result-object v33

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v36, v0

    invoke-static/range {v36 .. v36}, Lorg/thecongers/mtpms/MainActivity;->access$2000(Lorg/thecongers/mtpms/MainActivity;)Landroid/graphics/drawable/Drawable;

    move-result-object v36

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 401
    :goto_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$1800(Lorg/thecongers/mtpms/MainActivity;)Landroid/view/View;

    move-result-object v33

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v36

    const v37, 0x106000c

    invoke-virtual/range {v36 .. v37}, Landroid/content/res/Resources;->getColor(I)I

    move-result v36

    move-object/from16 v0, v33

    move/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 402
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$1000(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v33

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v36, v0

    invoke-static/range {v36 .. v36}, Lorg/thecongers/mtpms/MainActivity;->access$2200(Lorg/thecongers/mtpms/MainActivity;)Landroid/graphics/drawable/Drawable;

    move-result-object v36

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 403
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$1000(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v33

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v36

    const v37, 0x106000b

    invoke-virtual/range {v36 .. v37}, Landroid/content/res/Resources;->getColor(I)I

    move-result v36

    move-object/from16 v0, v33

    move/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 404
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$300(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v33

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v36

    const v37, 0x106000b

    invoke-virtual/range {v36 .. v37}, Landroid/content/res/Resources;->getColor(I)I

    move-result v36

    move-object/from16 v0, v33

    move/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 405
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$400(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v33

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v36

    const v37, 0x106000b

    invoke-virtual/range {v36 .. v37}, Landroid/content/res/Resources;->getColor(I)I

    move-result v36

    move-object/from16 v0, v33

    move/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 406
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$500(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v33

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v36

    const v37, 0x106000b

    invoke-virtual/range {v36 .. v37}, Landroid/content/res/Resources;->getColor(I)I

    move-result v36

    move-object/from16 v0, v33

    move/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 407
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$700(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v33

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v36

    const v37, 0x106000b

    invoke-virtual/range {v36 .. v37}, Landroid/content/res/Resources;->getColor(I)I

    move-result v36

    move-object/from16 v0, v33

    move/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 408
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$800(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v33

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v36

    const v37, 0x106000b

    invoke-virtual/range {v36 .. v37}, Landroid/content/res/Resources;->getColor(I)I

    move-result v36

    move-object/from16 v0, v33

    move/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 409
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$900(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v33

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v36

    const v37, 0x106000b

    invoke-virtual/range {v36 .. v37}, Landroid/content/res/Resources;->getColor(I)I

    move-result v36

    move-object/from16 v0, v33

    move/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    goto/16 :goto_0

    .line 394
    :cond_1e
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$1500(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/LinearLayout;

    move-result-object v33

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v36, v0

    invoke-static/range {v36 .. v36}, Lorg/thecongers/mtpms/MainActivity;->access$2100(Lorg/thecongers/mtpms/MainActivity;)Landroid/graphics/drawable/Drawable;

    move-result-object v36

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_9

    .line 399
    :cond_1f
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lorg/thecongers/mtpms/MainActivity;->access$1700(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/LinearLayout;

    move-result-object v33

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/thecongers/mtpms/MainActivity$1;->this$0:Lorg/thecongers/mtpms/MainActivity;

    move-object/from16 v36, v0

    invoke-static/range {v36 .. v36}, Lorg/thecongers/mtpms/MainActivity;->access$2100(Lorg/thecongers/mtpms/MainActivity;)Landroid/graphics/drawable/Drawable;

    move-result-object v36

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_a

    .line 417
    .end local v6    # "calculatedCheckSum":I
    .end local v7    # "checkID":Z
    .end local v8    # "checksum":Ljava/lang/String;
    .end local v10    # "fHighPressure":I
    .end local v11    # "fLowPressure":I
    .end local v12    # "formattedPressure":I
    .end local v13    # "formattedTemperature":I
    .end local v14    # "hexData":[Ljava/lang/String;
    .end local v15    # "i":I
    .end local v16    # "position":Ljava/lang/String;
    .end local v17    # "prefFrontID":Ljava/lang/String;
    .end local v18    # "prefRearID":Ljava/lang/String;
    .end local v19    # "pressureFormat":Ljava/lang/String;
    .end local v20    # "pressure":D
    .end local v22    # "pressureUnit":Ljava/lang/String;
    .end local v23    # "psi":I
    .end local v24    # "rHighPressure":I
    .end local v25    # "rLowPressure":I
    .end local v26    # "readBuf":[B
    .end local v27    # "sbhex":Ljava/lang/StringBuilder;
    .end local v28    # "sensorID":Ljava/lang/StringBuilder;
    .end local v29    # "tempC":I
    .end local v30    # "temp":D
    .end local v32    # "temperatureUnit":Ljava/lang/String;
    .end local v34    # "voltage":D
    :cond_20
    const-string v33, "mTPMS"

    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    const-string v37, "Malformed message, message length: "

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, p1

    iget v0, v0, Landroid/os/Message;->arg1:I

    move/from16 v37, v0

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 210
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
