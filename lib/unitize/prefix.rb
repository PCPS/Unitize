module Unitize
  # A prefix can be used with metric atoms to modify their scale.
  class Prefix < Base
    liner :scalar

    # The data loaded from the UCUM spec files
    # @api semipublic
    def self.data
      @data ||= MeasurementPrefix.table_exists? && MeasurementPrefix.order(:id).all.map do |e|
        e.to_unitize
      end || []
    end

    # The location of the UCUM spec prefix data file
    # @api semipublic
    def self.data_file
      Unitize.data_file 'prefix'
    end
  end
end
