.class Lorg/thecongers/mtpms/MainActivity$3;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


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
    .line 858
    iput-object p1, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0
    .param p1, "sensor"    # Landroid/hardware/Sensor;
    .param p2, "accuracy"    # I

    .prologue
    .line 864
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 12
    .param p1, "event"    # Landroid/hardware/SensorEvent;

    .prologue
    .line 868
    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v8}, Lorg/thecongers/mtpms/MainActivity;->access$000(Lorg/thecongers/mtpms/MainActivity;)Landroid/content/SharedPreferences;

    move-result-object v8

    const-string v9, "prefAutoNightMode"

    const/4 v10, 0x0

    invoke-interface {v8, v9, v10}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v8

    if-eqz v8, :cond_0

    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v8}, Lorg/thecongers/mtpms/MainActivity;->access$000(Lorg/thecongers/mtpms/MainActivity;)Landroid/content/SharedPreferences;

    move-result-object v8

    const-string v9, "prefNightMode"

    const/4 v10, 0x0

    invoke-interface {v8, v9, v10}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v8

    if-nez v8, :cond_0

    .line 869
    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v8}, Lorg/thecongers/mtpms/MainActivity;->access$000(Lorg/thecongers/mtpms/MainActivity;)Landroid/content/SharedPreferences;

    move-result-object v8

    const-string v9, "prefAutoNightModeDelay"

    const-string v10, "30"

    invoke-interface {v8, v9, v10}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    mul-int/lit16 v1, v8, 0x3e8

    .line 870
    .local v1, "delay":I
    iget-object v8, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v8}, Landroid/hardware/Sensor;->getType()I

    move-result v8

    const/4 v9, 0x5

    if-ne v8, v9, :cond_0

    .line 871
    iget-object v8, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v9, 0x0

    aget v0, v8, v9

    .line 872
    .local v0, "currentReading":F
    const-wide/high16 v4, 0x4034000000000000L    # 20.0

    .line 873
    .local v4, "darkThreshold":D
    float-to-double v8, v0

    cmpg-double v8, v8, v4

    if-gez v8, :cond_4

    .line 874
    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    const-wide/16 v10, 0x0

    invoke-static {v8, v10, v11}, Lorg/thecongers/mtpms/MainActivity;->access$2902(Lorg/thecongers/mtpms/MainActivity;J)J

    .line 875
    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v8}, Lorg/thecongers/mtpms/MainActivity;->access$3000(Lorg/thecongers/mtpms/MainActivity;)J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v8, v8, v10

    if-nez v8, :cond_1

    .line 876
    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    invoke-static {v8, v10, v11}, Lorg/thecongers/mtpms/MainActivity;->access$3002(Lorg/thecongers/mtpms/MainActivity;J)J

    .line 947
    .end local v0    # "currentReading":F
    .end local v1    # "delay":I
    .end local v4    # "darkThreshold":D
    :cond_0
    :goto_0
    return-void

    .line 878
    .restart local v0    # "currentReading":F
    .restart local v1    # "delay":I
    .restart local v4    # "darkThreshold":D
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 879
    .local v2, "currentTime":J
    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v8}, Lorg/thecongers/mtpms/MainActivity;->access$3000(Lorg/thecongers/mtpms/MainActivity;)J

    move-result-wide v8

    sub-long v6, v2, v8

    .line 880
    .local v6, "duration":J
    int-to-long v8, v1

    cmp-long v8, v6, v8

    if-ltz v8, :cond_0

    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v8}, Lorg/thecongers/mtpms/MainActivity;->access$1300(Lorg/thecongers/mtpms/MainActivity;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 881
    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    const/4 v9, 0x1

    invoke-static {v8, v9}, Lorg/thecongers/mtpms/MainActivity;->access$1302(Lorg/thecongers/mtpms/MainActivity;Z)Z

    .line 882
    const-string v8, "mTPMS"

    const-string v9, "Its dark"

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 884
    iget-object v9, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    const v10, 0x7f0b0040

    invoke-virtual {v8, v10}, Lorg/thecongers/mtpms/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/LinearLayout;

    invoke-static {v9, v8}, Lorg/thecongers/mtpms/MainActivity;->access$1502(Lorg/thecongers/mtpms/MainActivity;Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    .line 885
    iget-object v9, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    const v10, 0x7f0b0044

    invoke-virtual {v8, v10}, Lorg/thecongers/mtpms/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/LinearLayout;

    invoke-static {v9, v8}, Lorg/thecongers/mtpms/MainActivity;->access$1702(Lorg/thecongers/mtpms/MainActivity;Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    .line 887
    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v8}, Lorg/thecongers/mtpms/MainActivity;->access$1800(Lorg/thecongers/mtpms/MainActivity;)Landroid/view/View;

    move-result-object v8

    iget-object v9, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-virtual {v9}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x106000c

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getColor(I)I

    move-result v9

    invoke-virtual {v8, v9}, Landroid/view/View;->setBackgroundColor(I)V

    .line 889
    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v8}, Lorg/thecongers/mtpms/MainActivity;->access$200(Lorg/thecongers/mtpms/MainActivity;)I

    move-result v8

    if-lez v8, :cond_2

    .line 890
    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v8}, Lorg/thecongers/mtpms/MainActivity;->access$1500(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/LinearLayout;

    move-result-object v8

    iget-object v9, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v9}, Lorg/thecongers/mtpms/MainActivity;->access$2100(Lorg/thecongers/mtpms/MainActivity;)Landroid/graphics/drawable/Drawable;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 894
    :goto_1
    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v8}, Lorg/thecongers/mtpms/MainActivity;->access$600(Lorg/thecongers/mtpms/MainActivity;)I

    move-result v8

    if-lez v8, :cond_3

    .line 895
    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v8}, Lorg/thecongers/mtpms/MainActivity;->access$1700(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/LinearLayout;

    move-result-object v8

    iget-object v9, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v9}, Lorg/thecongers/mtpms/MainActivity;->access$2100(Lorg/thecongers/mtpms/MainActivity;)Landroid/graphics/drawable/Drawable;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 899
    :goto_2
    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v8}, Lorg/thecongers/mtpms/MainActivity;->access$1000(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v8

    iget-object v9, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v9}, Lorg/thecongers/mtpms/MainActivity;->access$2200(Lorg/thecongers/mtpms/MainActivity;)Landroid/graphics/drawable/Drawable;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 900
    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v8}, Lorg/thecongers/mtpms/MainActivity;->access$300(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v8

    iget-object v9, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-virtual {v9}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x106000b

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getColor(I)I

    move-result v9

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 901
    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v8}, Lorg/thecongers/mtpms/MainActivity;->access$400(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v8

    iget-object v9, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-virtual {v9}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x106000b

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getColor(I)I

    move-result v9

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 902
    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v8}, Lorg/thecongers/mtpms/MainActivity;->access$500(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v8

    iget-object v9, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-virtual {v9}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x106000b

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getColor(I)I

    move-result v9

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 903
    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v8}, Lorg/thecongers/mtpms/MainActivity;->access$700(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v8

    iget-object v9, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-virtual {v9}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x106000b

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getColor(I)I

    move-result v9

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 904
    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v8}, Lorg/thecongers/mtpms/MainActivity;->access$800(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v8

    iget-object v9, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-virtual {v9}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x106000b

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getColor(I)I

    move-result v9

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 905
    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v8}, Lorg/thecongers/mtpms/MainActivity;->access$900(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v8

    iget-object v9, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-virtual {v9}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x106000b

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getColor(I)I

    move-result v9

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 906
    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v8}, Lorg/thecongers/mtpms/MainActivity;->access$1000(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v8

    iget-object v9, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-virtual {v9}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x106000b

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getColor(I)I

    move-result v9

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTextColor(I)V

    goto/16 :goto_0

    .line 892
    :cond_2
    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v8}, Lorg/thecongers/mtpms/MainActivity;->access$1500(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/LinearLayout;

    move-result-object v8

    iget-object v9, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v9}, Lorg/thecongers/mtpms/MainActivity;->access$2000(Lorg/thecongers/mtpms/MainActivity;)Landroid/graphics/drawable/Drawable;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_1

    .line 897
    :cond_3
    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v8}, Lorg/thecongers/mtpms/MainActivity;->access$1700(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/LinearLayout;

    move-result-object v8

    iget-object v9, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v9}, Lorg/thecongers/mtpms/MainActivity;->access$2000(Lorg/thecongers/mtpms/MainActivity;)Landroid/graphics/drawable/Drawable;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_2

    .line 910
    .end local v2    # "currentTime":J
    .end local v6    # "duration":J
    :cond_4
    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    const-wide/16 v10, 0x0

    invoke-static {v8, v10, v11}, Lorg/thecongers/mtpms/MainActivity;->access$3002(Lorg/thecongers/mtpms/MainActivity;J)J

    .line 911
    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v8}, Lorg/thecongers/mtpms/MainActivity;->access$2900(Lorg/thecongers/mtpms/MainActivity;)J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v8, v8, v10

    if-nez v8, :cond_5

    .line 912
    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    invoke-static {v8, v10, v11}, Lorg/thecongers/mtpms/MainActivity;->access$2902(Lorg/thecongers/mtpms/MainActivity;J)J

    goto/16 :goto_0

    .line 914
    :cond_5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 915
    .restart local v2    # "currentTime":J
    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v8}, Lorg/thecongers/mtpms/MainActivity;->access$2900(Lorg/thecongers/mtpms/MainActivity;)J

    move-result-wide v8

    sub-long v6, v2, v8

    .line 916
    .restart local v6    # "duration":J
    int-to-long v8, v1

    cmp-long v8, v6, v8

    if-ltz v8, :cond_0

    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v8}, Lorg/thecongers/mtpms/MainActivity;->access$1300(Lorg/thecongers/mtpms/MainActivity;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 917
    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    const/4 v9, 0x0

    invoke-static {v8, v9}, Lorg/thecongers/mtpms/MainActivity;->access$1302(Lorg/thecongers/mtpms/MainActivity;Z)Z

    .line 918
    const-string v8, "mTPMS"

    const-string v9, "Its light"

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 920
    iget-object v9, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    const v10, 0x7f0b0040

    invoke-virtual {v8, v10}, Lorg/thecongers/mtpms/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/LinearLayout;

    invoke-static {v9, v8}, Lorg/thecongers/mtpms/MainActivity;->access$1502(Lorg/thecongers/mtpms/MainActivity;Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    .line 921
    iget-object v9, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    const v10, 0x7f0b0044

    invoke-virtual {v8, v10}, Lorg/thecongers/mtpms/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/LinearLayout;

    invoke-static {v9, v8}, Lorg/thecongers/mtpms/MainActivity;->access$1702(Lorg/thecongers/mtpms/MainActivity;Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    .line 923
    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v8}, Lorg/thecongers/mtpms/MainActivity;->access$1800(Lorg/thecongers/mtpms/MainActivity;)Landroid/view/View;

    move-result-object v8

    iget-object v9, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-virtual {v9}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x106000b

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getColor(I)I

    move-result v9

    invoke-virtual {v8, v9}, Landroid/view/View;->setBackgroundColor(I)V

    .line 924
    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v8}, Lorg/thecongers/mtpms/MainActivity;->access$200(Lorg/thecongers/mtpms/MainActivity;)I

    move-result v8

    if-lez v8, :cond_6

    .line 925
    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v8}, Lorg/thecongers/mtpms/MainActivity;->access$1500(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/LinearLayout;

    move-result-object v8

    iget-object v9, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v9}, Lorg/thecongers/mtpms/MainActivity;->access$1600(Lorg/thecongers/mtpms/MainActivity;)Landroid/graphics/drawable/Drawable;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 929
    :goto_3
    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v8}, Lorg/thecongers/mtpms/MainActivity;->access$600(Lorg/thecongers/mtpms/MainActivity;)I

    move-result v8

    if-lez v8, :cond_7

    .line 930
    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v8}, Lorg/thecongers/mtpms/MainActivity;->access$1700(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/LinearLayout;

    move-result-object v8

    iget-object v9, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v9}, Lorg/thecongers/mtpms/MainActivity;->access$1600(Lorg/thecongers/mtpms/MainActivity;)Landroid/graphics/drawable/Drawable;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 934
    :goto_4
    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v8}, Lorg/thecongers/mtpms/MainActivity;->access$1000(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v8

    iget-object v9, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v9}, Lorg/thecongers/mtpms/MainActivity;->access$1900(Lorg/thecongers/mtpms/MainActivity;)Landroid/graphics/drawable/Drawable;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 935
    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v8}, Lorg/thecongers/mtpms/MainActivity;->access$300(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v8

    iget-object v9, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-virtual {v9}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x106000c

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getColor(I)I

    move-result v9

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 936
    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v8}, Lorg/thecongers/mtpms/MainActivity;->access$400(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v8

    iget-object v9, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-virtual {v9}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x106000c

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getColor(I)I

    move-result v9

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 937
    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v8}, Lorg/thecongers/mtpms/MainActivity;->access$500(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v8

    iget-object v9, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-virtual {v9}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x106000c

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getColor(I)I

    move-result v9

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 938
    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v8}, Lorg/thecongers/mtpms/MainActivity;->access$700(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v8

    iget-object v9, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-virtual {v9}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x106000c

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getColor(I)I

    move-result v9

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 939
    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v8}, Lorg/thecongers/mtpms/MainActivity;->access$800(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v8

    iget-object v9, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-virtual {v9}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x106000c

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getColor(I)I

    move-result v9

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 940
    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v8}, Lorg/thecongers/mtpms/MainActivity;->access$900(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v8

    iget-object v9, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-virtual {v9}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x106000c

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getColor(I)I

    move-result v9

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 941
    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v8}, Lorg/thecongers/mtpms/MainActivity;->access$1000(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/TextView;

    move-result-object v8

    iget-object v9, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-virtual {v9}, Lorg/thecongers/mtpms/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x106000c

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getColor(I)I

    move-result v9

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTextColor(I)V

    goto/16 :goto_0

    .line 927
    :cond_6
    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v8}, Lorg/thecongers/mtpms/MainActivity;->access$1500(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/LinearLayout;

    move-result-object v8

    iget-object v9, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v9}, Lorg/thecongers/mtpms/MainActivity;->access$1400(Lorg/thecongers/mtpms/MainActivity;)Landroid/graphics/drawable/Drawable;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_3

    .line 932
    :cond_7
    iget-object v8, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v8}, Lorg/thecongers/mtpms/MainActivity;->access$1700(Lorg/thecongers/mtpms/MainActivity;)Landroid/widget/LinearLayout;

    move-result-object v8

    iget-object v9, p0, Lorg/thecongers/mtpms/MainActivity$3;->this$0:Lorg/thecongers/mtpms/MainActivity;

    invoke-static {v9}, Lorg/thecongers/mtpms/MainActivity;->access$1400(Lorg/thecongers/mtpms/MainActivity;)Landroid/graphics/drawable/Drawable;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_4
.end method
