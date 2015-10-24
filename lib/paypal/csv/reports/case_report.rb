require 'csv'

module Paypal
  module Csv
    module Reports
      class CaseReport
        def self.build(file)
          new(File.open(file, 'r:bom|utf-8'))
        end

        attr_reader :header
        attr_reader :entries

        def initialize(csv)
          @entries = []

          parse(csv)
        end

        private

        def parse(csv)
          ::CSV.parse(csv) { |row| parse_row(row) }
        end

        def parse_row(row)
          row_type = row.shift.to_s.strip

          case row_type
          when 'CH'
            @header = parse_header(row)
          when 'SB'
            @entries << Hash[@header.zip(row)]
          end
        end

        def parse_header(row)
          row.map { |v| v.downcase.gsub(' ', '_').to_sym }
        end
      end
    end
  end
end
