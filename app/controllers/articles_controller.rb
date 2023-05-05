class ArticlesController < ApplicationController
  before_action :validate_token

  BASE_URL = "https://gnews.io/api/v4".freeze
  API_KEY = "6313c151b9cb2659680d926001a43d0f".freeze

  def index
    url = "#{BASE_URL}/top-headlines?#{token}"
    response = Rails.cache.fetch(url, expires_in: 1.hour) do
      HTTParty.get(url)
    end

    if response.code != 200
      render json: { error: response['message'] }, status: response.code
    end

    render json: response.parsed_response
  end

  def show
    id = params[:id]
    url = "#{BASE_URL}/articles/#{id}?#{token}"
    response = Rails.cache.fetch(url, expires_in: 1.hour) do
      HTTParty.get(url)
    end
    render json: response.parsed_response
  end

  def search
    query = clean_query_params(params[:query])
    in_fields = params[:in]
    url = "#{BASE_URL}/search?q=#{query}"
    url << "&in=#{in_fields}" unless in_fields.nil?
    url << "&#{token}"

    response = Rails.cache.fetch(url, expires_in: 1.hour) do
      HTTParty.get(url)
    end
    
    render json: response.parsed_response
  end

  private

  def validate_token
    unless params[:token] == API_KEY
      render json: { error: 'Invalid API token' }, status: :unauthorized
    end
  end

  def clean_query_params(query)
    query.gsub(/[^0-9a-z ]/i, ' ')
  end

  def token
    "token=#{API_KEY}"
  end
end
