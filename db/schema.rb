# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140313204141) do

  create_table "catalogcategoryworks", force: true do |t|
    t.string   "nombre"
    t.integer  "unit_id"
    t.string   "precio_unitario_normal"
    t.string   "precio_unitario_60"
    t.string   "precio_unitario_100"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "catalogcategoryworks", ["unit_id"], name: "index_catalogcategoryworks_on_unit_id", using: :btree

  create_table "catalogofworks", force: true do |t|
    t.integer  "entity_id"
    t.string   "telefono"
    t.string   "movil"
    t.string   "direccion"
    t.string   "mail"
    t.string   "numero_cuenta"
    t.string   "banco"
    t.date     "fecha_nacimiento"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "catalogcategorywork_id"
  end

  add_index "catalogofworks", ["catalogcategorywork_id"], name: "index_catalogofworks_on_catalogcategorywork_id", using: :btree
  add_index "catalogofworks", ["entity_id"], name: "index_catalogofworks_on_entity_id", using: :btree

  create_table "chiefoffronts", force: true do |t|
    t.integer  "entity_id"
    t.string   "telefono"
    t.string   "movil_1"
    t.string   "movil_2"
    t.string   "mail"
    t.string   "direccion_1"
    t.string   "direccion_2"
    t.string   "foto"
    t.date     "nacimiento"
    t.string   "estado"
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "days", force: true do |t|
    t.integer  "numero"
    t.integer  "typeofday_id"
    t.string   "nombre"
    t.integer  "week_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "days", ["typeofday_id"], name: "index_days_on_typeofday_id", using: :btree
  add_index "days", ["week_id"], name: "index_days_on_week_id", using: :btree

  create_table "entities", force: true do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "dni"
    t.string   "razon_social"
    t.string   "ruc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "equipmentincludeds", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "equipmentregisters", force: true do |t|
    t.integer  "partofequipment_id"
    t.integer  "groupsofwork_id"
    t.integer  "itemsofcontrol_id"
    t.integer  "front_id"
    t.string   "inicio"
    t.string   "fin"
    t.string   "cantidad"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "equipmentregisters", ["front_id"], name: "index_equipmentregisters_on_front_id", using: :btree
  add_index "equipmentregisters", ["groupsofwork_id"], name: "index_equipmentregisters_on_groupsofwork_id", using: :btree
  add_index "equipmentregisters", ["itemsofcontrol_id"], name: "index_equipmentregisters_on_itemsofcontrol_id", using: :btree
  add_index "equipmentregisters", ["partofequipment_id"], name: "index_equipmentregisters_on_partofequipment_id", using: :btree

  create_table "equipmentsofsubcontracts", force: true do |t|
    t.integer  "subcontractofequipment_id"
    t.string   "codigo"
    t.string   "descripcion"
    t.integer  "inputofequipment_id"
    t.string   "marca"
    t.string   "serie"
    t.string   "modelo"
    t.string   "anho"
    t.integer  "unit_id"
    t.string   "precion_sin_igv"
    t.integer  "equipmentincluded_id"
    t.string   "horas_minimas"
    t.string   "cantidad_h_m"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "fecha"
    t.string   "cantidad_contratada"
  end

  add_index "equipmentsofsubcontracts", ["inputofequipment_id"], name: "index_equipmentsofsubcontracts_on_inputofequipment_id", using: :btree

  create_table "fronts", force: true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fueltypes", force: true do |t|
    t.string   "tipo"
    t.string   "combustible"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "precio"
  end

  create_table "groupofequipments", force: true do |t|
    t.string   "nombre"
    t.integer  "inputofequipment_id"
    t.string   "marca"
    t.string   "serie"
    t.string   "modelo"
    t.string   "anho"
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groupsofworks", force: true do |t|
    t.integer  "sector_id"
    t.integer  "subsector_id"
    t.integer  "chiefoffront_id"
    t.integer  "subcontract_id"
    t.integer  "teacherofwork_id"
    t.string   "activo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groupsofworks", ["chiefoffront_id"], name: "index_groupsofworks_on_chiefoffront_id", using: :btree
  add_index "groupsofworks", ["sector_id"], name: "index_groupsofworks_on_sector_id", using: :btree
  add_index "groupsofworks", ["subcontract_id"], name: "index_groupsofworks_on_subcontract_id", using: :btree
  add_index "groupsofworks", ["subsector_id"], name: "index_groupsofworks_on_subsector_id", using: :btree
  add_index "groupsofworks", ["teacherofwork_id"], name: "index_groupsofworks_on_teacherofwork_id", using: :btree

  create_table "importlists", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inputofequipments", force: true do |t|
    t.string   "codigo_tobi"
    t.string   "nombre"
    t.integer  "unit_id"
    t.string   "cantidad"
    t.string   "precio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "inputofequipments", ["unit_id"], name: "index_inputofequipments_on_unit_id", using: :btree

  create_table "inputs", force: true do |t|
    t.string   "cantidad"
    t.string   "pu_sin_igv"
    t.string   "parcial"
    t.string   "descripcion"
    t.integer  "unit_id"
    t.integer  "list_id"
    t.integer  "subcontract_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "inputs", ["list_id"], name: "index_inputs_on_list_id", using: :btree
  add_index "inputs", ["subcontract_id"], name: "index_inputs_on_subcontract_id", using: :btree
  add_index "inputs", ["unit_id"], name: "index_inputs_on_unit_id", using: :btree

  create_table "items", force: true do |t|
    t.integer  "list_id"
    t.string   "diametro"
    t.string   "serieclase"
    t.string   "profundidad"
    t.integer  "unit_id"
    t.string   "metrado"
    t.string   "observacion"
    t.integer  "partwork_id"
    t.string   "terreno"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["unit_id"], name: "index_items_on_unit_id", using: :btree

  create_table "itemsofcontrols", force: true do |t|
    t.integer  "phase_id"
    t.integer  "subphase_id"
    t.integer  "sector_id"
    t.integer  "subsector_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "listcategories", force: true do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.integer  "importlist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "listcategories", ["importlist_id"], name: "index_listcategories_on_importlist_id", using: :btree

  create_table "lists", force: true do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.integer  "unit_id"
    t.string   "precio_unitario"
    t.integer  "listcategory_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lists", ["unit_id"], name: "index_lists_on_unit_id", using: :btree

  create_table "machineryequipmentabstracts", force: true do |t|
    t.integer  "reportofequipment_id"
    t.integer  "equipmentsofsucontract_id"
    t.string   "nombre_equipo"
    t.string   "unidad"
    t.string   "precio_unitario"
    t.string   "acumulado_anterior_metrado"
    t.string   "acumulado_anterior_monto"
    t.string   "presente_valorizacion_metrado"
    t.string   "presente_valorizacion_monto"
    t.string   "acumulado_actual_metrado"
    t.string   "acumulado_actual_monto"
    t.date     "inicio"
    t.date     "fin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "machineryequipmentdetails", force: true do |t|
    t.integer  "machineryequipmentabstract_id"
    t.string   "numero"
    t.string   "parte"
    t.string   "fecha"
    t.string   "horometro_inicio"
    t.string   "horometro_fin"
    t.string   "horometro_horas"
    t.string   "horas_efectivas"
    t.string   "suministro"
    t.string   "combustible"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "machineryequipmentdetails", ["machineryequipmentabstract_id"], name: "index_machineryequipmentdetails_on_machineryequipmentabstract_id", using: :btree

  create_table "machineryequipments", force: true do |t|
    t.string   "nombre"
    t.integer  "reportofequipment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "machineryequipments", ["reportofequipment_id"], name: "index_machineryequipments_on_reportofequipment_id", using: :btree

  create_table "months", force: true do |t|
    t.string   "nombre"
    t.integer  "numero"
    t.integer  "anho_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "months", ["anho_id"], name: "index_months_on_anho_id", using: :btree

  create_table "partdayliofpeople", force: true do |t|
    t.string   "numero"
    t.integer  "groupsofwork_id"
    t.date     "fecha"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "aprobado"
  end

  add_index "partdayliofpeople", ["groupsofwork_id"], name: "index_partdayliofpeople_on_groupsofwork_id", using: :btree

  create_table "partofequipments", force: true do |t|
    t.integer  "subcontractofequipment_id"
    t.integer  "equipmentsofsubcontract_id"
    t.string   "numero"
    t.string   "fecha"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "inicio"
    t.string   "fin"
    t.string   "diferencia"
    t.string   "combustible_cantidad"
    t.integer  "catalogofwork_id"
    t.integer  "fueltype_id"
    t.string   "stand_by"
    t.string   "mantenimiento"
    t.integer  "aprobado"
  end

  add_index "partofequipments", ["catalogofwork_id"], name: "index_partofequipments_on_catalogofwork_id", using: :btree
  add_index "partofequipments", ["equipmentsofsubcontract_id"], name: "index_partofequipments_on_equipmentsofsubcontract_id", using: :btree
  add_index "partofequipments", ["subcontractofequipment_id"], name: "index_partofequipments_on_subcontractofequipment_id", using: :btree

  create_table "partworks", force: true do |t|
    t.string   "numero"
    t.date     "fecha"
    t.integer  "groupsofwork_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "front_id"
    t.integer  "aprobado"
  end

  add_index "partworks", ["front_id"], name: "index_partworks_on_front_id", using: :btree
  add_index "partworks", ["groupsofwork_id"], name: "index_partworks_on_groupsofwork_id", using: :btree

  create_table "phases", force: true do |t|
    t.string   "codigo"
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.date     "project_initial_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reportofequipments", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reportofmachineries", force: true do |t|
    t.string   "nombre_subcontrato"
    t.integer  "subcontractofequipment_id"
    t.date     "inicio"
    t.date     "fin"
    t.string   "aprobado"
    t.string   "numero_de_valoriacion"
    t.string   "monto_contratado"
    t.string   "adelanto"
    t.string   "amortizacion_acumulada"
    t.string   "saldo"
    t.string   "valorizacion_cantidad"
    t.string   "valorizacion_acumulado_anterior"
    t.string   "valorizacion_acumulado_actual"
    t.string   "amortizacion_adelanto_porcentaje"
    t.string   "amortizacion_adelanto_cantidad"
    t.string   "amortizacion_adelanto_acumulado_anterior"
    t.string   "amortizacion_adelanto_acumulado_actual"
    t.string   "total_facturar_cantidad"
    t.string   "total_facturar_acumulado_anterior"
    t.string   "total_facturar_acumulado_actual"
    t.string   "igv_total_facturar_porcentaje"
    t.string   "igv_total_facturar_cantidad"
    t.string   "igv_total_facturar_acumulado_anterior"
    t.string   "igv_total_facturar_acumulado_actual"
    t.string   "total_incluido_igv_cantidad"
    t.string   "total_incluido_igv_acumulado_anterior"
    t.string   "total_incluido_igv_acumulado_actual"
    t.string   "detraccion_total_porcentaje"
    t.string   "detraccion_total_cantidad"
    t.string   "detraccion_total_acumulado_anterior"
    t.string   "detraccion_total_acumulado_actual"
    t.string   "descuento_combustible_cantidad"
    t.string   "descuento_combustible_acumulado_anterior"
    t.string   "descuento_combustible_acumulado_actual"
    t.string   "descuento_otros_cantidad"
    t.string   "descuento_otros_acumulado_anterior"
    t.string   "descuento_otros_acumulado_actual"
    t.string   "total_retenciones_cantidad"
    t.string   "total_retenciones_acumulado_anterior"
    t.string   "total_retenciones_acumulado_actual"
    t.string   "neto_pagar_cantidad"
    t.string   "neto_pagar_acumulado_anterior"
    t.string   "neto_pagar_acumulado_actual"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sectors", force: true do |t|
    t.string   "codigo"
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subcontractofequipments", force: true do |t|
    t.integer  "supplier_id"
    t.string   "valorizacion"
    t.string   "adelanto"
    t.string   "adelanto_detalle"
    t.string   "condiciones_de_pago"
    t.string   "igv"
    t.string   "fondo_de_garantia"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "amortizacion_inicial_numero"
    t.string   "amortizacion_inicial_porcentaje"
    t.string   "fondo_de_garantia_porcentaje"
    t.string   "detraccion_porcentaje"
    t.string   "adelanto_1_numero"
    t.date     "adelanto_1_fecha"
    t.string   "adelanto_2_numero"
    t.date     "adelanto_2_fecha"
    t.string   "adelanto_3_numero"
    t.date     "adelanto_3_fecha"
    t.string   "adelanto_4_numero"
    t.date     "adelanto_4_fecha"
    t.string   "monto_contratado_suma"
  end

  create_table "subcontracts", force: true do |t|
    t.integer  "supplier_id"
    t.string   "valorizacion"
    t.string   "adelanto"
    t.string   "condiciones_de_pago"
    t.string   "igv"
    t.string   "fondo_de_garantia"
    t.string   "adelanto_detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "amortizacion_porcentaje"
    t.string   "amortizacion_numero"
    t.string   "fondo_garantia_porcentaje"
    t.string   "detraccion_total_inicial_porcentaje"
    t.string   "monto_contratado"
    t.string   "adelanto1"
    t.string   "adelanto2"
    t.string   "adelanto3"
    t.string   "adelanto4"
    t.date     "fecha1"
    t.date     "fecha2"
    t.date     "fecha3"
    t.date     "fecha4"
  end

  create_table "subphases", force: true do |t|
    t.string   "codigo"
    t.string   "descripcion"
    t.integer  "phase_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subsectors", force: true do |t|
    t.string   "codigo"
    t.string   "descripcion"
    t.integer  "sector_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suppliers", force: true do |t|
    t.integer  "entity_id"
    t.string   "nombre"
    t.string   "direccion"
    t.string   "telefono"
    t.string   "movil_1"
    t.string   "movil_2"
    t.string   "cuenta_corriente_1"
    t.string   "cuenta_corriente_2"
    t.string   "cuenta_corriente_3"
    t.string   "cuenta_de_detraccion"
    t.string   "contacto"
    t.string   "ruc"
    t.string   "cci_1"
    t.string   "cci_2"
    t.string   "cci_3"
    t.string   "banco_1"
    t.string   "banco_2"
    t.string   "banco_3"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tareos", force: true do |t|
    t.date     "inicio"
    t.date     "fin"
    t.integer  "aprobado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tareoscolumns", force: true do |t|
    t.integer  "tareosgroupsofwork_id"
    t.string   "item"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tareosgroupsofworks", force: true do |t|
    t.integer  "tareo_id"
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tareosrows", force: true do |t|
    t.integer  "tareoscolumn_id"
    t.string   "item"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teacherofworks", force: true do |t|
    t.integer  "chiefoffront_id"
    t.integer  "entity_id"
    t.string   "movil"
    t.string   "telefono"
    t.string   "nacimiento"
    t.string   "correo"
    t.string   "foto"
    t.string   "ruc"
    t.string   "banco_1"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "typeofdays", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "units", force: true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "valuations", force: true do |t|
    t.date     "fecha_inicial"
    t.date     "fecha_fin"
    t.string   "subcontratista_nombre"
    t.integer  "subcontract_id"
    t.string   "monto_contratado"
    t.string   "adelantos"
    t.string   "amortizacion_acumulada"
    t.string   "saldo_por_amortizar"
    t.string   "fondo_de_garantia_acumulada"
    t.string   "actual_valorizacion_actual"
    t.string   "acumulado_anterior_valorizacion_actual"
    t.string   "acumulado_actual_valorizacion_actual"
    t.string   "actual_amortizacion_porcentaje"
    t.string   "actual_amortizacion_numero"
    t.string   "acumulado_anterior_amortizacion_numero"
    t.string   "acumulado_actual_amortizacion_numero"
    t.string   "actual_total"
    t.string   "acumulado_anterior_total"
    t.string   "acumulado_actual_total"
    t.string   "actual_igv_porcentaje"
    t.string   "actual_igv_numero"
    t.string   "acumulado_anterior_igv_numero"
    t.string   "acumulado_actual_igv_numero"
    t.string   "actual_total_incluido_igv"
    t.string   "acumulado_anterior_total_incluido_igv"
    t.string   "acumulado_actual_total_incluido_igv"
    t.string   "actual_retenciones"
    t.string   "acumulado_anterior_retenciones"
    t.string   "acumulado_actual_retenciones"
    t.string   "actual_detraccion_del_total_porcentaje"
    t.string   "actual_detraccion_del_total_numero"
    t.string   "acumulado_anterior_detraccion_del_total_numero"
    t.string   "acumulado_actual_detraccion_del_total_numero"
    t.string   "actual_fondo_garantia_uno_porcentaje"
    t.string   "actual_fondo_garantia_uno_numero"
    t.string   "acumulado_anterior_fondo_garantia_uno_numero"
    t.string   "acumulado_actual_fondo_garantia_uno_numero"
    t.string   "actual_fondo_garantia_dos"
    t.string   "acumulado_anterior_fondo_garantia_dos"
    t.string   "acumulado_actual_fondo_garantia_dos"
    t.string   "actual_descuento_de_equipos"
    t.string   "acumulado_anterior_descuento_de_equipos"
    t.string   "acumulado_actual_descuento_de_equipos"
    t.string   "actual_descuento_de_materiales"
    t.string   "acumulado_anterior_descuento_de_materiales"
    t.string   "acumulado_actual_descuento_de_materiales"
    t.string   "actual_neto_pagar"
    t.string   "acumulado_anterior_neto_pagar"
    t.string   "acumulado_actual_neto_pagar"
    t.integer  "valorizacione_subcontrato_id"
    t.integer  "valorizacione_contador"
    t.integer  "valorizacione_aprobado"
    t.string   "actual_descuento_otros"
    t.string   "acumulado_anterior_descuento_otros"
    t.string   "acumulado_actual_descuento_otros"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vequipmentdays", force: true do |t|
    t.string   "numero_parte"
    t.string   "fecha"
    t.string   "hora_inicio"
    t.string   "hora_fin"
    t.string   "horas_horas"
    t.string   "horas_efectivas"
    t.string   "suministro"
    t.string   "combustible"
    t.integer  "vequipment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vequipmentdays", ["vequipment_id"], name: "index_vequipmentdays_on_vequipment_id", using: :btree

  create_table "vequipments", force: true do |t|
    t.string   "nombre"
    t.string   "cantidad"
    t.string   "unidad"
    t.string   "precio_unitario"
    t.string   "parcial"
    t.integer  "valuation_id"
    t.integer  "equipmentsofsubcontract_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vequipments", ["equipmentsofsubcontract_id"], name: "index_vequipments_on_equipmentsofsubcontract_id", using: :btree

  create_table "vitems", force: true do |t|
    t.integer  "valorizacione_id"
    t.string   "codigo"
    t.string   "partida_nombre"
    t.string   "unidad"
    t.string   "cantidad"
    t.string   "precio_unitario"
    t.string   "parcial"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "voucherofmeals", force: true do |t|
    t.string   "numero_vale"
    t.integer  "groupsofwork_id"
    t.string   "tipo_vale"
    t.integer  "supplier_id"
    t.string   "tipo_material"
    t.float    "cantidad"
    t.date     "fecha_de_ingreso"
    t.integer  "front_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "voucherofmeals", ["front_id"], name: "index_voucherofmeals_on_front_id", using: :btree
  add_index "voucherofmeals", ["groupsofwork_id"], name: "index_voucherofmeals_on_groupsofwork_id", using: :btree
  add_index "voucherofmeals", ["supplier_id"], name: "index_voucherofmeals_on_supplier_id", using: :btree

  create_table "vservices", force: true do |t|
    t.string   "nombre"
    t.string   "cantidad"
    t.string   "unidad"
    t.string   "precio_unitario"
    t.string   "parcial"
    t.integer  "valuation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weeks", force: true do |t|
    t.integer  "numero"
    t.integer  "month_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "weeks", ["month_id"], name: "index_weeks_on_month_id", using: :btree

  create_table "workers", force: true do |t|
    t.integer  "partdayliofperson_id"
    t.integer  "catalogofwork_id"
    t.integer  "catalogcategorywork_id"
    t.integer  "itemsofcontrol_id"
    t.string   "normal"
    t.string   "normal_60"
    t.string   "normal_100"
    t.string   "total_horas"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "front_id"
  end

  add_index "workers", ["catalogcategorywork_id"], name: "index_workers_on_catalogcategorywork_id", using: :btree
  add_index "workers", ["catalogofwork_id"], name: "index_workers_on_catalogofwork_id", using: :btree
  add_index "workers", ["front_id"], name: "index_workers_on_front_id", using: :btree
  add_index "workers", ["itemsofcontrol_id"], name: "index_workers_on_itemsofcontrol_id", using: :btree
  add_index "workers", ["partdayliofperson_id"], name: "index_workers_on_partdayliofperson_id", using: :btree

  create_table "years", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
