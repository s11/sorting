class ArticlesController < ApplicationController
#Link used http://blog.nominet.org.uk/tech/2006/03/06/using-acts_as_list-in-ruby-on-rails/ for acts as list
# ibrm@axisbank.com  Axis bank mail id
  ####This method will call during drag and drop operations
  def sort
    @articles_array = params[:article].to_a
    @articles_array.each_with_index do |a,index|
      @article = Article.find(a.to_i)
      @article.update_attributes!(:position => index+1)
    end
    render :nothing => true
  end

  ##This method will call during lower down the article
  def down
    @article = Article.find(params[:id])
    @article.move_lower
    redirect_to articles_path
  end

  ##This method will call during move upper the article
  def up
    @article = Article.find(params[:id])
    @article.move_higher
    redirect_to articles_path
  end
  # GET /articles
  # GET /articles.xml
  def index
    @articles = Article.all(:order => "position")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.xml
  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.xml
  def new
    @article = Article.new
    @categories = Category.all
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.xml
  def create
    puts ":::::::::::::::::::::::::::::::::::::::::"
    puts params[:category]
    puts ":::::::::::::::::::::::::::::::::::::::::"
    @article = Article.new(params[:article])
    respond_to do |format|
      if @article.save
        flash[:notice] = 'Article was successfully created.'
        #format.html { redirect_to(@article) }
        format.html { redirect_to(articles_path) }
        format.xml  { render :xml => @article, :status => :created, :location => @article }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.xml
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        flash[:notice] = 'Article was successfully updated.'
        #format.html { redirect_to(@article) }
        format.html { redirect_to(articles_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.xml
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to(articles_url) }
      format.xml  { head :ok }
    end
  end
end
