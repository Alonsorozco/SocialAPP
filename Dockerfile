FROM ruby:3.2-slim

# Instala dependencias del sistema (PostgreSQL, Node.js, Yarn, etc.)
RUN apt-get update -qq && apt-get install -y postgresql-client nodejs yarn

# Configura el directorio de trabajo
WORKDIR /app

# Copia los archivos de la aplicación
COPY . .

# Instala las dependencias de Ruby y JavaScript


# Precompila los assets
RUN RAILS_ENV=production bundle exec rake assets:precompile

# Expone el puerto
EXPOSE 3000

# Comando de inicio
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
