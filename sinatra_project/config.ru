require "./config/environment"

use Rack::MethodOverride
use Usercontroller
use MuppetController
run ApplicationController
