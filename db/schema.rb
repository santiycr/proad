# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110716215721) do

  create_table "proyectos", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.date     "fecha_comienzo"
    t.date     "fecha_entrega"
    t.integer  "duracion_sprint"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tareas", :force => true do |t|
    t.string   "titulo"
    t.text     "descripcion"
    t.integer  "porcentaje_avance"
    t.integer  "horas_dedicadas"
    t.integer  "userstory_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "userstories", :force => true do |t|
    t.string   "titulo"
    t.text     "descripcion"
    t.integer  "prioridad"
    t.integer  "sprint"
    t.integer  "complejidad"
    t.integer  "proyecto_id"
    t.integer  "usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", :force => true do |t|
    t.string   "username"
    t.string   "hashed_password"
    t.string   "nombre"
    t.string   "email"
    t.string   "rol"
    t.integer  "proyecto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
