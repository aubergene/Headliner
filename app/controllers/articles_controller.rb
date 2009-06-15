class ArticlesController < ApplicationController

  def index
    redirect_to Article.random
  end

  def show
    if params[:id].blank?
      redirect_to Article.random
    end

    @article = Article.find(params[:id])
    @sources = Source.find(:all, :order => 'RAND()')

    @total = session[:total].to_i
    @score = session[:score].to_i
  end

  def vote
    @article = Article.find(params[:article_id])
    @source = Source.find(params[:source_id])
    @vote = Vote.create!(:article => @article, :source => @source)
    calculate_score
    @article = Article.random
    respond_to do |format|
      format.html { redirect_to @article }
      format.js
    end
  end

  def result
    @vote = Vote.find(params[:id])
    render :partial => 'result'
  end

  def hello
    render :text => "<p>Hello, the time is <b>" + DateTime.now.to_s + "</b></p>"
  end

  def list
    @articles = Article.all(:first)
  end

  private

  def calculate_score
    @total = session[:total].to_i + 1
    @score = session[:score].to_i
    @score += 1 if @vote.correct

    session[:score] = @score
    session[:total] = @total
  end


end
