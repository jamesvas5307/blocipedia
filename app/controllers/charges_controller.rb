class ChargesController < ApplicationController
  def new
    @stripe_btn_data = {
     key: "pk_test_wcoroil6VM5iYyHqvNjYDnmO",
     description: "Premium Membership for #{current_user.email}",
     amount: 1500
   }
  end
  def create
   # Creates a Stripe Customer object, for associating
   # with the charge
   if current_user.standard?
   Stripe.api_key = "sk_test_m9WsriA1M8abSwus9KvF4M8U"
   customer = Stripe::Customer.create(
     email: current_user.email,
     card: params[:stripeToken]
   )

   # Where the real magic happens
   charge = Stripe::Charge.create(
     customer: customer.id, # Note -- this is NOT the user_id in your app
     amount: 1500,
     description: "Premium Membership for - #{current_user.email}",
     currency: 'usd'
   )
   current_user.update_attribute(:role, 'premium')
   flash[:notice] = "Your membership is now premium, #{current_user.email}!"
   redirect_to root_path # or wherever

   # Stripe will send back CardErrors, with friendly messages
   # when something goes wrong.
   # This `rescue block` catches and displays those errors.
 else
   current_user.update_attribute(:role, 'standard')
 end
   rescue Stripe::CardError => e
     flash[:alert] = e.message
     redirect_to new_charge_path
 end
end
