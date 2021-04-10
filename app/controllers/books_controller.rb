class BooksController < ApplicationController
  def top
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    # viewに渡すためのインスタンス変数に空のモデルオブジェクトを生成する
    # @book = Book.new
  end

  def create
    # データを新規登録するためのインスタンス作成
    book = Book.new(book_params)
    # データをデータベースに保存するためのsaveメソッド実行
    book.save
    # logger.debug("標準出力とログファイルに記録される")
    # 詳細ページへリダイレクト
    redirect_to books_path
  end

  def edit
  end

  private
  def book_params
    params.permit(:title, :body)
  end
end