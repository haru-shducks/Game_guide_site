require 'base64'
require 'json'
require 'net/https'

module Language
  class << self
    def get_data(text)
      # APIのURL作成
      api_url = "https://language.googleapis.com/v1/documents:analyzeSentiment?key=#{ENV['GOOGLE_API_KEY']}"
      # APIリクエスト用のJSONパラメータ
      params = {
        document: {
          type: 'PLAIN_TEXT',
          content: text
        }
      }.to_json

      # Google Cloud Natural Language APIにリクエスト
      uri = URI.parse(api_url)
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      request = Net::HTTP::Post.new(uri.request_uri)
      request['Content-Type'] = 'application/json'
      response = https.request(request, params)

      # APIレスポンス出力
      response_body = JSON.parse(response.body)

      if (error = response_body['error']).present?
        raise error['message']
      else
        response_body['documentSentiment']['score']
      end
    end


    def analyze_entity_sentiment(text, post_id)
      api_url = "https://language.googleapis.com/v1/documents:analyzeEntitySentiment?key=#{ENV['GOOGLE_API_KEY']}"

      # APIリクエスト用のJSONパラメータ
      params = {
        document: {
          type: 'PLAIN_TEXT',
          content: text,
          language: "JA"
        }
      }.to_json

      # Google Cloud Natural Language APIにリクエスト
      uri = URI.parse(api_url)
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      request = Net::HTTP::Post.new(uri.request_uri)
      request['Content-Type'] = 'application/json'
      response = https.request(request, params)

      # APIレスポンス出力
      response_body = JSON.parse(response.body)

      if (error = response_body['error']).present?
        raise error['message']
      else

        entities = response_body['entities']

        entities.each do |entity|
          unless Genre.where(name: entity['name']).exists?
            genre = Genre.new(
              name: entity['name']
            )
            genre.save
          end
          genre = Genre.where(name: entity['name'])
          genre.each do |genre|
            postgenre = PostGenre.new(
              post_id: post_id,
              genre_id: genre.id
            )
            postgenre.save
          end
          # ここに他の処理を追加することができます
        end
      end
    end
  end
end