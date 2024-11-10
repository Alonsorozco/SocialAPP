# Usa una imagen base oficial de Ruby
FROM ruby:3.2.3

# Establece el directorio de trabajo
WORKDIR /app

# Copia el archivo Gemfile y Gemfile.lock en el contexto del contenedor
COPY Gemfile Gemfile.lock ./

# Instala las dependencias del bundle
RUN bundle install

# Copia el resto del código de la aplicación en el contexto del contenedor
COPY . .

# Precompila los assets (si es una aplicación Rails)
RUN SECRET_KEY_BASE_DUMMY=1 bundle exec rails assets:precompile

# Exponer el puerto 3000 para la aplicación Rails
EXPOSE 3000

# Comando para iniciar el servidor Rails
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
