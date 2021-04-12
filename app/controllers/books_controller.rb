class BooksController < ApplicationController
  def top
  end

  def index
    @books = Book.all
    @books = Book.order(id: "DESC")
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    # データを新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    # データをデータベースに保存するためのsaveメソッド実行
    if @book.save
    # もし投稿に成功したらBook was successfully created.という通知を出します
      flash[:notice] = 'Book was successfully created.'
    # 詳細ページへリダイレクト
      redirect_to book_path(@book.id)
    else
    # 失敗した場合はindexページに戻る
      @books = Book.all.order(id: "DESC")
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
      if @book.update(book_params)
        flash[:notice] = "You have updated book successfully."
        redirect_to book_path(@book)
      else
        render :edit
      end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end