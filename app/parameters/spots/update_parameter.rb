module Spots
  class UpdateParameter
    include ActiveModel::Model
    include ActiveModel::Attributes
    include ActiveModel::Validations

    attribute :id, :string
    attribute :str_latitude, :string
    attribute :str_longitude, :string
    attribute :name, :string
    attribute :description, :string
    attribute :location, :string
    attribute :images, :binary
    attribute :fish, array: true
    attribute :fishing_types, array: true

    validates :id, presence: true
    validates :name, presence: true, length: { maximum: Spot::NAME_MAXIMUM_LIMIT }
    validates :description, presence: true, length: { maximum: Spot::DESCRIPTION_MAXIMUM_LIMIT }

    validate :spot_must_be_found
    validate :latitude_must_be_exist
    validate :longitude_must_be_exist

    validates_with Spots::LocationValidator
    validates_with Spots::PositionValidator
    validates_with Spots::FishValidator
    validates_with Spots::FishingTypeValidator

    def initialize(params, current_user)
      super(params.permit(:id, :description, :location, :name, :str_latitude, :str_longitude, fishing_types: [], images: [], fish: []))
      @spot = Spot.find_by(id: params[:id], user_id: current_user&.id)
      @latitude = str_latitude.to_f
      @longitude = str_longitude.to_f
      @location_record = Location.find_by(name: location)
      @fish_record = Fish.where(name: fish)
      @fishing_types_record = FishingType.where(name: fishing_types)
    end

    def model_attributes
      {
        name: name,
        images: images,
        latitude: latitude,
        longitude: longitude,
        description: description,
        location_id: location_record.id,
      }
    end

    attr_reader :spot, :location_record, :fish_record, :fishing_types_record, :latitude, :longitude

    private

    def spot_must_be_found
      return if spot.present?
      errors.add(:id, "ログイン中のユーザーアカウントに関連付けられた釣り場が見つかりませんでした")
    end

    def latitude_must_be_exist
      return unless latitude.to_i.zero?
      errors.add(:str_latitude, "緯度情報が存在しません")
    end

    def longitude_must_be_exist
      return unless longitude.to_i.zero?
      errors.add(:str_longitude, "経度情報が存在しません")
    end
  end
end
