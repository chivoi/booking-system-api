class BookingMailer < ApplicationMailer
  default from: 'noreply@booking-system.com'

  def booking_email(booking:, user:)
    @booking = booking
    @user = user
    @url = 'https://alex-velasco-book.netlify.app/bookings'
    mail(to: "souhlasim@gmail.com", subject: 'You have a new booking!')
  end
  def booking_email_user(booking:, user:)
    @booking = booking
    @user = user
    @url = 'https://alex-velasco-book.netlify.app/bookings'
    mail(to: @user.email, subject: 'Booking created!')
  end
end
