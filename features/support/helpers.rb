

module Helpers
  def get_token
    10.times do
      js_script = 'return window.localStorage.getItem("default_auth_token");'
      @token = page.execute_script(js_script)
      break if @token != nil
      sleep 10
    end
    @token
  end
end
