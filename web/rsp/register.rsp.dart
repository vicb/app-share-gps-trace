//Auto-generated by RSP Compiler
//Source: register.rsp.html
part of trails;

/** Template, register, for rendering the view. */
Future register(HttpConnect connect) { //#2
  var _t0_, _cs_ = new List<HttpConnect>();
  HttpRequest request = connect.request;
  HttpResponse response = connect.response;
  if (!Rsp.init(connect, "text/html; charset=utf-8"))
    return new Future.value();

  response.write("""<!DOCTYPE html>
<html>
 <head>
     <title>La Boussole - Enregistrement</title>
"""); //#2

  return connect.include("/rsp/templates/assetsimports.html").then((_) { //include#6

    response.write("""  </head>
  <body>   
"""); //#7

    var _0 = new StringBuffer(); _cs_.add(connect); //var#10
    connect = new HttpConnect.stringBuffer(connect, _0); response = connect.response;

    response.write("""

        <h1>Enregistrement</h1>

          <div class="form-group form-login">
            <input  type="text" class="form-control input-login"  placeholder="Login">
          </div>
          <div class="form-group form-password">
            <input  type="password" class="form-control input-password"  placeholder="Mot de passe">
          </div>        
          <div class="form-group form-passwordConfirm">
            <input  type="password" class="form-control input-passwordConfirm"  placeholder="Confirmation mot de passe">
          </div>    
          <div class="form-group">
              <button  type="submit" class="btn btn-default btn-submit-register loading-on-click">S'enregister</button>
              <div class="text-warning  form-error-message" ></div>
          </div>

"""); //#11

    connect = _cs_.removeLast(); response = connect.response;

    var _1 = new StringBuffer(); _cs_.add(connect); //var#29
    connect = new HttpConnect.stringBuffer(connect, _1); response = connect.response;

    connect = _cs_.removeLast(); response = connect.response;

    var _2 = new StringBuffer(); _cs_.add(connect); //var#30
    connect = new HttpConnect.stringBuffer(connect, _2); response = connect.response;

    connect = _cs_.removeLast(); response = connect.response;

    var _3 = new StringBuffer(); _cs_.add(connect); //var#31
    connect = new HttpConnect.stringBuffer(connect, _3); response = connect.response;

    connect = _cs_.removeLast(); response = connect.response;

    return Rsp.nnf(spaces(new HttpConnect.chain(connect), nw: _0.toString(), ne: _1.toString(), sw: _2.toString(), se: _3.toString())).then((_) { //include#9

      response.write("""    
    
    <div id="register-success" class="modal fade" tabindex="-1" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h3>Bienvenue !</h3>
          </div>
          <div class="modal-body">
            <p>Vous allez pouvoir jouer avec la boussole !</p>
          </div>
          <div class="modal-footer">
            <button class="btn btn-primary btn-login">Se connecter</button>
          </div>
        </div>
      </div>
    </div>    
    
    
    <script type="application/dart" src="/client/register.dart"></script>
    <script src="/packages/browser/dart.js"></script>
  </body>
</html>











"""); //#33

      return new Future.value();
    }); //end-of-include
  }); //end-of-include
}
