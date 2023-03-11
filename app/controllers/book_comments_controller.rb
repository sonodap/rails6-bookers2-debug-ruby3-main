class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(comment_params)
    comment.book_id = @book.id
    if comment.save
      # render先にjsファイルを指定
      render :book_comments
    else
      render :eroor
    end
  end

  def destroy
    BookComment.find(params[:id]).destroy
    # render先にjsファイルを指定
    @book = Book.find(params[:book_id])
    render :book_comments
  end

  def comment_params
    params.require(:book_comment).permit(:comment)
  end
end
