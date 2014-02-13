//Auto-generated by RSP Compiler
//Source: menuWidget.rsp.html
part of trails;

/** Template, menuWidget, for rendering the view. */
Future menuWidget(HttpConnect connect, {menuId}) { //#2
  var _t0_, _cs_ = new List<HttpConnect>();
  HttpRequest request = connect.request;
  HttpResponse response = connect.response;
  if (!Rsp.init(connect, "text/html; charset=utf-8"))
    return new Future.value();

  response.write("""    <div  id=\""""); //#2

  response.write(Rsp.nnx(menuId)); //#2


  response.write(""""   >
         <div   id=\""""); //#2

  response.write(Rsp.nnx(menuId)); //#3


  response.write("""-when-anonymous"  """); //#3

  if (currentUser(request.session) != null) { //if#3

    response.write("""class="space-menu gx-hidden" """); //#3

  } else { //else#3

    response.write("""class="space-menu\""""); //#3
  } //if

  response.write(""" > 
              <ul role="menu" class="dropdown-menu" >
                <li role="presentation" class="dropdown-header">Traces gps</li>
                <li role="presentation"><a class="loading-on-click" href="/trace.search" tabindex="-1" role="menuitem">Rechercher</a></li>
                <li class="divider" role="presentation"></li>
                <li role="presentation" class="dropdown-header">Compte</li>
                <li role="presentation"><a  id=\""""); //#3

  response.write(Rsp.nnx(menuId)); //#9


  response.write("""-login" class="gx-as-link" tabindex="-1" role="menuitem">Se connecter</a></li>
                <li role="presentation"><a  id=\""""); //#9

  response.write(Rsp.nnx(menuId)); //#10


  response.write("""-register" class="gx-as-link"  tabindex="-1" role="menuitem">S'enregistrer</a></li>
              </ul>
         </div>    
        <div id=\""""); //#10

  response.write(Rsp.nnx(menuId)); //#13


  response.write("""-when-user" """); //#13

  if (currentUser(request.session) == null || currentUser(request.session) != null  && ! currentUser(request.session).admin) { //if#13

    response.write("""class="space-menu gx-hidden\""""); //#13

  } else { //else#13

    response.write("""class="space-menu\""""); //#13
  } //if

  response.write(""" >
              <ul role="menu" class="dropdown-menu"  >
                <li role="presentation" class="dropdown-header">Traces gps</li>
                <li role="presentation"><a class="loading-on-click" href="/trace.search" tabindex="-1" role="menuitem">Rechercher</a></li>
                <li role="presentation"><a  href="/#trace_form" tabindex="-1" role="menuitem">Ajouter</a></li>
                <li class="divider" role="presentation"></li>
                <li role="presentation" class="dropdown-header """); //#13

  response.write(Rsp.nnx(menuId)); //#19


  response.write("""-account">"""); //#19

  if (currentUser(request.session) != null) { //if#19

    response.write(Rsp.nnx(currentUser(request.session).login)); //#19

  } //if

  response.write("""</li>
                <li role="presentation"><a  id=\""""); //#19

  response.write(Rsp.nnx(menuId)); //#20


  response.write("""-logout" class="gx-as-link"  tabindex="-1" role="menuitem">Se déconnecter</a></li>
              </ul>
        </div>    
        <div id=\""""); //#20

  response.write(Rsp.nnx(menuId)); //#23


  response.write("""-when-admin" """); //#23

  if (currentUser(request.session) == null || currentUser(request.session) != null  && currentUser(request.session).admin) { //if#23

    response.write("""class="space-menu gx-hidden\""""); //#23

  } else { //else#23

    response.write("""class="space-menu\""""); //#23
  } //if

  response.write(""" >
              <ul role="menu" class="dropdown-menu"  >
                <li role="presentation" class="dropdown-header">Traces gps</li>
                <li role="presentation"><a class="loading-on-click" href="/trace.search" tabindex="-1" role="menuitem">Rechercher</a></li>
                <li role="presentation"><a  href="/#trace_form" tabindex="-1" role="menuitem">Ajouter</a></li>
                <li class="divider" role="presentation"></li>
                <li role="presentation" class="dropdown-header """); //#23

  response.write(Rsp.nnx(menuId)); //#29


  response.write("""-account">"""); //#29

  if (currentUser(request.session) != null) { //if#29

    response.write(Rsp.nnx(currentUser(request.session).login)); //#29

  } //if

  response.write("""</li>
                <li role="presentation"><a  id=\""""); //#29

  response.write(Rsp.nnx(menuId)); //#30


  response.write("""-logout" class="gx-as-link"  tabindex="-1" role="menuitem">Se déconnecter</a></li>
              </ul>
        </div>    
    </div>
    <div class="space-contextual-menu"  ></div>
"""); //#30

  return new Future.value();
}
