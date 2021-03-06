library trails;

import "dart:io";
import "dart:async";
import "dart:convert";
import 'package:intl/intl.dart';
import 'package:http_server/http_server.dart';
import "package:rikulo_security/plugin.dart";
import "package:rikulo_security/security.dart";
import "package:stream/stream.dart";
import "package:rikulo_commons/convert.dart" ;
import "package:gps_trace/gps_trace.dart";

import  "../web/shared/forms.dart";
import  "../web/client/renderers.dart";
import  "models.dart";
import  "persistence.dart";
import  "aaa.dart";
import "i18n.dart" ;

part "../web/rsp/index.rsp.dart";
part "../web/rsp/sandbox.rsp.dart";
part "../web/rsp/errors/errorPage403.rsp.dart";
part "../web/rsp/errors/errorPage404.rsp.dart";
part "../web/rsp/errors/errorPage500.rsp.dart";
part "../web/rsp/traceView.rsp.dart" ;
part "../web/rsp/traceFormatGpxView.rsp.dart" ;

part "../web/rsp/templates/spaces.rsp.dart";
part "../web/rsp/templates/searchForm.rsp.dart";

part "../web/rsp/widgets/confirmWidget.rsp.dart";
part "../web/rsp/widgets/loginWidget.rsp.dart";
part "../web/rsp/widgets/logoutWidget.rsp.dart";
part "../web/rsp/widgets/registerWidget.rsp.dart";
part "../web/rsp/widgets/persistentMenuWidget.rsp.dart";
part "../web/rsp/widgets/connectedUserWidget.rsp.dart";
part "../web/rsp/widgets/menuWidget.rsp.dart";
part "../web/rsp/widgets/sharedWidgets.rsp.dart";
part "../web/rsp/widgets/loadingWidget.rsp.dart";
part "../web/rsp/widgets/profileWidget.rsp.dart";
part "../web/rsp/widgets/headerWidget.rsp.dart";
part "../web/rsp/widgets/watchPointEditorWidget.rsp.dart";
part "../web/rsp/widgets/uploadFileWidget.rsp.dart";
part "../web/rsp/widgets/centerWidget.rsp.dart";

part "../web/rsp/fragments/indexTextFragment.rsp.dart";
part "../web/rsp/fragments/indexButtonsFragment.rsp.dart";
part "../web/rsp/fragments/legalDisclaimerFragment.rsp.dart";
part "../web/rsp/fragments/legalTermsFragment.rsp.dart";

part "../web/rsp/fragments/aboutApplicationFragment.rsp.dart";
part "../web/rsp/fragments/aboutFeedbacksFragment.rsp.dart";
part "../web/rsp/fragments/aboutDevFragment.rsp.dart";
part "../web/rsp/fragments/aboutAuthorFragment.rsp.dart";
part "../web/rsp/fragments/traceFormFragment.rsp.dart";
part "../web/rsp/fragments/traceFormSubmitFragment.rsp.dart";
part "../web/rsp/fragments/traceSearchFormFragment.rsp.dart";
part "../web/rsp/fragments/traceSearchResultsFragment.rsp.dart";
part "../web/rsp/fragments/traceSearchMapFragment.rsp.dart";

part "../web/rsp/fragments/traceDisplayTextFragment.rsp.dart";
part "../web/rsp/fragments/traceDisplayCommentsFragment.rsp.dart";
part "../web/rsp/fragments/traceDisplayProfileFragment.rsp.dart";
part "../web/rsp/fragments/traceDisplayMapFragment.rsp.dart";

class ServerController{
  
  Future forbiddenAction(HttpConnect connect){
    return connect.forward("/403") ;
  }
  
}

class JsonFeatures {
  
  Future<Map> decodePostedJson(
      Stream<List<int>> request, [Map<String, String> parameters])
      => readAsString(request)
         .then((String data) {
          return JSON.decode(data); 
   });
  
  Future postJson(HttpResponse response, ToJson form){
    response
      ..headers.contentType = new ContentType("application", "json", charset: "utf-8")
      ..write( JSON.encode( form.toJson()) );  
    return new Future.value(); 
  }
  
}

class TraceController extends ServerController with JsonFeatures{
  
  PersistenceLayer _persistence ;
  Crypto _crypto ;
  Security _security ;
  String _appUri ;
  TraceAnalyser _traceAnalyser = new TraceAnalyser();
  
  TraceController(this._persistence, this._crypto, this._appUri){

    final authenticator = new Authentication(_persistence,_crypto) ;
    final accessControl = new SimpleAccessControl({
      "/.*": ["user", "admin"]
    });
  
    _security = new Security(authenticator, accessControl);
    
  }
  
  Security get security => _security ;
  
  
  Future indexShow(HttpConnect connect){
    return _persistence.getTraces().then((traces) {
      List<LigthTraceRenderer> lightTraceRendererList = new List<LigthTraceRenderer>();
      if ( traces.isNotEmpty  ){
        traces.forEach((trace)=>(lightTraceRendererList.add(new LigthTraceRenderer(trace))  ));
      }
      LigthTraceRenderers ligthTraceRenderers = new LigthTraceRenderers();
      ligthTraceRenderers.traces = lightTraceRendererList;
      return index(connect, lightTraceRenderers:ligthTraceRenderers, traceFormRenderer: new TraceFormRenderer());
    });
  }
  
  Future sandboxShow(HttpConnect connect){
    return sandbox(connect) ;
  }
  
  
  Future jsonTraceSearch(HttpConnect connect) {
    return decodePostedJson(connect.request,
        new Map.from(connect.request.uri.queryParameters))
        .then((Map params) {

            final SearchForm form = new SearchForm.fromMap(params );
            SearchFilters filters = new SearchFilters();
            filters.search = form.search;
            filters.creator = form.creator;
            filters.activities = form.activities;
                        
            filters.lengthGt = castToNum(form.lengthGt,1000) ;
            filters.upGt  = castToNum(form.upGt,1) ;
            filters.inclinationUpGt = castToNum(form.inclinationUpGt,1);
            filters.startPointElevetionGt = castToNum(form.startPointElevetionGt,1);
            filters.upperPointElevetionGt = castToNum(form.upperPointElevetionGt,1);
            filters.difficultyGt = castToNum(form.difficultyGt,1);
            filters.lengthLt = castToNum(form.lengthLt,1000);
            filters.upLt  = castToNum(form.upLt,1);
            filters.inclinationUpLt = castToNum(form.inclinationUpLt,1);
            filters.startPointElevetionLt = castToNum(form.startPointElevetionLt,1);
            filters.upperPointElevetionLt = castToNum(form.upperPointElevetionLt,1);
            filters.difficultyLt = castToNum(form.difficultyLt,1);
            
            filters.mapBoundNELat = form.mapBoundNELat ;
            filters.mapBoundNELong  = form.mapBoundNELong ;
            filters.mapBoundSWLat  = form.mapBoundSWLat ;
            filters.mapBoundSWLong  = form.mapBoundSWLong ;
            
            return  _persistence.getTracesByFilters(filters).then((traces){
              form.results = new List();
              if (traces != null){
                traces.forEach((trace){
                  
                    LigthTraceRenderer traceLightRenderer = new LigthTraceRenderer(trace);
                    LightTrace  lightTrace = new   LightTrace(traceLightRenderer.key, traceLightRenderer.creator, traceLightRenderer.titleWithUrl, trace.activities, traceLightRenderer.activities, 
                        traceLightRenderer.length, traceLightRenderer.up, traceLightRenderer.upperPointElevetion, 
                        traceLightRenderer.inclinationUp, traceLightRenderer.difficulty,
                        traceLightRenderer.trace.startPointLatitude,traceLightRenderer.trace.startPointLongitude );
                    form.results.add(lightTrace) ;
                });
              }
              return postJson(connect.response, form); 
            });
          
        });
  }
  
  Future jsonTraceDelete(HttpConnect connect) {
    
    User user =  currentUser(connect.request.session);
    if (user == null  ){
      return  forbiddenAction(connect) ;
    }
    
    return decodePostedJson(connect.request,
        new Map.from(connect.request.uri.queryParameters))
        .then((Map params) {

          final DeleteTraceForm form = new DeleteTraceForm.fromJson(params );

          return _persistence.getTraceByKey(form.key).then((trace){
            if ( trace == null ){
              return forbiddenAction(connect) ;
            }
            if (user.login == trace.creator || user.admin  ){
              return _persistence.deleteTraceByKey(form.key).then((_){
                return postJson(connect.response, form); 
              });              
            }else{
              return forbiddenAction(connect) ;
            }
            return postJson(connect.response, form); 
          });
    });
  }

  Future jsonWatchPointCreateOrUpdate(HttpConnect connect){
    User user =  currentUser(connect.request.session);
    if (user == null  ){
      WatchPointForm watchPointForm = new WatchPointForm.empty();
      watchPointForm.setError("forbiddenAction", "");
      return postJson(connect.response, watchPointForm); 
    }
    return decodePostedJson(connect.request,
        new Map.from(connect.request.uri.queryParameters))
        .then((Map params) {

        WatchPointForm watchPointForm = new WatchPointForm.fromJson(params );
        WatchPoint watchPoint = new WatchPoint(user.login,
                                               watchPointForm.name, 
                                               watchPointForm.description, 
                                               watchPointForm.type, 
                                               watchPointForm.latitude, 
                                               watchPointForm.longitude);
        if ( watchPointForm.validate()){
          watchPoint.traceKey = watchPointForm.traceKey;
          return _persistence.saveOrUpdateWatchPoint(watchPoint).then((_){
            return postJson(connect.response, watchPointForm);
          });
        }else{
          return postJson(connect.response, watchPointForm);     
        }
    });
  }
  
  Future jsonWatchPointDelete(HttpConnect connect){
     User user =  currentUser(connect.request.session);
     if (user == null   ){
       WatchPointForm watchPointForm = new WatchPointForm.empty();
       watchPointForm.setError("forbiddenAction", "");
       return postJson(connect.response, watchPointForm); 
     }
     return decodePostedJson(connect.request,
         new Map.from(connect.request.uri.queryParameters))
         .then((Map params) {

         WatchPointForm watchPointForm = new WatchPointForm.fromJson(params );
         return _persistence.getWatchPointByTraceKeyAndPosition(watchPointForm.traceKey, watchPointForm.latitude, watchPointForm.longitude).then((watchPoint){
           
           if(watchPoint == null){
             watchPointForm.setError(WATCH_POINT_ERROR_NOT_FOUND, "");
             return postJson(connect.response, watchPointForm);
           }
             
           if (! user.admin && user.login != watchPoint.creator){
             watchPointForm.setError("forbiddenAction", "");
             return postJson(connect.response, watchPointForm); 
           }
             
           return _persistence.deleteWatchPoint(watchPointForm.traceKey, watchPointForm.latitude, watchPointForm.longitude).then((watchPoint){
             return postJson(connect.response, watchPointForm); 
           });
         }); 
     });
   }
   
  
  
  Future jsonWatchPointSelect(HttpConnect connect){
    return decodePostedJson(connect.request,
        new Map.from(connect.request.uri.queryParameters))
        .then((Map params) {

        WatchPointForm watchPointForm = new WatchPointForm.fromJson(params );
        
        return _persistence.getWatchPointByTraceKeyAndPosition(watchPointForm.traceKey, watchPointForm.latitude, watchPointForm.longitude).then((watchPoint){
          
          if(watchPoint == null){
            watchPointForm.setError(WATCH_POINT_ERROR_NOT_FOUND, "");
          }else{
            watchPointForm.name = watchPoint.name ;
            watchPointForm.type = watchPoint.type ;
            watchPointForm.description = watchPoint.description ;
          }
          
          return postJson(connect.response, watchPointForm);
        }); 

    });    
  }
  
  Future jsonTraceCreateOrUpdate(HttpConnect connect) {

    User user =  currentUser(connect.request.session);
    if (user == null  ){
      TraceForm traceForm = new TraceForm();
      traceForm.setError("forbiddenAction", "");
      return postJson(connect.response, traceForm); 
    }

    return _buildParameters(connect).then((body){
      TraceForm traceForm = _buildTraceForm(body);
      
      if ( !traceForm.operationAllowed(user.login, user.admin)){
        traceForm.setError("forbiddenAction", "");
        return postJson(connect.response, traceForm); 
      }

      if (traceForm.isCreate) {
        return _jsonTraceCreate(connect, user, traceForm, body.body['gps-file']) ;
      }else{
        return _jsonTraceUpdate(connect, traceForm) ;
      }      
    });
  }
  
  Future<HttpRequestBody> _buildParameters(HttpConnect connect){
    return HttpBodyHandler.processRequest(connect.request).then((body)=> body) ;
  }
  
  TraceForm _buildTraceForm(HttpRequestBody body){
    TraceForm traceForm = new TraceForm();
    Map parameters = body.body as Map ;
    traceForm.isUpdate = parameters['isUpdate'] == "true";
    traceForm.key = parameters['key'];
    traceForm.title = parameters['title'];
    traceForm.description = parameters['description'];
    traceForm.smoothing = parameters['smoothing'];
    List<String> activityKeys = new List<String>();
    String activityPrefix = "activity-";
    parameters.forEach((k,v){
          if ( k.toString().startsWith(activityPrefix) ){
            activityKeys.add(  k.substring(activityPrefix.length)  );
          }
        }       
    );
    traceForm.activityKeys = activityKeys ;
    
    return traceForm;
  }
  
  Future _jsonTraceCreate(HttpConnect connect,  User user, TraceForm traceForm , HttpBodyFileUpload fileUploaded) {
    
    if(fileUploaded != null){
      traceForm.gpsFileName = fileUploaded.filename;
    }
    traceForm.validate();
    if (! traceForm.isSuccess){
      return postJson(connect.response, traceForm);
    }
    
    DateTime now = new DateTime.now();
    String tempFile = "/tmp/" +  now.millisecondsSinceEpoch.toString();
    File file = new File(tempFile);
    SmoothingParameters smoothingParameters = SmoothingParameters.get( SmoothingLevel.fromString(traceForm.smoothing ));
    return file.writeAsBytes(fileUploaded.content, mode: FileMode.WRITE)
        .then((_) {
          return  _traceAnalyser.buildTraceAnalysisFromGpxFile(file,applyPurge:true,smoothingParameters:smoothingParameters ).then((traceAnalysis){
            
            Trace trace = new Trace.fromTraceAnalysis(user.login, traceAnalysis); 
            trace.title = traceForm.title ;
            trace.smoothing = traceForm.smoothing;
            trace.description = traceForm.description ;
            trace.activities = traceForm.activityKeys; 
            return _persistence.saveOrUpdateTrace(trace).then((trace) {
              traceForm.key = trace.key;
              return postJson(connect.response, traceForm);  
            });
          });
        }).whenComplete((){
          try {
            new File(tempFile).delete();
          } catch(e) {
            print("Unable to delete ${tempFile}: ${e}");
          }
        } ).catchError((e){
          print("Unable create the trace : ${e}");
          traceForm.setError("server side error","");
          return postJson(connect.response, traceForm);  
        });
    
  }
  
  Future _jsonTraceUpdate(HttpConnect connect,  TraceForm traceForm ) {
    
    traceForm.validate();
    if (! traceForm.isSuccess){
      return postJson(connect.response, traceForm);
    }
    
    return _persistence.getTraceByKey(traceForm.key).then((trace) {
      if (  trace == null ){
        traceForm.setError("forbiddenAction", "");
        return postJson(connect.response, traceForm);
      }
      trace.title = traceForm.title ;
      trace.description = traceForm.description ;
      trace.activities = traceForm.activityKeys; 
      return _persistence.saveOrUpdateTrace(trace).then((trace) {
        return postJson(connect.response, traceForm);  
      });
      
    });
    
  }
  
  Future jsonTraceDetails(HttpConnect connect) {
    String creator = connect.dataset["creator"];
    String titleKey = connect.dataset["titleKey"];
    String key = creator +"/" + titleKey;
    return _persistence.getTraceByKey(key).then((trace) {
      return  _persistence.getWatchPointByTraceKey(key).then((watchPoints) {
        if (trace == null){
          return postJson(connect.response, new TraceDetails());
        }else{
          String gpxUrl = _appUri +"/trace.gpx/id-"+trace.cleanId ;
          String permanentTraceUrl = _appUri + "/trace/id-"+trace.cleanId ;
          TraceRenderer traceRenderer = new TraceRenderer(trace,watchPoints, permanentTraceUrl,gpxUrl);
          return postJson(connect.response, traceRenderer.traceDetails);
        }
      });
    });
    
  }
  
  num castToNum(String value, int times){
    if (value == null){
      return null;
    }else{
      try{
        return double.parse(value)* times;
      }catch(e){
        return null;
      }
    }
  }
 
 
  Future traceShowByKey(HttpConnect connect) {
    String creator = connect.dataset["creator"];
    String titleKey = connect.dataset["titleKey"];
    String key = creator +"/" + titleKey;
    return _persistence.getTraceByKey(key).then((trace) {
      String gpxUrl = _appUri +"/trace.gpx/"+key ;
      String permanentTraceUrl = _appUri + "/trace/"+key ;
      TraceRenderer renderer = new TraceRenderer(trace,null, permanentTraceUrl,gpxUrl);
      return traceView(connect, traceRenderer:renderer);
    });
  }
  
  Future traceFormatGpxShowById(HttpConnect connect) {
    String cleanTraceId = connect.dataset["traceId"];
    String traceId = "ObjectId(\"" + cleanTraceId +"\")";
    return _persistence.getTraceById(traceId).then((trace) {
      connect.response.headers.set("Content-Type", "application/gpx") ; 
      connect.response.headers.set("Content-disposition", "attachment; filename=id-${cleanTraceId}.gpx") ; 
      return traceFormatGpxView(connect, trace:trace);
    });
  }
  
  Future traceFormatGpxShowByKey(HttpConnect connect) {
    String creator = connect.dataset["creator"];
    String titleKey = connect.dataset["titleKey"];
    String key = creator +"/" + titleKey;
    return _persistence.getTraceByKey(key).then((trace) {
      connect.response.headers.set("Content-Type", "application/gpx") ; 
      connect.response.headers.set("Content-disposition", "attachment; filename=${creator}-${titleKey}.gpx") ; 
      return traceFormatGpxView(connect, trace:trace);
    });
  }  
  

  
}




class UserServerController extends ServerController with JsonFeatures{
  
  PersistenceLayer _persistence ;
  Crypto _crypto ;
  Security _security ;
  
  UserServerController(this._persistence, this._crypto){

    final authenticator = new Authentication(_persistence,_crypto) ;
    final accessControl = new SimpleAccessControl({
      "/.*": ["user", "admin"]
    });
  
    _security = new Security(authenticator, accessControl);
  }

  
  Future<LoginForm> _login(HttpConnect connect, String login, String password){
    
    LoginForm form = new LoginForm(login,null) ;
    return _security.login(connect, rememberMe:true, redirect: false, 
        username: login,
        password: password).then((_){
          return _persistence.getUserByLogin(login).then((user){
            form.admin = user.admin;
            form.encryptedPassword = user.encryptedPassword;
            return form; 
          } );
        } ).catchError((ex) {
          form.error = "login failure" ;
          return form; 
        });
  }

  Future jsonLogout(HttpConnect connect) {
    return _security.logout(connect, redirect: false).then((_){
       LoginForm logoutForm = new LoginForm(null,null) ;
       return  postJson(connect.response, logoutForm);
    }); 
  }
  
  Future jsonLogin(HttpConnect connect) {
    return decodePostedJson(connect.request,
        new Map.from(connect.request.uri.queryParameters))
        .then((Map params) {
          LoginForm loginForm = new LoginForm.fromJson(params);
          String password = loginForm.password != null ? loginForm.password : loginForm.encryptedPassword ;
          
          return _login(connect, loginForm.login, password)
                       .then((form){
                           postJson(connect.response, form.resetPassword());
                       });
    });
  }
  
  
  Future jsonRegister(HttpConnect connect) {
    
    return decodePostedJson(connect.request,
                        new Map.from(connect.request.uri.queryParameters))
                             .then((Map params) {

      final RegisterForm registerForm = new RegisterForm.fromMap(params );
      if ( !registerForm.validate() ){
        return postJson(connect.response, registerForm);
      }else{
        return  _persistence.getUserByLogin(registerForm.login).then((user){
            if (user != null){
              registerForm.setErrorLoginExists();
              return postJson(connect.response, registerForm); 
            }else{   
              
              User user = new User.withLogin(registerForm.login,_crypto.encryptPassword(registerForm.password));
              print ("# Register user "+ user.toJson().toString());

              return _persistence.saveOrUpdateUser(user).then((_){
                return _login(connect, registerForm.login, registerForm.password)
                    .then((form){
                      registerForm.encryptedPassword = form.encryptedPassword;
                      postJson(connect.response, registerForm.resetPassword());
                    });
              });
            }
          });
      }
    });
  }
  
}

class FragmentsController extends ServerController{
  
  PersistenceLayer _persistence ;
  
  FragmentsController(this._persistence);
  
  Future indexButtons(HttpConnect connect){
    return indexButtonsFragment(connect);
  }
  Future indexText(HttpConnect connect){
    return indexTextFragment(connect);
  }
  Future legalDisclaimer(HttpConnect connect){
    return legalDisclaimerFragment(connect);
  }  
  Future legalTerms(HttpConnect connect){
    return legalTermsFragment(connect);
  }  
  Future aboutApplication(HttpConnect connect){
    return aboutApplicationFragment(connect);
  }
  Future aboutFeedbacks(HttpConnect connect){
    return aboutFeedbacksFragment(connect);
  }  
  Future aboutDev(HttpConnect connect){
    return aboutDevFragment(connect);
  }   
  Future aboutAuthor(HttpConnect connect){
    return aboutAuthorFragment(connect);
  }   
  Future traceCreateOrUpdateForm(HttpConnect connect){
    return traceFormFragment(connect,traceFormRenderer: new TraceFormRenderer());
  }     
  Future traceSearchForm(HttpConnect connect){
    return traceSearchFormFragment(connect,traceFormRenderer: new TraceFormRenderer());
  }  
  Future traceSearchResults(HttpConnect connect){
    return traceSearchResultsFragment(connect);
  }
  Future traceSearchMap(HttpConnect connect){
    return _persistence.getTraces().then((traces) {
      List<LigthTraceRenderer> lightTraceRendererList = new List<LigthTraceRenderer>();
      if ( traces.isNotEmpty  ){
        traces.forEach((trace)=>(lightTraceRendererList.add(new LigthTraceRenderer(trace))  ));
      }
      LigthTraceRenderers ligthTraceRenderers = new LigthTraceRenderers();
      ligthTraceRenderers.traces = lightTraceRendererList;
      return traceSearchMapFragment(connect);
    });
  }
}

class ErrorServerController extends ServerController {
  
  Future errorPage403Show(HttpConnect connect){
    return errorPage403(connect);
  }

  Future errorPage404Show(HttpConnect connect){
    return errorPage404(connect);
  }
  
  Future errorPage500Show(HttpConnect connect){
    return errorPage500(connect);
  }
  
}


