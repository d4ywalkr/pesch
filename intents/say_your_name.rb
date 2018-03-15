require 'active_support/core_ext/array/conversions'
require './lib/bestellung'

intent "SayYourName" do

  name = request.slot_value("Name")

  service = Google::Apis::SheetsV4::SheetsService.new
  service.client_options.application_name = Bestellung::APPLICATION_NAME
  service.authorization = Bestellung.authorize

  spreadsheet_id = '1WRUSduuLz_9O83SycfmQqbwa3kmWXApwArL5QZclJRk'
  range = 'Bestellungen!A2:C'
  answers = service.get_spreadsheet_values(spreadsheet_id, range)

  response_text = "Ich habe keine Bestellung für #{name} gefunden."

  answers.values.each do |row|
    if row[0].downcase == name
      response_text = [
        "Hallo #{name.capitalize}. Du hast ein #{row[1]} bestellt. ",
        " Der Status deiner Bestellung ist: #{row[2]}."
      ].join
      break
    end
  end

  tell(response_text)
end
