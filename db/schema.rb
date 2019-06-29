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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_06_06_233211) do

  create_table "client_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", limit: 50
    t.string "comment"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", limit: 50
    t.string "fantasy_name"
    t.bigint "cuit"
    t.string "email"
    t.string "direction"
    t.string "location"
    t.string "province"
    t.bigint "phone"
    t.string "comment", limit: 250, null: false
    t.boolean "active", default: true
    t.bigint "client_type_id"
    t.bigint "iva_condition_id"
    t.bigint "sale_condition_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_type_id"], name: "index_clients_on_client_type_id"
    t.index ["iva_condition_id"], name: "index_clients_on_iva_condition_id"
    t.index ["sale_condition_id"], name: "index_clients_on_sale_condition_id"
  end

  create_table "fleet_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", limit: 50
    t.string "comment"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fleets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "code"
    t.string "model", limit: 30
    t.string "ip_address"
    t.string "hardware"
    t.string "software", comment: "Software particular que lleve el equipo"
    t.string "os", limit: 20, comment: "Sistema Operativo"
    t.boolean "active", default: true
    t.bigint "client_id"
    t.bigint "person_id"
    t.bigint "fleet_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_fleets_on_client_id"
    t.index ["fleet_type_id"], name: "index_fleets_on_fleet_type_id"
    t.index ["person_id"], name: "index_fleets_on_person_id"
  end

  create_table "iva_conditions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", comment: "Porcentaje en la facturacion, responsables inscriptos se discrimina el 21% ", force: :cascade do |t|
    t.string "condition", limit: 50
    t.integer "porcent"
    t.string "comment"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", limit: 50
    t.string "surname", limit: 50
    t.bigint "dni"
    t.string "email", limit: 50
    t.bigint "phone"
    t.boolean "active", default: true
    t.bigint "client_id"
    t.bigint "person_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "send_email", default: false
    t.index ["client_id"], name: "index_people_on_client_id"
    t.index ["person_type_id"], name: "index_people_on_person_type_id"
  end

  create_table "person_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", comment: "Discriminador de jerarquia en la empresa.", force: :cascade do |t|
    t.string "name", limit: 50
    t.string "comment"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rols", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", limit: 20
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sale_conditions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", comment: "Descuentos que se le puede llegar a hacer a un cliente.", force: :cascade do |t|
    t.string "condition", limit: 50
    t.float "porcent"
    t.string "comment"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ticket_answers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "ticket_id"
    t.bigint "user_id"
    t.string "detail"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ticket_id"], name: "index_ticket_answers_on_ticket_id"
    t.index ["user_id"], name: "index_ticket_answers_on_user_id"
  end

  create_table "ticket_priorities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "priority", limit: 50
    t.string "comment"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ticket_statuses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "status", limit: 50
    t.string "comment"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ticket_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", limit: 50
    t.string "comment"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "letter", limit: 5
  end

  create_table "tickets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "title", limit: 100
    t.string "detail"
    t.date "created_date"
    t.bigint "assigned_to", comment: "Persona a cargo de realizar el ticket"
    t.boolean "report", default: false, comment: "Discrimina si el ticket va o no al reporte"
    t.boolean "active", default: true
    t.bigint "client_id"
    t.bigint "fleet_id"
    t.bigint "user_id"
    t.bigint "person_id"
    t.bigint "ticket_status_id"
    t.bigint "ticket_priority_id"
    t.bigint "ticket_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assigned_to"], name: "fk_rails_8ff3ec3325"
    t.index ["client_id"], name: "index_tickets_on_client_id"
    t.index ["fleet_id"], name: "index_tickets_on_fleet_id"
    t.index ["person_id"], name: "index_tickets_on_person_id"
    t.index ["ticket_priority_id"], name: "index_tickets_on_ticket_priority_id"
    t.index ["ticket_status_id"], name: "index_tickets_on_ticket_status_id"
    t.index ["ticket_type_id"], name: "index_tickets_on_ticket_type_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "username", limit: 50
    t.string "email", limit: 50
    t.string "password_digest"
    t.boolean "active", default: true
    t.bigint "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "rol_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["person_id"], name: "index_users_on_person_id"
    t.index ["rol_id"], name: "index_users_on_rol_id"
  end

  add_foreign_key "clients", "client_types"
  add_foreign_key "clients", "iva_conditions"
  add_foreign_key "clients", "sale_conditions"
  add_foreign_key "fleets", "clients"
  add_foreign_key "fleets", "fleet_types"
  add_foreign_key "fleets", "people"
  add_foreign_key "people", "clients"
  add_foreign_key "people", "person_types"
  add_foreign_key "ticket_answers", "tickets"
  add_foreign_key "ticket_answers", "users"
  add_foreign_key "tickets", "clients"
  add_foreign_key "tickets", "fleets"
  add_foreign_key "tickets", "people"
  add_foreign_key "tickets", "people", column: "assigned_to"
  add_foreign_key "tickets", "ticket_priorities"
  add_foreign_key "tickets", "ticket_statuses"
  add_foreign_key "tickets", "ticket_types"
  add_foreign_key "tickets", "users"
  add_foreign_key "users", "people"
  add_foreign_key "users", "rols"
end
