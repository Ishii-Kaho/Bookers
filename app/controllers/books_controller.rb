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
    book = Book.new(book_params)
    # データをデータベースに保存するためのsaveメソッド実行
    if book.save
    # logger.debug("標準出力とログファイルに記録される")
    # 詳細ページへリダイレクト
     redirect_to book_path(book.id)
    else
      rander "new"
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
      if @book.update(book_params)
        redirect_to book_path(@book), notice: "You have updated book successfully."
      else
        render "edit"
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