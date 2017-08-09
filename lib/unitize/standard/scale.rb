module Unitize::Standard
  class Scale
    attr_accessor :nori

    def initialize(nori)
      @nori = nori
    end

    def value
      Unitize::Number.coefficify(nori.attributes.fetch('value'))
    end

    def primary_unit_code
      nori.attributes["Unit"]
    end

    def secondary_unit_code
      nori.attributes["UNIT"]
    end

    def to_hash
      {:value => value, :unit_code => primary_unit_code}
    end
  end
end
