
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
import 'bootstrap/dist/js/bootstrap';
import "controllers"


require("packs/sesion");

require('select2');

//import { Application } from "stimulus"
//import { definitionsFromContext } from "stimulus/webpack-helpers"

//const application = Application.start()
//const context = require.context("../controllers", true, /\.js$/)
//application.load(definitionsFromContext(context))

var $ = require('jquery');
window.jQuery = $;
window.$ = $;

const images = require.context('../images', true)
const imagePath = (name) => images(name, true)
require("trix")
require("@rails/actiontext")