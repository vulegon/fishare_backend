module Api
  module V1
    class FishController < ApplicationController
      # 魚を取得します
      def index
        fish = Fish.all.pluck(:name)

        json = {
          message: '魚を取得しました',
          fish: fish,
        }

        render status: :ok, json: json
      end
    end
  end
end
