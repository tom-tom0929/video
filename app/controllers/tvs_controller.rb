class TvsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
    def index
      @dorama = Tv.where(favorite: "ドラマ")
      @variety = Tv.where(favorite: "バラエティ")
      @eiga = Tv.where(favorite: "映画")
      @anime = Tv.where(favorite: "アニメ")
      @tv_like_ranks = Tv.find(Like.group(:tv_id).order('count(tv_id) desc').pluck(:tv_id))
    end
    def new
        @tvs = Tv.new
      end
    
      def create
        tv = Tv.new(tv_params)
        tv.user_id = current_user.id
        if tv.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end
      def show
        @tv = Tv.find(params[:id])
      end
      def edit
        @tv = Tv.find(params[:id])
      end
      def update
        tv = Tv.find(params[:id])
        if tv.update(tv_params)
          redirect_to :action => "show", :id => tv.id
        else
          redirect_to :action => "new"
        end
        def destroy
          tv = Tv.find(params[:id])
          tv.destroy
          redirect_to action: :index
        end
      end
      private
      def tv_params
        params.require(:tv).permit(:name, :genre, :actor, :about, :title, :image, :favorite)
      end
end
