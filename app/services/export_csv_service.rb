require "csv"

class ExportCsvService
  def initialize objects, attributes
    @attributes = attributes
    @objects = objects
    @header = attributes.map { |attr| I18n.t("header_csv.#{attr}", locale: :jp) }
  end

  def perform
    bom = "\uFEFF"
    CSV.generate(bom) do |csv|
      csv << header
      objects.each do |object|
        csv << attributes.map{ |attr| object.public_send(attr) }
      end
    end
  end

  private
  attr_reader :attributes, :objects, :header
end