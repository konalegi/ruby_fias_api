DB = Sequel.connect(Endive.application.config.db_config)
DB.extension(:pagination)