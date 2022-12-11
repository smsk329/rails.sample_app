class ListsController < ApplicationController
  def new
    @list = List.new
  end

      def create
        # データを受け取り、新規登録するためのインスタンスを作成
        list = List.new(list_params)
        # データをデータベースに保存するメソッドを実行
        list.save
        # 最後に、トップ画面へ遷移する　⇒変更。詳細画面へ遷移
        redirect_to list_path(list.id)
      end


  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

      def update
        list = List.find(params[:id])
        list.update(list_params)
        redirect_to list_path(list.id)
      end


        # 「private」ここから下はこのコントローラ内でしか呼び出せません。の境界線のようなもの
        private
          def list_params
            params.require(:list).permit(:title, :body, :image)
          end

end