.class Landroid/support/v7/widget/ActionMenuPresenter$ActionButtonSubmenu;
.super Landroid/support/v7/internal/view/menu/MenuPopupHelper;
.source "ActionMenuPresenter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/widget/ActionMenuPresenter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ActionButtonSubmenu"
.end annotation


# instance fields
.field private mSubMenu:Landroid/support/v7/internal/view/menu/SubMenuBuilder;

.field final synthetic this$0:Landroid/support/v7/widget/ActionMenuPresenter;


# direct methods
.method public constructor <init>(Landroid/support/v7/widget/ActionMenuPresenter;Landroid/content/Context;Landroid/support/v7/internal/view/menu/SubMenuBuilder;)V
    .locals 11
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "subMenu"    # Landroid/support/v7/internal/view/menu/SubMenuBuilder;

    .prologue
    .line 686
    iput-object p1, p0, Landroid/support/v7/widget/ActionMenuPresenter$ActionButtonSubmenu;->this$0:Landroid/support/v7/widget/ActionMenuPresenter;

    .line 687
    const/4 v3, 0x0

    const/4 v4, 0x0

    sget v5, Landroid/support/v7/appcompat/R$attr;->actionOverflowMenuStyle:I

    move-object v0, p0

    move-object v1, p2

    move-object v2, p3

    invoke-direct/range {v0 .. v5}, Landroid/support/v7/internal/view/menu/MenuPopupHelper;-><init>(Landroid/content/Context;Landroid/support/v7/internal/view/menu/MenuBuilder;Landroid/view/View;ZI)V

    .line 689
    iput-object p3, p0, Landroid/support/v7/widget/ActionMenuPresenter$ActionButtonSubmenu;->mSubMenu:Landroid/support/v7/internal/view/menu/SubMenuBuilder;

    .line 691
    invoke-virtual {p3}, Landroid/support/v7/internal/view/menu/SubMenuBuilder;->getItem()Landroid/view/MenuItem;

    move-result-object v9

    check-cast v9, Landroid/support/v7/internal/view/menu/MenuItemImpl;

    .line 692
    .local v9, "item":Landroid/support/v7/internal/view/menu/MenuItemImpl;
    invoke-virtual {v9}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->isActionButton()Z

    move-result v0

    if-nez v0, :cond_0

    .line 694
    invoke-static {p1}, Landroid/support/v7/widget/ActionMenuPresenter;->access$500(Landroid/support/v7/widget/ActionMenuPresenter;)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_2

    invoke-static {p1}, Landroid/support/v7/widget/ActionMenuPresenter;->access$600(Landroid/support/v7/widget/ActionMenuPresenter;)Landroid/support/v7/internal/view/menu/MenuView;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    :goto_0
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/ActionMenuPresenter$ActionButtonSubmenu;->setAnchorView(Landroid/view/View;)V

    .line 697
    :cond_0
    iget-object v0, p1, Landroid/support/v7/widget/ActionMenuPresenter;->mPopupPresenterCallback:Landroid/support/v7/widget/ActionMenuPresenter$PopupPresenterCallback;

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/ActionMenuPresenter$ActionButtonSubmenu;->setCallback(Landroid/support/v7/internal/view/menu/MenuPresenter$Callback;)V

    .line 699
    const/4 v10, 0x0

    .line 700
    .local v10, "preserveIconSpacing":Z
    invoke-virtual {p3}, Landroid/support/v7/internal/view/menu/SubMenuBuilder;->size()I

    move-result v7

    .line 701
    .local v7, "count":I
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_1
    if-ge v8, v7, :cond_1

    .line 702
    invoke-virtual {p3, v8}, Landroid/support/v7/internal/view/menu/SubMenuBuilder;->getItem(I)Landroid/view/MenuItem;

    move-result-object v6

    .line 703
    .local v6, "childItem":Landroid/view/MenuItem;
    invoke-interface {v6}, Landroid/view/MenuItem;->isVisible()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v6}, Landroid/view/MenuItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 704
    const/4 v10, 0x1

    .line 708
    .end local v6    # "childItem":Landroid/view/MenuItem;
    :cond_1
    invoke-virtual {p0, v10}, Landroid/support/v7/widget/ActionMenuPresenter$ActionButtonSubmenu;->setForceShowIcon(Z)V

    .line 709
    return-void

    .line 694
    .end local v7    # "count":I
    .end local v8    # "i":I
    .end local v10    # "preserveIconSpacing":Z
    :cond_2
    invoke-static {p1}, Landroid/support/v7/widget/ActionMenuPresenter;->access$500(Landroid/support/v7/widget/ActionMenuPresenter;)Landroid/view/View;

    move-result-object v0

    goto :goto_0

    .line 701
    .restart local v6    # "childItem":Landroid/view/MenuItem;
    .restart local v7    # "count":I
    .restart local v8    # "i":I
    .restart local v10    # "preserveIconSpacing":Z
    :cond_3
    add-int/lit8 v8, v8, 0x1

    goto :goto_1
.end method


# virtual methods
.method public onDismiss()V
    .locals 2

    .prologue
    .line 713
    invoke-super {p0}, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->onDismiss()V

    .line 714
    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuPresenter$ActionButtonSubmenu;->this$0:Landroid/support/v7/widget/ActionMenuPresenter;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/support/v7/widget/ActionMenuPresenter;->access$702(Landroid/support/v7/widget/ActionMenuPresenter;Landroid/support/v7/widget/ActionMenuPresenter$ActionButtonSubmenu;)Landroid/support/v7/widget/ActionMenuPresenter$ActionButtonSubmenu;

    .line 715
    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuPresenter$ActionButtonSubmenu;->this$0:Landroid/support/v7/widget/ActionMenuPresenter;

    const/4 v1, 0x0

    iput v1, v0, Landroid/support/v7/widget/ActionMenuPresenter;->mOpenSubMenuId:I

    .line 716
    return-void
.end method
