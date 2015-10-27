require 'csv'

module Paypal
  module Csv
    module Reports
      class CaseReport
        def self.build(file)
          new(File.open(file, 'r:bom|utf-8'))
        end

        attr_reader :generated_at, :reporting_window, :account_id, :version, :header, :entries

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
          when 'RH'
            parse_report_header(row)
          when 'CH'
            @header = parse_header(row)
          when 'SB'
            @entries << Hash[@header.zip(row)]
          end
        end

        def parse_report_header(row)
          @generated_at, @reporting_window, @account_id, @version = row
        end

        def parse_header(row)
          row.map { |v| v.downcase.gsub(' ', '_').to_sym }
        end
      end
    end
  end
end
