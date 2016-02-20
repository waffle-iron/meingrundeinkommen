class SubscriptionsController < ApplicationController

  def show
    u                                                = User.find(params[:id])
    u.update_attribute(:newsletter,false) if u.email = params[:email]

    render text: "Die Adresse #{params[:email]} wurde vom Newsletter abgemeldet. Neu-Anmeldung ist jederzeit auf deinem Profil möglich."
  end
end