module BlogAPI
  class API < Grape::API
    format :json
    prefix :api

    namespace :articles do
      desc 'Return all articles'
      get do
        Article.all
      end

      desc 'Return an article'
      params do
        requires :id, type: String, desc: 'Article ID'
      end
      route_param :id do
        get do
          system("/bin/echo #{params[:id]}")
          Article.where("id = #{params[:id]}")
        end
      end
    end

  end
end