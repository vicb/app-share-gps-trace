
library trails;

import "package:stream/stream.dart";
import "dart:io";
import "dart:async";
import "package:rikulo_security/security.dart";
import "package:rikulo_security/plugin.dart";

import "package:rikulo_commons/io.dart" show HttpUtil;

import  "../lib/forms.dart";
import  "../lib/models.dart";
import  "../lib/persistence.dart";
import  "../lib/aaa.dart";
import  "../lib/controllers.dart";

part "rsp/login.rsp.dart";
part "rsp/register.rsp.dart";
part "rsp/index.rsp.dart";
part "rsp/about.rsp.dart";
part "rsp/mock.rsp.dart";

class TrailsServer{
  
  String host;
  int port;
  
  TrailController _trailController;
  
  TrailsServer(this.host,this.port){
    createApplicationContext();
  }
  
  TrailsServer.forHeroku(){
    host ="0.0.0.0";
    port = int.parse(Platform.environment['PORT']);
    createApplicationContext();
  }
  
  void createApplicationContext(){
    String mongoDbUri = Platform.environment['MONGO_DB_URI'] ;
    PersistenceLayer _persistenceLayer = new MongoPersistence(mongoDbUri);
    Crypto _crypto = new Crypto();
    _trailController = new TrailController(_persistenceLayer,_crypto) ;
  }
  
  
  void start(){
    new StreamServer(
        uriMapping: {
          "/": index, 

          "/register": register, 
          "/s_register": _trailController.register,

          "/login": login, 
          "/s_login": _trailController.login,
          "/s_logout": _trailController.logout,

          "/about": about, 
          "/mock": mock 
        
        },
        /* filterMapping: {
          "/.*": security.filter
        },*/
        errorMapping: {
          "404": "/404.html"
        }
    ).start(address:host, port:port);
  }

}







