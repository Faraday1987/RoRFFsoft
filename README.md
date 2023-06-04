# Ejemplo Funcionando

[https://ffventas.fly.dev/](https://ffventas.fly.dev/)

Para usar el ejemplo:
Email: admin@ffventas.fly
Password: Mexico1234

O registrarse.... 🤓

***PRIMERO instalamos el instalador de postgresql.org el instalador
te va pedir un password al inicio:
El username se instala por defecto:
username: postgres
password: Mexico123!
El pasword que usamos al instalar.

```Bash
    #Creamos la aplicación en rails con el comando para que cree la base de datos postgres sql
    rails new appNombre --database=postgresql
```

Agregamos los datos de la base de datos al archivo database.yml

username: postgres
password: Mexico123!

```Bash
así debe quedar:
default: &default
  adapter: postgresql
  encoding: unicode
  # For details on connection pooling, see Rails configuration guide
  # https://guides.rubyonrails.org/configuring.html#database-pooling
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: postgres <-esto es lo que agregamos
  password: Mexico123! <-esto es lo que agregamos
```

```Bash
    #ya con eso ahora sí ejecutamos el comando
    rails db:create
    #para que nos cree las bases de datos de desarrollo y test
```

## Crear tablas del sistema, del modelo de base de datos.

[IMAGEN]

## Crear modelos en rails, * en singular y rails los pluraliza automaticamente

# MODELOS

```Bash
    #Categorias
    bin/rails generate model Category nombre:string descripcion:string imageurl:string

    #Client
    bin/rails generate model Client nombre:string imageurl:string country:string address:string address2:string cp:string city:string state:string contact_name:string email:string phone:string commission_amount:float

    #Supplier
    bin/rails generate model Supplier company_name:string imageurl:string country:string address:string address2:string cp:string city:string is_active:boolean contact_name:string email:string phone:string phone2:string commission_amount:float


    #Product
    bin/rails generate model Product sku:string nombre:string description:text images:text imagen:string oldprpriceice:decimal  oldprice:decimal realprice:decimal warehouse:string is_active:boolean existencekg:decimal existence:integer weight:decimal category_id:integer supplier_id:integer commission_for_sale:decimal commission_amount:decimal categories:references suppliers:references

    #Sale
    bin/rails generate model Sale user_id:integer importe:decimal amount:float date:date weight:float

    #Warehouse
    bin/rails generate model WarehouseRecord user_id:integer supplier:references product:references cantidad:integer disponible:integer weight:float

    #SaleDetails
    bin/rails generate model SaleDetail cantidad:integer product:references sale:references

  
    bin/rails db:migrate
```

## Instalar la gema device, para login y registro

```BASH
    agregar al archivo de Gemas: Gemfile por la linea 39: 
    gem 'devise'
    bundle install 
    rails generate devise:install

    agregar al archivo:
    config/environments/development.rb: (hasta abajo)
    config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

    rails generate devise User nombre:string isAdmin:boolean permissions:string

    rails db:migrate
```

Instalar Admin LTE 3 (Template gratuito de dashboard en bootstrap)

## Crear el primer controlador de categorias

```BASH

    bin/rails generate controller categories index new edit create update destroy

    rails db:migrate


```

```Bash
    bin/rails generate controller categories index new edit create update destroy 
```

## Notas útiles

Agregar datos manualmente para pruebas:

```Bash
    #Categorias
    Category.create(nombre: "Product name sample", descripcion: "Categoría descripción sample", imageurl: "https://cdn.shopify.com/s/files/1/0747/1002/4481/files/arcate-1_600x.png?v=1683654020")
```

brew install flyctl
*Registrarse en fly.io
fly login

para esta aplicacion agregar
bundle lock --add-platform x86_64-linux

bundle

fly launch

Instalar flyctl en Mac:
brew install flyctl

Instalar flyctl en Linux:
curl -L https://fly.io/install.sh | sh

Instalar flyctl en Windows:
iwr https://fly.io/install.ps1 -useb | iex

<!-- Start DB empty -->

rails db:drop
rails db:create
rails db:migrate

* Para agregar las Foreign key: rails generate model _________ table:references
* Ruby version
* System dependencies
* Configuration
* Database creation
* Database initialization
* How to run the test suite
* Services (job queues, cache servers, search engines, etc.)
* Deployment instructions
* ...
