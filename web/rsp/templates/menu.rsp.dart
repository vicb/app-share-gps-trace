//Auto-generated by RSP Compiler
//Source: menu.rsp.html
part of trails;

/** Template, menu, for rendering the view. */
Future menu(HttpConnect connect) { //#2
  var _t0_, _cs_ = new List<HttpConnect>();
  HttpRequest request = connect.request;
  HttpResponse response = connect.response;
  Rsp.init(connect, "text/html; charset=utf-8");

  response.write("""    <div class="space-menu"  >
        <ul role="menu" class="dropdown-menu open" id="menu">
          <li role="presentation" class="dropdown-header">Profil """); //#2

  response.write(Rsp.nnx(currentUser(request.session) != null ? "de " + currentUser(request.session).login: "")); //#4


  response.write("""</li>
"""); //#4

  if (currentUser(request.session) != null) { //if#5

    response.write("""            <li role="presentation"><a href="/logout" tabindex="-1" role="menuitem">Déconnection</a></li>
"""); //#6

  } else { //else#7

    response.write("""            <li role="presentation"><a href="/login" tabindex="-1" role="menuitem">Connection</a></li>
            <li role="presentation"><a href="/register" tabindex="-1" role="menuitem">Enregistrement</a></li>
"""); //#8
  } //if

  response.write("""          <li class="divider" role="presentation"></li>
          <li role="presentation" class="dropdown-header">A propos</li>
          <li role="presentation"><a href="/about" tabindex="-1" role="menuitem">Le projet</a></li>
          <li role="presentation"><a href="/mock" tabindex="-1" role="menuitem">Maquette</a></li>
        </ul>
    </div>"""); //#11

  return Rsp.nnf();
}