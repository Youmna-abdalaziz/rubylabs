class ArticlesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  #http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
    def index
        @articles = Article.all
        # authorize! :read, @article
    end
    
    def show
        @article = Article.find(params[:id])
        authorize! :read, @article
    end
    
    def new
        @article = Article.new
        authorize! :create, @article

    end

    def edit
        @article = Article.find(params[:id])
        authorize! :edit, @article
    end

    def create
        @article = Article.new(article_params)
        @article.user_id = current_user.id
        #respond_with Article.create(article_params.merge(user_id: current_user.id))
        authorize! :create, @article        
        if @article.save
            redirect_to @article
          else
            render 'new'
            #redirect_to new_article_path
          end
    end

    def update
        @article = Article.find(params[:id])
        authorize! :edit, @article
       
        if @article.update(article_params)
          redirect_to @article
        else
          render 'edit'
          #redirect_to edit_article_path(@article)
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        authorize! :destroy, @article
       
        redirect_to articles_path
    end
       
    private
        def article_params
          params.require(:article).permit(:title, :text)
        end


end
