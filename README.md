# Simple PayPal CSV report parser

Parses PayPal case report CSV. 

[CSV format](https://www.paypalobjects.com/webstatic/en_US/developer/docs/pdf/PP_LRD_GenDisputeReport.pdf)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'paypal-csv-reports'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install paypal-csv-reports

## Usage

```ruby
csv_file = 'DDR-20150907.01.008.CSV'
report = ::Paypal::Csv::Reports::CaseReport.build(csv_file)

report.entries.each do |entry|
  p entry
end
```

Entry example:

```ruby
{:case_type=>"Claim",
 :case_id=>"PP-004-117-699-911",
 :original_transaction_id=>"00389221H1783294G",
 :transaction_date=>"2015/08/13 07:50:09 +0200",
 :transaction_invoice_id=>nil,
 :card_type=>nil,
 :case_reason=>"Not as described",
 :claimant_name=>"testami",
 :claimant_email_address=>"aaaa@hotmail.com",
 :case_filing_date=>"2015/08/17 00:38:57 +0200",
 :case_status=>"Being Reviewed By PayPal",
 :response_due_date=>nil,
 :disputed_amount=>"221",
 :disputed_currency=>"USD",
 :disputed_transaction_id=>nil,
 :money_movement=>"No Impact",
 :settlement_type=>nil,
 :seller_protection=>"Ineligible",
 :seller_protection_payout_amount=>nil,
 :seller_protection_currency=>nil,
 :payment_tracking_id=>"tracking-id-123",
 :buyer_comments=>"When the rain comes tumbling down",
 :store_id=>nil,
 :chargeback_reason_code=>nil,
 :outcome=>"None"}
``` 

## Contributing

1. Fork it ( https://github.com/laurynas/paypal-csv-reports/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
