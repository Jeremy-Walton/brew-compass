# frozen_string_literal: true

module ShoelaceHelper
  def shoelace_select_rating(input_id, value)
    page.execute_script("document.getElementById('#{input_id}').value = '#{value}'")
  end
end
