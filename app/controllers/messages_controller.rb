class MessagesController < ApplicationController
  before_action :set_group
  
  def index
    #Messageモデルの新しいインスタンスである@message
    @message = Message.new
    #n + 1 問題」を避けるために、includes(:user)の記述
    #グループに所属する全てのメッセージである@messages
    @messages = @group.messages.includes(:user)
  end

  def create
    @message = @group.messages.new(message_params)

    #保存に成功した場合
    if @message.save
      # redirect_to group_messages_path(@group), notice: 'メッセージが送信されました'
      #非同期通信を実装
      respond_to do |format|
        format.json
      end
    
      #保存に失敗した場合
    else
      @messages = @group.messages.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
  #messagesコントローラの全てのアクションで@groupを利用できるように
  def set_group
    @group = Group.find(params[:group_id])
  end

end
