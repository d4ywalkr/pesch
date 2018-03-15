require 'google/apis/sheets_v4'
require 'google/apis/sheets_v4'
require 'googleauth'
require 'googleauth/stores/file_token_store'

require 'fileutils'

intent "LaunchRequest" do

  response_text = [
    "Hi! Ich helfe Pesch die Bestellungen zu organisieren. ",
    "Sag mir einfach deinen Namen, und ich schaue nach, ",
    "ob deine Bestellung schon da ist."
  ].join

  ask(response_text)
end
