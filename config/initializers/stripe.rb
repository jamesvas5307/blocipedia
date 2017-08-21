Rails.configuration.stripe = {
   publishable_key: ENV['pk_test_wcoroil6VM5iYyHqvNjYDnmO'],
   secret_key: ENV['sk_test_m9WsriA1M8abSwus9KvF4M8U']
 }

 # Set our app-stored secret key with Stripe
 Stripe.api_key = "sk_test_m9WsriA1M8abSwus9KvF4M8U"
