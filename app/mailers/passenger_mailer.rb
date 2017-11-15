class PassengerMailer < ApplicationMailer
	default from: 'from@example.com'

  def thank_you_email(passenger, flight)
  	@passenger = passenger
  	@flight = flight
  	mail(to: @passenger.email, subject: "Thank you for booking")
  end
end
