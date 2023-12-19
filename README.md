# Example Ruby Blog

Used to test CodeQL, contains vulnerabilities. Do not use as a real application under any circumstances.

Contains the following vulnerabilities

`app/controllers/articles_controller.rb`
```ruby
  def show
    @article = Article.where("id = #{params[:id]}").first # SQL injection
  end
```

`app/api/blogapi/api.rb` - currently undetectable due to lack of Rack/Grape support
```ruby
  desc 'Return an article'
  params do
    requires :id, type: String, desc: 'Article ID'
  end
  route_param :id do
    get do
      system("/bin/echo #{params[:id]}") # Command injection
      Article.where("id = #{params[:id]}") # SQL injection
    end
  end
```
