# config/puma.rb

# Usa un número de hilos de trabajo apropiado para tu aplicación
threads_count = Integer(ENV['RAILS_MAX_THREADS'] || 5)
threads threads_count, threads_count

# Define el puerto y la dirección de enlace
port        ENV['PORT']     || 3001
environment ENV['RAILS_ENV'] || 'development'

# Si en producción, se usará un socket Unix
if ENV['RAILS_ENV'] == 'production'
  bind "unix://#{Rails.root}/tmp/sockets/puma.sock"
else
  bind "tcp://0.0.0.0:3000"
end

# Número de workers (procesos) que Puma utilizará
workers ENV['WEB_CONCURRENCY'] || 2

# Preload Rails para mejorar el tiempo de arranque en producción
preload_app!

# Configuración de manejo de señales
on_worker_boot do
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end
