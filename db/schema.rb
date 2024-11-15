# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2024_11_14_183315) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "unaccent"

  create_table "academicos", force: :cascade do |t|
    t.integer "noempleado"
    t.date "fingreso"
    t.date "fbaja"
    t.string "estatus", limit: 2
    t.string "firma", limit: 50
    t.bigint "persona_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "categoria_id", null: false
    t.bigint "nivel_id", null: false
    t.bigint "red_id", null: false
    t.index ["categoria_id"], name: "index_academicos_on_categoria_id"
    t.index ["nivel_id"], name: "index_academicos_on_nivel_id"
    t.index ["persona_id"], name: "index_academicos_on_persona_id"
    t.index ["persona_id"], name: "index_academicos_on_persona_id"
    t.index ["red_id"], name: "index_academicos_on_red_id"
    t.index ["red_id"], name: "index_academicos_on_red_id"
  end

  create_table "academicos", force: :cascade do |t|
    t.integer "noempleado"
    t.date "fingreso"
    t.date "fbaja"
    t.string "estatus", limit: 2
    t.string "firma", limit: 50
    t.bigint "persona_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "categoria_id", null: false
    t.bigint "nivel_id", null: false
    t.bigint "red_id", null: false
    t.index ["categoria_id"], name: "index_academicos_on_categoria_id"
    t.index ["nivel_id"], name: "index_academicos_on_nivel_id"
    t.index ["persona_id"], name: "index_academicos_on_persona_id"
    t.index ["persona_id"], name: "index_academicos_on_persona_id"
    t.index ["red_id"], name: "index_academicos_on_red_id"
    t.index ["red_id"], name: "index_academicos_on_red_id"
  end

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "actividades", force: :cascade do |t|
    t.integer "folio"
    t.string "titulo"
    t.integer "anio"
    t.string "fuente", limit: 2
    t.integer "idfnet"
    t.string "tipo", limit: 2
    t.string "estado", limit: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "producto_id", null: false
    t.boolean "terminos"
    t.integer "referenciaid"
    t.integer "personaid"
    t.date "fecha1"
    t.date "fecha2"
    t.date "fecha3"
    t.date "fechapub"
    t.integer "asignared"
    t.string "aceptado", limit: 1
    t.integer "reemplazaidact"
    t.date "faceptado"
    t.decimal "monto", precision: 12, scale: 2
    t.integer "periodo"
    t.string "edoblur", limit: 1
    t.index ["estado"], name: "index_actividades_on_estado"
    t.index ["producto_id"], name: "index_actividades_on_producto_id"
    t.index ["producto_id"], name: "index_actividades_on_producto_id"
    t.index ["red_id"], name: "index_actividades_on_red_id"
  end

  create_table "actividades", force: :cascade do |t|
    t.integer "folio"
    t.string "titulo"
    t.integer "anio"
    t.string "fuente", limit: 2
    t.integer "idfnet"
    t.string "tipo", limit: 2
    t.string "estado", limit: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "producto_id", null: false
    t.boolean "terminos"
    t.integer "referenciaid"
    t.integer "personaid"
    t.date "fecha1"
    t.date "fecha2"
    t.date "fecha3"
    t.date "fechapub"
    t.integer "asignared"
    t.string "aceptado", limit: 1
    t.integer "reemplazaidact"
    t.date "faceptado"
    t.decimal "monto", precision: 12, scale: 2
    t.integer "periodo"
    t.string "edoblur", limit: 1
    t.index ["estado"], name: "index_actividades_on_estado"
    t.index ["producto_id"], name: "index_actividades_on_producto_id"
    t.index ["producto_id"], name: "index_actividades_on_producto_id"
    t.index ["red_id"], name: "index_actividades_on_red_id"
  end

  create_table "actsustantivas", force: :cascade do |t|
    t.integer "acad_tecnico"
    t.integer "acad_jefe"
    t.text "actividad"
    t.decimal "porcentaje", precision: 16, scale: 2
    t.integer "anio"
    t.string "estado", limit: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ambitos", force: :cascade do |t|
    t.string "nomambito", limit: 85
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ambitos", force: :cascade do |t|
    t.string "nomambito", limit: 85
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "articulos", force: :cascade do |t|
    t.string "volumen"
    t.string "doi"
    t.string "issue"
    t.string "pgini"
    t.string "pgfin"
    t.bigint "revista_id", null: false
    t.bigint "actividad_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "eidentificador"
    t.integer "kate"
    t.integer "puntos"
    t.date "fechapub"
    t.text "abstract"
    t.index ["actividad_id"], name: "index_articulos_on_actividad_id"
    t.index ["revista_id"], name: "index_articulos_on_revista_id"
  end

  create_table "autores", force: :cascade do |t|
    t.string "firma"
    t.bigint "rol_id", null: false
    t.integer "posicion"
    t.string "corresponsal", limit: 1
    t.string "reporta", limit: 1
    t.string "tipoautor", limit: 1
    t.string "filiacion"
    t.bigint "persona_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "actividad_id", null: false
    t.decimal "porcentaje", precision: 7, scale: 2
    t.decimal "horas", precision: 16, scale: 2
    t.boolean "coordinador"
    t.string "aplicar", limit: 1
    t.text "motivo"
    t.string "autornom"
    t.string "autorap"
    t.boolean "estudiante"
    t.index ["actividad_id"], name: "index_autores_on_actividad_id"
    t.index ["persona_id"], name: "index_autores_on_persona_id"
    t.index ["persona_id"], name: "index_autores_on_persona_id"
    t.index ["publicacion_id"], name: "index_autores_on_publicacion_id"
    t.index ["rol_id"], name: "index_autores_on_rol_id"
    t.index ["rol_id"], name: "index_autores_on_rol_id"
  end

  create_table "autores", force: :cascade do |t|
    t.string "firma"
    t.bigint "rol_id", null: false
    t.integer "posicion"
    t.string "corresponsal", limit: 1
    t.string "reporta", limit: 1
    t.string "tipoautor", limit: 1
    t.string "filiacion"
    t.bigint "persona_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "actividad_id", null: false
    t.decimal "porcentaje", precision: 7, scale: 2
    t.decimal "horas", precision: 16, scale: 2
    t.boolean "coordinador"
    t.string "aplicar", limit: 1
    t.text "motivo"
    t.string "autornom"
    t.string "autorap"
    t.boolean "estudiante"
    t.index ["actividad_id"], name: "index_autores_on_actividad_id"
    t.index ["persona_id"], name: "index_autores_on_persona_id"
    t.index ["persona_id"], name: "index_autores_on_persona_id"
    t.index ["publicacion_id"], name: "index_autores_on_publicacion_id"
    t.index ["rol_id"], name: "index_autores_on_rol_id"
    t.index ["rol_id"], name: "index_autores_on_rol_id"
  end

  create_table "calificaciones", force: :cascade do |t|
    t.bigint "itemsustantiva_id", null: false
    t.decimal "calificacion", precision: 16, scale: 2
    t.text "quiz"
    t.string "tipo", limit: 2
    t.string "estado", limit: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["itemsustantiva_id"], name: "index_mru.calificaciones_on_itemsustantiva_id"
  end

  create_table "calprevios", force: :cascade do |t|
    t.integer "idpersona"
    t.string "tipoprod", limit: 15
    t.integer "anio"
    t.string "fuente", limit: 15
    t.integer "idfuente"
    t.integer "nopart"
    t.integer "noparts"
    t.string "equivalencia", limit: 2
    t.string "numeral", limit: 25
    t.string "tipopersona", limit: 1
    t.string "estimulo", limit: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "autores"
    t.integer "anioeval"
    t.string "titulo"
    t.string "nocontrol"
    t.string "corresponsal"
  end

  create_table "calsustantivas", force: :cascade do |t|
    t.bigint "actsustantiva_id", null: false
    t.bigint "tcalificacion_id", null: false
    t.decimal "calificacion", precision: 16, scale: 2
    t.string "estado", limit: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["actsustantiva_id"], name: "index_calsustantivas_on_actsustantiva_id"
    t.index ["tcalificacion_id"], name: "index_calsustantivas_on_tcalificacion_id"
  end

  create_table "capitulos", force: :cascade do |t|
    t.integer "pgini"
    t.integer "pgfin"
    t.bigint "idioma_id", null: false
    t.bigint "libro_id", null: false
    t.bigint "actividad_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "kate"
    t.integer "puntos"
    t.integer "tipocapitulo_id"
    t.index ["actividad_id"], name: "index_capitulos_on_actividad_id"
    t.index ["idioma_id"], name: "index_capitulos_on_idioma_id"
    t.index ["libro_id"], name: "index_capitulos_on_libro_id"
  end

  create_table "cateditoriales", force: :cascade do |t|
    t.string "nombre", limit: 120
    t.string "ambito", limit: 3
    t.string "especializada", limit: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categorias", force: :cascade do |t|
    t.string "nomcategoria"
    t.string "clavecategoria", limit: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categorias", force: :cascade do |t|
    t.string "nomcategoria"
    t.string "clavecategoria", limit: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "catevaluadores", force: :cascade do |t|
    t.string "descripcion", limit: 100
    t.string "clave", limit: 4
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "catidiomas", force: :cascade do |t|
    t.string "nombre", limit: 85
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "catlibros", force: :cascade do |t|
    t.string "nombre", limit: 120
    t.string "isbn", limit: 25
    t.bigint "cateditorial_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cateditorial_id"], name: "index_catlibros_on_cateditorial_id"
  end

  create_table "catniveles", force: :cascade do |t|
    t.string "nombre", limit: 50
    t.string "tipo", limit: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "catrevistas", force: :cascade do |t|
    t.string "nombre"
    t.string "tipo", limit: 60
    t.string "issn", limit: 25
    t.string "issne", limit: 25
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cloudfiles", force: :cascade do |t|
    t.text "descripcion"
    t.text "hashlink"
    t.integer "periodo"
    t.string "estado"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "codigos", force: :cascade do |t|
    t.string "nombrecodigo", limit: 45
    t.string "abreviatura", limit: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comites", force: :cascade do |t|
    t.bigint "academico_id", null: false
    t.bigint "catevaluador_id", null: false
    t.string "estado", limit: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["academico_id"], name: "index_val.comites_on_academico_id"
    t.index ["catevaluador_id"], name: "index_val.comites_on_catevaluador_id"
  end

  create_table "comvalidaciones", force: :cascade do |t|
    t.bigint "comite_id", null: false
    t.bigint "academico_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["academico_id"], name: "index_val.comvalidaciones_on_academico_id"
    t.index ["comite_id"], name: "index_val.comvalidaciones_on_comite_id"
  end

  create_table "convocatorias", force: :cascade do |t|
    t.string "descconvocatoria", limit: 85
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "coordinadores", force: :cascade do |t|
    t.integer "idpersona"
    t.integer "idred"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cuartiles", force: :cascade do |t|
    t.bigint "revista_id", null: false
    t.integer "periodo"
    t.string "cuartil"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "factori", precision: 16, scale: 2
    t.index ["revista_id"], name: "index_cuartiles_on_revista_id"
  end

  create_table "cursos", force: :cascade do |t|
    t.date "fini"
    t.date "ffin"
    t.decimal "hcurso", precision: 7, scale: 2
    t.decimal "himpartidas", precision: 7, scale: 2
    t.decimal "creditos", precision: 7, scale: 2
    t.integer "noalumnos"
    t.string "externo", limit: 2
    t.bigint "actividad_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "tipocurso_id", null: false
    t.boolean "coordinador"
    t.string "comprobante"
    t.index ["actividad_id"], name: "index_cursos_on_actividad_id"
    t.index ["tipocurso_id"], name: "index_cursos_on_tipocurso_id"
  end

  create_table "divulgaciones", force: :cascade do |t|
    t.integer "noparticipantes"
    t.integer "nodias"
    t.bigint "tipodivulgacion_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "actividad_id", null: false
    t.integer "tdivulacion_id"
    t.index ["actividad_id"], name: "index_divulgaciones_on_actividad_id"
    t.index ["tipodivulgacion_id"], name: "index_divulgaciones_on_tipodivulgacion_id"
  end

  create_table "editores", force: :cascade do |t|
    t.bigint "actividad_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "idioma_id", null: false
    t.bigint "ambito_id", null: false
    t.string "codigo"
    t.string "medio"
    t.string "editorial"
    t.string "pais"
    t.integer "kate"
    t.integer "puntos"
    t.integer "tipoeditorid"
    t.index ["actividad_id"], name: "index_editores_on_actividad_id"
    t.index ["ambito_id"], name: "index_editores_on_ambito_id"
    t.index ["idioma_id"], name: "index_editores_on_idioma_id"
  end

  create_table "editoriales", force: :cascade do |t|
    t.string "nomeditorial"
    t.string "especializada", limit: 2
    t.string "ciudad", limit: 85
    t.string "estado", limit: 1
    t.bigint "pais_id", null: false
    t.bigint "ambito_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ambito_id"], name: "index_editoriales_on_ambito_id"
    t.index ["ambito_id"], name: "index_editoriales_on_ambito_id"
    t.index ["pais_id"], name: "index_editoriales_on_pais_id"
  end

  create_table "editoriales", force: :cascade do |t|
    t.string "nomeditorial"
    t.string "especializada", limit: 2
    t.string "ciudad", limit: 85
    t.string "estado", limit: 1
    t.bigint "pais_id", null: false
    t.bigint "ambito_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ambito_id"], name: "index_editoriales_on_ambito_id"
    t.index ["ambito_id"], name: "index_editoriales_on_ambito_id"
    t.index ["pais_id"], name: "index_editoriales_on_pais_id"
  end

  create_table "estimulos", force: :cascade do |t|
    t.bigint "persona_id", null: false
    t.string "monto"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "anio"
    t.string "tipo"
    t.text "categoria"
    t.index ["persona_id"], name: "index_estimulos_on_persona_id"
  end

  create_table "evaltecnicos", force: :cascade do |t|
    t.bigint "persona_id", null: false
    t.integer "anio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["persona_id"], name: "index_mru.evaltecnicos_on_persona_id"
  end

  create_table "evaluaciones", force: :cascade do |t|
    t.bigint "persona_id", null: false
    t.date "fecha"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["persona_id"], name: "index_evaluaciones_on_persona_id"
  end

  create_table "evaluadores", force: :cascade do |t|
    t.integer "evaluadorid"
    t.integer "evaluadoid"
    t.string "tipo", limit: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "externos", force: :cascade do |t|
    t.string "institucion", limit: 150
    t.bigint "persona_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["persona_id"], name: "index_externos_on_persona_id"
  end

  create_table "extras", force: :cascade do |t|
    t.bigint "persona_id", null: false
    t.text "descripcion"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "estado", limit: 1
    t.index ["persona_id"], name: "index_extras_on_persona_id"
  end

  create_table "factores", force: :cascade do |t|
    t.string "nomrevista"
    t.decimal "factor", precision: 5, scale: 3
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cuartil"
    t.string "ambito", limit: 100
    t.string "tipo", limit: 50
  end

  create_table "fasciculos", force: :cascade do |t|
    t.bigint "tipofasciculo_id", null: false
    t.bigint "tipomedio_id", null: false
    t.string "nommedio"
    t.string "codigo"
    t.bigint "actividad_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["actividad_id"], name: "index_fasciculos_on_actividad_id"
    t.index ["tipofasciculo_id"], name: "index_fasciculos_on_tipofasciculo_id"
    t.index ["tipomedio_id"], name: "index_fasciculos_on_tipomedio_id"
  end

  create_table "fichas", force: :cascade do |t|
    t.string "nommedio"
    t.bigint "actividad_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["actividad_id"], name: "index_fichas_on_actividad_id"
  end

  create_table "historicos", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "referencia"
    t.string "nombre"
    t.bigint "persona_id", null: false
    t.string "corresponsal", limit: 2
    t.string "producto"
    t.string "cita"
    t.integer "aniocap"
    t.integer "npart"
    t.integer "nparts"
    t.string "indice", limit: 10
    t.string "tipo", limit: 20
    t.index ["persona_id"], name: "index_historicos_on_persona_id"
  end

  create_table "identificadores", force: :cascade do |t|
    t.bigint "persona_id"
    t.bigint "codigo_id"
    t.string "nomident", limit: 85
    t.string "nivel", limit: 25
    t.date "fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["codigo_id"], name: "index_identificadores_on_codigo_id"
    t.index ["persona_id"], name: "index_identificadores_on_persona_id"
  end

  create_table "idiomas", force: :cascade do |t|
    t.string "nomidioma", limit: 75
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "investigaciones", force: :cascade do |t|
    t.string "descinvestigacion", limit: 85
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "itemsustantivas", force: :cascade do |t|
    t.bigint "evaltecnico_id", null: false
    t.bigint "persona_id", null: false
    t.text "descripcion"
    t.decimal "porcentaje", precision: 16, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["evaltecnico_id"], name: "index_mru.itemsustantivas_on_evaltecnico_id"
    t.index ["persona_id"], name: "index_mru.itemsustantivas_on_persona_id"
  end

  create_table "libroarbitrados", force: :cascade do |t|
    t.integer "nopaginas"
    t.bigint "idioma_id", null: false
    t.bigint "editorial_id", null: false
    t.bigint "actividad_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "isbn", limit: 25
    t.string "editores"
    t.integer "kate"
    t.integer "puntos"
    t.index ["actividad_id"], name: "index_libroarbitrados_on_actividad_id"
    t.index ["editorial_id"], name: "index_libroarbitrados_on_editorial_id"
    t.index ["idioma_id"], name: "index_libroarbitrados_on_idioma_id"
  end

  create_table "libros", force: :cascade do |t|
    t.string "nomlibro"
    t.string "editores"
    t.string "isbn"
    t.string "anio"
    t.string "nopaginas"
    t.bigint "editorial_id", null: false
    t.string "estado", limit: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "tipolibro_id"
    t.index ["editorial_id"], name: "index_libros_on_editorial_id"
    t.index ["editorial_id"], name: "index_libros_on_editorial_id"
    t.index ["medio_id"], name: "index_libros_on_medio_id"
  end

  create_table "libros", force: :cascade do |t|
    t.string "nomlibro"
    t.string "editores"
    t.string "isbn"
    t.string "anio"
    t.string "nopaginas"
    t.bigint "editorial_id", null: false
    t.string "estado", limit: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "tipolibro_id"
    t.index ["editorial_id"], name: "index_libros_on_editorial_id"
    t.index ["editorial_id"], name: "index_libros_on_editorial_id"
    t.index ["medio_id"], name: "index_libros_on_medio_id"
  end

  create_table "medios", force: :cascade do |t|
    t.string "nombremedio", limit: 200
    t.string "ambito", limit: 3
    t.string "tipomedio", limit: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tipoentrada", limit: 1
    t.bigint "ambito_id"
    t.string "indizado", limit: 5
    t.index ["ambito_id"], name: "index_medios_on_ambito_id"
  end

  create_table "mensajes", force: :cascade do |t|
    t.bigint "actividad_id", null: false
    t.bigint "persona_id", null: false
    t.string "tipo", limit: 1
    t.string "estado", limit: 1
    t.text "txt"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "accion", limit: 2
    t.index ["actividad_id"], name: "index_mensajes_on_actividad_id"
    t.index ["persona_id"], name: "index_mensajes_on_persona_id"
  end

  create_table "niveles", force: :cascade do |t|
    t.string "nomnivel"
    t.string "clavenivel", limit: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "nivelestudios", force: :cascade do |t|
    t.string "nomnivel", limit: 65
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "paises", force: :cascade do |t|
    t.string "nompais", limit: 85
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "estado"
  end

  create_table "patentes", force: :cascade do |t|
    t.bigint "tipopatente_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "actividad_id", null: false
    t.index ["actividad_id"], name: "index_patentes_on_actividad_id"
    t.index ["tipopatente_id"], name: "index_patentes_on_tipopatente_id"
  end

  create_table "personas", force: :cascade do |t|
    t.string "nombre", limit: 45
    t.string "paterno", limit: 45
    t.string "materno", limit: 45
    t.string "email", limit: 50
    t.string "genero", limit: 1
    t.string "estado", limit: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "tipopersona_id", null: false
    t.integer "idfnet"
    t.integer "orden"
    t.integer "referenciaid"
    t.integer "cruid"
    t.integer "evalua"
    t.string "evaluacion", limit: 1, default: "N"
    t.integer "nopersonal"
    t.string "firma"
    t.index ["tipopersona_id"], name: "index_personas_on_tipopersona_id"
  end

  create_table "personas", force: :cascade do |t|
    t.string "nombre", limit: 45
    t.string "paterno", limit: 45
    t.string "materno", limit: 45
    t.string "email", limit: 50
    t.string "genero", limit: 1
    t.string "estado", limit: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "tipopersona_id", null: false
    t.integer "idfnet"
    t.integer "orden"
    t.integer "referenciaid"
    t.integer "cruid"
    t.integer "evalua"
    t.string "evaluacion", limit: 1, default: "N"
    t.integer "nopersonal"
    t.string "firma"
    t.index ["tipopersona_id"], name: "index_personas_on_tipopersona_id"
  end

  create_table "presupuestos", force: :cascade do |t|
    t.bigint "persona_id", null: false
    t.string "monto"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "numero"
    t.integer "noempleado"
    t.string "pmt"
    t.index ["persona_id"], name: "index_presupuestos_on_persona_id"
  end

  create_table "prodcategorias", force: :cascade do |t|
    t.string "nomcategoria"
    t.string "estado", limit: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "prodgrupos", force: :cascade do |t|
    t.string "nomgrupo"
    t.string "estado", limit: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "clave", limit: 25
  end

  create_table "productos", force: :cascade do |t|
    t.string "descripcion"
    t.string "descripcioncorta"
    t.integer "puntaje"
    t.bigint "prodcategoria_id", null: false
    t.bigint "prodgrupo_id", null: false
    t.string "estado", limit: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "pathf"
    t.string "concepto"
    t.string "comprobante"
    t.string "tipo", limit: 100
    t.index ["categoria_id"], name: "index_productos_on_categoria_id"
    t.index ["prodcategoria_id"], name: "index_productos_on_prodcategoria_id"
    t.index ["prodgrupo_id"], name: "index_productos_on_prodgrupo_id"
  end

  create_table "productos", force: :cascade do |t|
    t.string "descripcion"
    t.string "descripcioncorta"
    t.integer "puntaje"
    t.bigint "prodcategoria_id", null: false
    t.bigint "prodgrupo_id", null: false
    t.string "estado", limit: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "pathf"
    t.string "concepto"
    t.string "comprobante"
    t.string "tipo", limit: 100
    t.index ["categoria_id"], name: "index_productos_on_categoria_id"
    t.index ["prodcategoria_id"], name: "index_productos_on_prodcategoria_id"
    t.index ["prodgrupo_id"], name: "index_productos_on_prodgrupo_id"
  end

  create_table "proyectos", force: :cascade do |t|
    t.string "noregistro", limit: 30
    t.text "nombre"
    t.text "financiadora"
    t.boolean "transfconoc"
    t.text "nomcontacto"
    t.string "emailcontacto", limit: 85
    t.text "objetivo"
    t.text "prodesperado"
    t.text "impacto"
    t.boolean "interinstitucional"
    t.string "estado", limit: 3
    t.date "fvobo"
    t.date "fsa"
    t.date "fst"
    t.date "fadmin"
    t.date "fdir"
    t.bigint "convocatoria_id", null: false
    t.bigint "investigacion_id", null: false
    t.bigint "tipolocalidad_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["convocatoria_id"], name: "index_proyectos_on_convocatoria_id"
    t.index ["investigacion_id"], name: "index_proyectos_on_investigacion_id"
    t.index ["tipolocalidad_id"], name: "index_proyectos_on_tipolocalidad_id"
  end

  create_table "proyectos", force: :cascade do |t|
    t.string "noregistro", limit: 30
    t.text "nombre"
    t.text "financiadora"
    t.boolean "transfconoc"
    t.text "nomcontacto"
    t.string "emailcontacto", limit: 85
    t.text "objetivo"
    t.text "prodesperado"
    t.text "impacto"
    t.boolean "interinstitucional"
    t.string "estado", limit: 3
    t.date "fvobo"
    t.date "fsa"
    t.date "fst"
    t.date "fadmin"
    t.date "fdir"
    t.bigint "convocatoria_id", null: false
    t.bigint "investigacion_id", null: false
    t.bigint "tipolocalidad_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["convocatoria_id"], name: "index_proyectos_on_convocatoria_id"
    t.index ["investigacion_id"], name: "index_proyectos_on_investigacion_id"
    t.index ["tipolocalidad_id"], name: "index_proyectos_on_tipolocalidad_id"
  end

  create_table "publicaciones", force: :cascade do |t|
    t.text "titulo"
    t.text "cita"
    t.integer "anio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["medio_id"], name: "index_publicaciones_on_medio_id"
    t.index ["producto_id"], name: "index_publicaciones_on_producto_id"
    t.index ["red_id"], name: "index_publicaciones_on_red_id"
  end

  create_table "publicaciones", force: :cascade do |t|
    t.text "titulo"
    t.text "cita"
    t.integer "anio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["medio_id"], name: "index_publicaciones_on_medio_id"
    t.index ["producto_id"], name: "index_publicaciones_on_producto_id"
    t.index ["red_id"], name: "index_publicaciones_on_red_id"
  end

  create_table "puntos", force: :cascade do |t|
    t.integer "persona_id"
    t.integer "actividad_id"
    t.decimal "ptprod", precision: 16, scale: 2
    t.decimal "porcentaje", precision: 16, scale: 5
    t.decimal "pt", precision: 16, scale: 5
    t.text "comentarios"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "anio"
  end

  create_table "redes", force: :cascade do |t|
    t.string "nomred"
    t.string "clavered", limit: 15
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "redes", force: :cascade do |t|
    t.string "nomred"
    t.string "clavered", limit: 15
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "revistas", force: :cascade do |t|
    t.string "nomrevista"
    t.string "cuartil", limit: 3
    t.decimal "factor", precision: 7, scale: 3
    t.string "estado", limit: 1
    t.string "issn"
    t.string "eissn"
    t.bigint "editorial_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "tiporevista", limit: 1
    t.integer "referenciaid"
    t.index ["editorial_id"], name: "index_revistas_on_editorial_id"
    t.index ["medio_id"], name: "index_revistas_on_medio_id"
  end

  create_table "revistas", force: :cascade do |t|
    t.string "nomrevista"
    t.string "cuartil", limit: 3
    t.decimal "factor", precision: 7, scale: 3
    t.string "estado", limit: 1
    t.string "issn"
    t.string "eissn"
    t.bigint "editorial_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "tiporevista", limit: 1
    t.integer "referenciaid"
    t.index ["editorial_id"], name: "index_revistas_on_editorial_id"
    t.index ["medio_id"], name: "index_revistas_on_medio_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "nomrol"
    t.string "estado", limit: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "nomrol"
    t.string "estado", limit: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sustantivas", force: :cascade do |t|
    t.integer "anio"
    t.integer "investigadorid"
    t.text "descripcion"
    t.decimal "porcentaje", precision: 5, scale: 2
    t.bigint "academico_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "estado", limit: 1
    t.decimal "calidad", precision: 7, scale: 2
    t.decimal "eficiencia", precision: 7, scale: 2
    t.text "quizcalidad"
    t.text "quizeficiencia"
    t.index ["academico_id"], name: "index_sustantivas_on_academico_id"
  end

  create_table "tactividades", force: :cascade do |t|
    t.string "titulo"
    t.date "fpub"
    t.string "tipo", limit: 1
    t.integer "nocontrol"
    t.bigint "persona_id"
    t.bigint "red_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tproducto_id"
    t.bigint "catidioma_id"
    t.integer "anio"
    t.string "estado", limit: 1
    t.string "detalle"
    t.index ["catidioma_id"], name: "index_tactividades_on_catidioma_id"
    t.index ["persona_id"], name: "index_tactividades_on_persona_id"
    t.index ["red_id"], name: "index_tactividades_on_red_id"
    t.index ["tproducto_id"], name: "index_tactividades_on_tproducto_id"
  end

  create_table "tarticulos", force: :cascade do |t|
    t.string "doi"
    t.string "volumen", limit: 10
    t.string "subvolumen", limit: 10
    t.string "pgini", limit: 10
    t.string "pgfin", limit: 10
    t.string "medio", limit: 1
    t.string "naturaleza", limit: 1
    t.bigint "catrevista_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tactividad_id"
    t.index ["catrevista_id"], name: "index_tarticulos_on_catrevista_id"
    t.index ["tactividad_id"], name: "index_tarticulos_on_tactividad_id"
  end

  create_table "tautores", force: :cascade do |t|
    t.bigint "tactividad_id"
    t.bigint "persona_id"
    t.bigint "rol_id"
    t.integer "posicion"
    t.string "corresponsal", limit: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["persona_id"], name: "index_tautores_on_persona_id"
    t.index ["rol_id"], name: "index_tautores_on_rol_id"
    t.index ["tactividad_id"], name: "index_tautores_on_tactividad_id"
  end

  create_table "tcalificaciones", force: :cascade do |t|
    t.string "descripcion"
    t.string "clave", limit: 3
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tcapitulos", force: :cascade do |t|
    t.bigint "catlibro_id"
    t.integer "pgini"
    t.integer "pgfin"
    t.bigint "tactividad_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["catlibro_id"], name: "index_tcapitulos_on_catlibro_id"
    t.index ["tactividad_id"], name: "index_tcapitulos_on_tactividad_id"
  end

  create_table "tcolaboraciones", force: :cascade do |t|
    t.bigint "persona_id"
    t.bigint "tactividad_id"
    t.decimal "porcentaje", precision: 5, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "estado", limit: 1
    t.index ["persona_id"], name: "index_tcolaboraciones_on_persona_id"
    t.index ["tactividad_id"], name: "index_tcolaboraciones_on_tactividad_id"
  end

  create_table "tcursos", force: :cascade do |t|
    t.date "fini"
    t.date "ffin"
    t.string "institucion"
    t.integer "horasimp"
    t.integer "creditos"
    t.string "noalumnos"
    t.bigint "catnivel_id"
    t.bigint "tactividad_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "coordinador"
    t.string "periodo", limit: 10
    t.integer "horascurso"
    t.string "tipoimparte", limit: 25
    t.integer "idexterno"
    t.index ["catnivel_id"], name: "index_tcursos_on_catnivel_id"
    t.index ["tactividad_id"], name: "index_tcursos_on_tactividad_id"
  end

  create_table "tdivulgaciones", force: :cascade do |t|
    t.string "nomtipo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tesistas", force: :cascade do |t|
    t.date "ftermino"
    t.bigint "nivelestudio_id", null: false
    t.bigint "actividad_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "programa"
    t.date "fgrado"
    t.string "efterminal", limit: 2
    t.string "acta"
    t.string "comprobante"
    t.index ["actividad_id"], name: "index_tesistas_on_actividad_id"
    t.index ["nivelestudio_id"], name: "index_tesistas_on_nivelestudio_id"
  end

  create_table "tevaluaciones", force: :cascade do |t|
    t.json "respuestas"
    t.integer "tipo"
    t.bigint "tcolaboracion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tlistado_id"
    t.index ["tcolaboracion_id"], name: "index_tevaluaciones_on_tcolaboracion_id"
    t.index ["tlistado_id"], name: "index_tevaluaciones_on_tlistado_id"
  end

  create_table "tfamilias", force: :cascade do |t|
    t.string "nombre", limit: 60
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "visible", limit: 1
  end

  create_table "tipoautores", force: :cascade do |t|
    t.string "nomtipoautor"
    t.string "clave"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tipocapitulos", force: :cascade do |t|
    t.string "nomtipo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tipocursos", force: :cascade do |t|
    t.string "nomtipocurso", limit: 85
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tipodivulgaciones", force: :cascade do |t|
    t.string "nomtipodivulgacion"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "kate"
    t.integer "puntos"
  end

  create_table "tipoeditores", force: :cascade do |t|
    t.string "nomtipoeditor", limit: 200
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tipofasciculos", force: :cascade do |t|
    t.string "nomtipofasciculo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "puntos"
  end

  create_table "tipolibros", force: :cascade do |t|
    t.string "nomtipo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tipolocalidades", force: :cascade do |t|
    t.string "desctipolocalidad", limit: 25
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tipomedios", force: :cascade do |t|
    t.string "nomtipomedio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tipopatentes", force: :cascade do |t|
    t.string "nomtipopatente"
    t.string "clave", limit: 3
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "puntos"
  end

  create_table "tipopersonas", force: :cascade do |t|
    t.string "nomtipopersona", limit: 25
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "clave", limit: 1
  end

  create_table "tlibros", force: :cascade do |t|
    t.integer "paginas"
    t.string "isbn", limit: 30
    t.bigint "cateditorial_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tactividad_id"
    t.index ["cateditorial_id"], name: "index_tlibros_on_cateditorial_id"
    t.index ["tactividad_id"], name: "index_tlibros_on_tactividad_id"
  end

  create_table "tlistados", force: :cascade do |t|
    t.string "nombre"
    t.bigint "tcolaboracion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "porcentaje", precision: 5, scale: 2
    t.index ["tcolaboracion_id"], name: "index_tlistados_on_tcolaboracion_id"
  end

  create_table "totras", force: :cascade do |t|
    t.string "titulo"
    t.integer "cantidad"
    t.string "nivel", limit: 3
    t.string "fase", limit: 3
    t.string "participa", limit: 3
    t.bigint "tactividad_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "nodias"
    t.integer "noasisten"
    t.index ["tactividad_id"], name: "index_totras_on_tactividad_id"
  end

  create_table "tproductos", force: :cascade do |t|
    t.string "nombre"
    t.json "campos"
    t.bigint "tfamilia_id"
    t.bigint "categoria_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "grupo", limit: 2
    t.string "general", limit: 2
    t.index ["categoria_id"], name: "index_tproductos_on_categoria_id"
    t.index ["tfamilia_id"], name: "index_tproductos_on_tfamilia_id"
  end

  create_table "tproyectos", force: :cascade do |t|
    t.string "noproyecto", limit: 20
    t.string "tipopart", limit: 25
    t.decimal "porcentaje", precision: 5, scale: 2
    t.decimal "monto", precision: 16, scale: 6
    t.bigint "tactividad_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "coordinador"
    t.string "periodo", limit: 10
    t.integer "horascurso"
    t.string "tipoimparte", limit: 25
    t.integer "idexterno"
    t.index ["tactividad_id"], name: "index_tproyectos_on_tactividad_id"
  end

  create_table "ttesistas", force: :cascade do |t|
    t.date "fecha"
    t.string "institucion"
    t.bigint "catnivel_id"
    t.bigint "tactividad_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["catnivel_id"], name: "index_ttesistas_on_catnivel_id"
    t.index ["tactividad_id"], name: "index_ttesistas_on_tactividad_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "persona_id", null: false
    t.string "rol", limit: 1
    t.string "evaluador", limit: 1
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["persona_id"], name: "index_usuarios_on_persona_id"
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "persona_id", null: false
    t.string "rol", limit: 1
    t.string "evaluador", limit: 1
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["persona_id"], name: "index_usuarios_on_persona_id"
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  create_table "valetapas", force: :cascade do |t|
    t.bigint "actividad_id", null: false
    t.bigint "persona_id", null: false
    t.string "etapa"
    t.string "accion"
    t.string "estado"
    t.string "atendido"
    t.string "activo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["actividad_id"], name: "index_valetapas_on_actividad_id"
    t.index ["persona_id"], name: "index_valetapas_on_persona_id"
  end

  create_table "vinculaciones", force: :cascade do |t|
    t.string "tipovinculacion", limit: 2
    t.string "niveldecreto", limit: 1
    t.string "ordenamiento", limit: 1
    t.string "niveliniciativa", limit: 1
    t.string "nivelregla", limit: 1
    t.string "nivelcomite", limit: 1
    t.bigint "actividad_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["actividad_id"], name: "index_vinculaciones_on_actividad_id"
  end

  add_foreign_key "academicos", "categorias"
  add_foreign_key "academicos", "cru.personas", column: "persona_id"
  add_foreign_key "academicos", "cru.redes", column: "red_id"
  add_foreign_key "academicos", "niveles"
  add_foreign_key "academicos", "personas"
  add_foreign_key "academicos", "redes"
  add_foreign_key "academicos", "categorias"
  add_foreign_key "academicos", "cru.personas", column: "persona_id"
  add_foreign_key "academicos", "cru.redes", column: "red_id"
  add_foreign_key "academicos", "niveles"
  add_foreign_key "academicos", "personas"
  add_foreign_key "academicos", "redes"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_attachments", "cru.active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_attachments", "cru.active_storage_blobs", column: "blob_id"
  add_foreign_key "actividades", "cru.productos", column: "producto_id"
  add_foreign_key "actividades", "cru.redes", column: "red_id"
  add_foreign_key "actividades", "productos"
  add_foreign_key "actividades", "cru.productos", column: "producto_id"
  add_foreign_key "actividades", "cru.redes", column: "red_id"
  add_foreign_key "actividades", "productos"
  add_foreign_key "articulos", "actividades"
  add_foreign_key "articulos", "revistas"
  add_foreign_key "autores", "actividades"
  add_foreign_key "autores", "cru.personas", column: "persona_id"
  add_foreign_key "autores", "cru.publicaciones", column: "publicacion_id"
  add_foreign_key "autores", "cru.roles", column: "rol_id"
  add_foreign_key "autores", "personas"
  add_foreign_key "autores", "roles"
  add_foreign_key "autores", "actividades"
  add_foreign_key "autores", "cru.personas", column: "persona_id"
  add_foreign_key "autores", "cru.publicaciones", column: "publicacion_id"
  add_foreign_key "autores", "cru.roles", column: "rol_id"
  add_foreign_key "autores", "personas"
  add_foreign_key "autores", "roles"
  add_foreign_key "calificaciones", "itemsustantivas"
  add_foreign_key "calsustantivas", "actsustantivas"
  add_foreign_key "calsustantivas", "tcalificaciones"
  add_foreign_key "capitulos", "actividades"
  add_foreign_key "capitulos", "idiomas"
  add_foreign_key "capitulos", "libros"
  add_foreign_key "catlibros", "cateditoriales"
  add_foreign_key "comites", "catevaluadores"
  add_foreign_key "comvalidaciones", "academicos"
  add_foreign_key "comvalidaciones", "comites"
  add_foreign_key "cuartiles", "revistas"
  add_foreign_key "cursos", "actividades"
  add_foreign_key "cursos", "tipocursos"
  add_foreign_key "divulgaciones", "actividades"
  add_foreign_key "divulgaciones", "tipodivulgaciones"
  add_foreign_key "editores", "actividades"
  add_foreign_key "editores", "ambitos"
  add_foreign_key "editores", "idiomas"
  add_foreign_key "editoriales", "ambitos"
  add_foreign_key "editoriales", "cru.ambitos", column: "ambito_id"
  add_foreign_key "editoriales", "paises"
  add_foreign_key "editoriales", "ambitos"
  add_foreign_key "editoriales", "cru.ambitos", column: "ambito_id"
  add_foreign_key "editoriales", "paises"
  add_foreign_key "estimulos", "personas"
  add_foreign_key "evaltecnicos", "personas"
  add_foreign_key "evaluaciones", "personas"
  add_foreign_key "externos", "cru.personas", column: "persona_id"
  add_foreign_key "extras", "personas"
  add_foreign_key "fasciculos", "actividades"
  add_foreign_key "fasciculos", "tipofasciculos"
  add_foreign_key "fasciculos", "tipomedios"
  add_foreign_key "fichas", "actividades"
  add_foreign_key "historicos", "personas"
  add_foreign_key "identificadores", "codigos"
  add_foreign_key "identificadores", "cru.personas", column: "persona_id"
  add_foreign_key "itemsustantivas", "evaltecnicos"
  add_foreign_key "itemsustantivas", "personas"
  add_foreign_key "libroarbitrados", "actividades"
  add_foreign_key "libroarbitrados", "editoriales"
  add_foreign_key "libroarbitrados", "idiomas"
  add_foreign_key "libros", "cru.editoriales", column: "editorial_id"
  add_foreign_key "libros", "editoriales"
  add_foreign_key "libros", "medios"
  add_foreign_key "libros", "cru.editoriales", column: "editorial_id"
  add_foreign_key "libros", "editoriales"
  add_foreign_key "libros", "medios"
  add_foreign_key "medios", "cru.ambitos", column: "ambito_id"
  add_foreign_key "mensajes", "actividades"
  add_foreign_key "mensajes", "personas"
  add_foreign_key "patentes", "actividades"
  add_foreign_key "patentes", "tipopatentes"
  add_foreign_key "personas", "tipopersonas"
  add_foreign_key "personas", "tipopersonas"
  add_foreign_key "presupuestos", "personas"
  add_foreign_key "productos", "cru.categorias", column: "categoria_id"
  add_foreign_key "productos", "prodcategorias"
  add_foreign_key "productos", "prodgrupos"
  add_foreign_key "productos", "cru.categorias", column: "categoria_id"
  add_foreign_key "productos", "prodcategorias"
  add_foreign_key "productos", "prodgrupos"
  add_foreign_key "proyectos", "convocatorias"
  add_foreign_key "proyectos", "investigaciones"
  add_foreign_key "proyectos", "tipolocalidades"
  add_foreign_key "proyectos", "convocatorias"
  add_foreign_key "proyectos", "investigaciones"
  add_foreign_key "proyectos", "tipolocalidades"
  add_foreign_key "publicaciones", "cru.productos", column: "producto_id"
  add_foreign_key "publicaciones", "cru.redes", column: "red_id"
  add_foreign_key "publicaciones", "medios"
  add_foreign_key "publicaciones", "cru.productos", column: "producto_id"
  add_foreign_key "publicaciones", "cru.redes", column: "red_id"
  add_foreign_key "publicaciones", "medios"
  add_foreign_key "revistas", "editoriales"
  add_foreign_key "revistas", "medios"
  add_foreign_key "revistas", "editoriales"
  add_foreign_key "revistas", "medios"
  add_foreign_key "sustantivas", "academicos"
  add_foreign_key "tactividades", "catidiomas"
  add_foreign_key "tactividades", "cru.personas", column: "persona_id"
  add_foreign_key "tactividades", "cru.redes", column: "red_id"
  add_foreign_key "tactividades", "tproductos"
  add_foreign_key "tarticulos", "catrevistas"
  add_foreign_key "tarticulos", "tactividades"
  add_foreign_key "tautores", "cru.personas", column: "persona_id"
  add_foreign_key "tautores", "cru.roles", column: "rol_id"
  add_foreign_key "tautores", "tactividades"
  add_foreign_key "tcapitulos", "catlibros"
  add_foreign_key "tcapitulos", "tactividades"
  add_foreign_key "tcolaboraciones", "cru.personas", column: "persona_id"
  add_foreign_key "tcolaboraciones", "tactividades"
  add_foreign_key "tcursos", "catniveles"
  add_foreign_key "tcursos", "tactividades"
  add_foreign_key "tesistas", "actividades"
  add_foreign_key "tesistas", "nivelestudios"
  add_foreign_key "tevaluaciones", "tcolaboraciones"
  add_foreign_key "tevaluaciones", "tlistados"
  add_foreign_key "tlibros", "cateditoriales"
  add_foreign_key "tlibros", "tactividades"
  add_foreign_key "tlistados", "tcolaboraciones"
  add_foreign_key "totras", "tactividades"
  add_foreign_key "tproductos", "cru.categorias", column: "categoria_id"
  add_foreign_key "tproductos", "tfamilias"
  add_foreign_key "tproyectos", "tactividades"
  add_foreign_key "ttesistas", "catniveles"
  add_foreign_key "ttesistas", "tactividades"
  add_foreign_key "usuarios", "personas"
  add_foreign_key "usuarios", "personas"
  add_foreign_key "valetapas", "actividades"
  add_foreign_key "valetapas", "personas"
  add_foreign_key "vinculaciones", "actividades"
end
