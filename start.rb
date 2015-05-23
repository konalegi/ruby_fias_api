require ::File.expand_path('../config/environment',  __FILE__)

Endive::Server::HttpServer.new(Endive.application)
sleep