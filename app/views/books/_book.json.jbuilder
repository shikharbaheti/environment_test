json.extract! book, :id, :title, :price, :published, :author, :created_at, :updated_at
json.url book_url(book, format: :json)