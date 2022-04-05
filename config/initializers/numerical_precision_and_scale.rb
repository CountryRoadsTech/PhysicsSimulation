# Sets the numerical precision and scale used by PostgreSQL Numeric type in db migrations.
# Set to nil to use unconstrained values, they will not be truncated on insertion and grow as needed.

Rails.application.config.numeric_precision = nil
Rails.application.config.numeric_scale = nil
