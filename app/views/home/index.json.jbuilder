json.twitter @tw_body do |tw|
  json.status_code         @twitter.status
  json.status_message      I18n.t("requests.errors.#{@twitter.status}")
  json.tweet               tw['tweet']
end

json.facebook @fb_body do |fb|
  json.status_code         @facebook.status
  json.status_message      I18n.t("requests.errors.#{@facebook.status}")
  json.status              fb['status']
end

json.instagram @ig_body do |ig|
  json.status_code         @instagram.status
  json.status_message      I18n.t("requests.errors.#{@instagram.status}")
  json.photo               ig['photo']
end