ActiveRecord::Schema.define(version: 2018_10_13_075901) do

  enable_extension "plpgsql"

  create_table "murmurs", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
