Datadog.configure do |c|
  c.use :rails, {service_name: 'railsforce', debug: true}
end
