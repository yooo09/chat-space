class GroupsController < ApplicationController

  def index
  end
  
  def new
    #@groupに空のインスタンスを代入。foum_forで使用する為の変
    @group = Group.new
    #<<は配列に要素を追加
    #グループを新規作成する時はログイン中のユーザーを必ず含めたいためあらかじめ追加
    @group.users << current_user
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      #redirect_toは、新たなリクエストがされたのと同じ動き
      redirect_to root_path, notice: 'グループを作成しました'
    else
      #保存がうまく行かなかった場合は新規登録画面を表示
      #renderはそのままビューが表示
      render :new
    end  
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to root_path, notice: 'グループを更新しました'
    else
      render :edit
    end
  end

  private
  def group_params
    #配列に対して保存を許可したい場合は、キーの名称と関連づけてバリューに「[]」と記述
    params.require(:group).permit(:name, user_ids: [])
  end


end
