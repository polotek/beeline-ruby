require "honeycomb-beeline"

libhoney = Libhoney::Client.new(writekey: "writekey", dataset: "dataset")

Honeycomb.configure do |config|
  config.client = libhoney
end

t = Thread.new do
  while (response = libhoney.responses.pop)
    puts response.inspect
  end
end

Honeycomb.start_span(name: "hook_span") do
  Honeycomb.add_field("response_code", 200)
  Honeycomb.add_field("credit_card_number", "4242424242424242")
end

libhoney.close

t.join
