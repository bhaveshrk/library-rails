class LoanedBooksController < ApplicationController
  before_action :set_loaned_book, only: %i[ show edit update destroy ]

  # GET /loaned_books or /loaned_books.json
  def index
    @books = Book.all
    @books.search(params[:search])
  end
  def your_loaned_book
    # byebug
    @book = Book.find(params[:book])
    @loaned_books = LoanedBook.new(book_id: @book.id, user_id: current_user.id, loaned_date: Time.now, due_date: Time.now + 1.month, status: "Loaned" )
    @loaned_books.save!
  end

  def change_status
    @loaned_book = LoanedBook.find(params[:id])
    if params[:status].present? && LoanedBook::STATUSES.include?(params[:status].to_sym)
      @loaned_book.update(status: params[:status])
    end
    redirect_to @loaned_book, notice: "Status updated to #{@loaned_book.status}"
  end
    

  # GET /loaned_books/1 or /loaned_books/1.json
  def show
  end

  # GET /loaned_books/new
  def new
    @loaned_book = LoanedBook.new
  end

  # GET /loaned_books/1/edit
  def edit
  end

  # POST /loaned_books or /loaned_books.json
  def create
    @loaned_book = LoanedBook.new(loaned_book_params)

    respond_to do |format|
      if @loaned_book.save
        format.html { redirect_to loaned_book_url(@loaned_book), notice: "Loaned book was successfully created." }
        format.json { render :show, status: :created, location: @loaned_book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @loaned_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loaned_books/1 or /loaned_books/1.json
  def update
    respond_to do |format|
      if @loaned_book.update(loaned_book_params)
        format.html { redirect_to loaned_book_url(@loaned_book), notice: "Loaned book was successfully updated." }
        format.json { render :show, status: :ok, location: @loaned_book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @loaned_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loaned_books/1 or /loaned_books/1.json
  def destroy
    @loaned_book.destroy

    respond_to do |format|
      format.html { redirect_to loaned_books_url, notice: "Loaned book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loaned_book
      # @loaned_book = LoanedBook.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def loaned_book_params
      params.require(:loaned_book).permit(:user_id, :book_id, :loaned_date, :due_date, :returned_date, :status)
    end
end
