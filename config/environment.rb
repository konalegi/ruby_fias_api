# Load application
require File.expand_path('../application', __FILE__)


# Initialize the Endive application.
Endive.application.initialize!

# Here code to load all app files
# In future may be will like rails const autoloading
Dir.glob(File.join(File.dirname(__FILE__), '../app/**/*.rb')){ |file| require(file) }