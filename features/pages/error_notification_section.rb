class ErrorNotificationSection < PageObject
  def errors
    driver.all('#error_explanation').map(&:text)
  end
end